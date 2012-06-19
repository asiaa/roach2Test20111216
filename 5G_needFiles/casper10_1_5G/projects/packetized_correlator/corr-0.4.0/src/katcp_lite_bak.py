"""Client for communicating with a correlator over
   KATCP.

   @author Simon Cross <simon.cross@ska.ac.za>
   @modified Jason Manley <jason_manley@hotmail.com>
   """

import struct, re, threading, socket, select, traceback, logging, sys, time
log = logging.getLogger("katcp")
 
class DeviceMetaclass(type):
    """Metaclass for DeviceServer and DeviceClient classes.

       Collects up methods named request_* and adds
       them to a dictionary of supported methods on the class.
       All request_* methods must have a doc string so that help
       can be generated.  The same is done for inform_* and
       reply_* methods.
       """
    def __init__(mcs, name, bases, dct):
        """Constructor for DeviceMetaclass.  Should not be used directly.

           @param mcs The metaclass instance
           @param name The metaclass name
           @param bases List of base classes
           @param dct Class dict
        """
        super(DeviceMetaclass, mcs).__init__(name, bases, dct)
        mcs._request_handlers = {}
        mcs._inform_handlers = {}
        mcs._reply_handlers = {}
        def convert(prefix, name):
            """Convert a method name to the corresponding command name."""
            return name[len(prefix):].replace("_","-")
        for name in dir(mcs):
            if not callable(getattr(mcs, name)):
                continue
            if name.startswith("request_"):
                request_name = convert("request_", name)
                mcs._request_handlers[request_name] = getattr(mcs, name)
                assert(mcs._request_handlers[request_name].__doc__ is not None)
            elif name.startswith("inform_"):
                inform_name = convert("inform_", name)
                mcs._inform_handlers[inform_name] = getattr(mcs, name)
                assert(mcs._inform_handlers[inform_name].__doc__ is not None)
            elif name.startswith("reply_"):
                reply_name = convert("reply_", name)
                mcs._reply_handlers[reply_name] = getattr(mcs, name)
                assert(mcs._reply_handlers[reply_name].__doc__ is not None)

class KatcpDeviceError(Exception):
    """Exception raised by KATCP clients and servers when errors occur will
       communicating with a device.  Note that socket.error can also be raised
       if low-level network exceptions occure."""
    pass


class DeviceClient(object):
    """Device client proxy.

       Subclasses should implement .reply_*, .inform_* and
       request_* methods to take actions when messages arrive,
       and implement unhandled_inform, unhandled_reply and
       unhandled_request to provide fallbacks for messages for
       which there is no handler.

       Request messages can be sent by calling .request().
       """

    __metaclass__ = DeviceMetaclass

    def __init__(self, host, port, tb_limit=20, timeout=5.0, logger=log):
        """Create a basic DeviceClient.

           @param self This object.
           @param host String: host to connect to.
           @param port Integer: port to connect to.
           @param tb_limit Integer: maximum number of stack frames to
                           send in error traceback.
           @param logger Object: Logger to log to.

           """
        self._parser = MessageParser()
        self._bindaddr = (host, port)
        self._tb_limit = tb_limit
        self._sock = None
        self._waiting_chunk = ""
        self._running = threading.Event()
        self._connected = threading.Event()
        self._thread = None
        self._logger = logger


    def request(self, msg):
        """Send a request messsage.

           @param self This object.
           @param msg The request Message to send.
           @return None
           """
        assert(msg.mtype == Message.REQUEST)
#        self._sock.send(str(msg) + "\n")
        self.send_message(msg)

    def send_message(self, msg):
        """Send any kind of message.

           @param self This object.
           @param msg The Message to send.
           @return None
           """
        if self._sock is None:
            self._logger.error("Attempt to send a message to unconnected server.")
            raise KatcpDeviceError("Client not connected")
        self._sock.send(str(msg) + "\n")

    def connect(self):
        """Connect to the server.

           @param self This object.
           @return None
           """
        self._sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            self._sock.connect(self._bindaddr)
            self._waiting_chunk = ""
            self._connected.set()
            self.notify_connected(True)
            self._logger.info("Connected to server established.")
        except Exception:
            self._logger.exception("DeviceClient failed to connect.")
            self.disconnect()
    
        #self._sock.connect(self._bindaddr)
        #self._waiting_chunk = ""
        #self._connected.set()
        #self.notify_connected(True)

    def disconnect(self):
        """Disconnect and cleanup.
        
           @param self This object
           @return None
           """
        if self._sock is not None:
            self._sock.close()
            self._connected.clear()
            self.notify_connected(False)
        self._sock = None

    def handle_chunk(self, chunk):
        """Handle a chunk of data from the server.

           @param self This object.
           @param chunk The data string to process.
           @return None
           """
        chunk = chunk.replace("\r", "\n")
        lines = chunk.split("\n")

        for line in lines[:-1]:
            full_line = self._waiting_chunk + line
            self._waiting_chunk = ""
            if full_line:
                msg = self._parser.parse(full_line)
                self.handle_message(msg)

        self._waiting_chunk += lines[-1]
    def handle_message(self, msg):
        """Handle a message from the server.

           @param self This object.
           @param msg The Message to process.
           @return None
           """
        if msg.mtype == Message.INFORM:
            self.handle_inform(msg)
        elif msg.mtype == Message.REPLY:
            self.handle_reply(msg)
        elif msg.mtype == Message.REQUEST:
            self.handle_request(msg)
        else:
            self._logger.error("Unexpected message type from server ['%s']."
                % (msg,))

    def handle_inform(self, msg):
        """Dispatch an inform message to the appropriate method."""
        method = self.__class__.unhandled_inform
        if msg.name in self._inform_handlers:
            method = self._inform_handlers[msg.name]

        try:
            method(self, msg)
        except Exception:
            e_type, e_value, trace = sys.exc_info()
            reason = "\n".join(traceback.format_exception(
                e_type, e_value, trace, self._tb_limit))
            self._logger.error("Inform %s FAIL: %s" % (msg.name, reason))

    def handle_reply(self, msg):
        """Dispatch a reply message to the appropriate method."""
        method = self.__class__.unhandled_reply
        if msg.name in self._reply_handlers:
            method = self._reply_handlers[msg.name]

        try:
            method(self, msg)
        except Exception:
            e_type, e_value, trace = sys.exc_info()
            reason = "\n".join(traceback.format_exception(
                e_type, e_value, trace, self._tb_limit
            ))
            self._logger.error("Reply %s FAIL: %s" % (msg.name, reason))

    def handle_request(self, msg):
        """Dispatch a request message to the appropriate method."""
        method = self.__class__.unhandled_request
        if msg.name in self._request_handlers:
            method = self._request_handlers[msg.name]

        try:
            reply = method(self, msg)
            assert (reply.mtype == Message.REPLY)
            assert (reply.name == msg.name)
            self._logger.info("%s OK" % (msg.name,))
            self._sock.send(str(reply) + "\n")
        # We do want to catch everything that inherits from Exception
        # pylint: disable-msg = W0703
        except Exception:
            e_type, e_value, trace = sys.exc_info()
            reason = "\n".join(traceback.format_exception(
                e_type, e_value, trace, self._tb_limit
            ))
            self._logger.error("Request %s FAIL: %s" % (msg.name, reason))

    def unhandled_inform(self, msg):
        """Fallback method for inform messages without a registered handler"""
        self._logger.info("Unhandled Inform: %s"%msg)
        pass

    def unhandled_reply(self, msg):
        """Fallback method for reply messages without a registered handler"""
        self._logger.info("Unhandled Reply: %s"%msg)
        pass

    def unhandled_request(self, msg):
        """Fallback method for requests without a registered handler"""
        self._logger.info("Unhandled Request: %s"%msg)
        pass

    def run(self):
        """Process reply and inform messages from the server.

           @param self This object.
           @return None
           """
        self._logger.debug("Starting thread %s" % (threading.currentThread().getName()))
        timeout = 1.0 # s

        self._running.set()
        while self._running.isSet():
            if self.is_connected():
                readers, _writers, errors = select.select(
                    [self._sock], [], [self._sock], timeout
                )

                if errors:
                    self.disconnect()

                elif readers:
                    chunk = self._sock.recv(4096)
                    if chunk:
                        self.handle_chunk(chunk)
                    else:
                        # EOF from server
                        self.disconnect()
            else:
                # not currently connected so attempt to connect
                self.connect()
                if not self.is_connected():
                    time.sleep(timeout)

        self.disconnect()
        self._logger.debug("Stopping thread %s" % (threading.currentThread().getName()))

    def start(self, timeout=None):
        """Start the client in a new thread.

           @param self This object.
           @param timeout Seconds to wait for server thread to start (as a float).
           @return None
           """
        if self._thread:
            raise RuntimeError("Device client already started.")

        self._thread = threading.Thread(target=self.run)
        self._thread.start()
        if timeout:
            self._connected.wait(timeout)
            if not self._connected.isSet():
                raise RuntimeError("Device client failed to start.")

    def join(self, timeout=None):
        """Rejoin the client thread.

           @param self This object.
           @param timeout Seconds to wait for server thread to complete (as a float).
           @return None
           """
        if not self._thread:
            raise RuntimeError("Device client thread not started.")

        self._thread.join(timeout)
        self._logger.debug("Stopping thread %s" % (threading.currentThread().getName()))
        if not self._thread.isAlive():
            self._thread = None

    def stop(self, timeout=1.0):
        """Stop a running client (from another thread).

           @param self This object.
           @param timeout Seconds to wait for client to have *started* (as a float).
           @return None
           """
        self._running.wait(timeout)
        if not self._running.isSet():
            raise RuntimeError("Attempt to stop client that wasn't running.")
        self._running.clear()

    def running(self):
        """Whether the client is running.

           @param self This object.
           @return Whether the server is running (True or False).
           """
        return self._running.isSet()

    def is_connected(self):
        """Check if the socket is current connected.
        
           @param self This object
           @return Whether the client is connected (True or False).
           """
        return self._sock is not None

    def notify_connected(self, connected):
        """Event handler that is called wheneved the connection status changes.
           Override in derived class for desired behaviour.
        
           @param self This object
           @param connected The current connection state (True or False)
           """
        pass


class Message(object):
    """Represents a KAT device control language message."""

    # Message types
    REQUEST, REPLY, INFORM = range(3)

    # Reply codes
    # TODO: make use of reply codes in device client and server
    OK, FAIL, INVALID = "ok", "fail", "invalid"

    ## @brief Mapping from message type to string name for the type.
    TYPE_NAMES = {
        REQUEST: "REQUEST",
        REPLY: "REPLY",
        INFORM: "INFORM",
    }

    ## @brief Mapping from message type to type code character.
    TYPE_SYMBOLS = {
        REQUEST: "?",
        REPLY: "!",
        INFORM: "#",
    }

    # pylint fails to realise TYPE_SYMBOLS is defined
    # pylint: disable-msg = E0602

    ## @brief Mapping from type code character to message type.
    TYPE_SYMBOL_LOOKUP = dict((v, k) for k, v in TYPE_SYMBOLS.items())

    # pylint: enable-msg = E0602

    ## @brief Mapping from escape character to corresponding unescaped string.
    ESCAPE_LOOKUP = {
        "\\" : "\\",
        "_": " ",
        "0": "\0",
        "n": "\n",
        "r": "\r",
        "e": "\x1b",
        "t": "\t",
        "@": "",
    }
    # pylint fails to realise ESCAPE_LOOKUP is defined
    # pylint: disable-msg = E0602

    ## @brief Mapping from unescaped string to corresponding escape character.
    REVERSE_ESCAPE_LOOKUP = dict((v, k) for k, v in ESCAPE_LOOKUP.items())

    # pylint: enable-msg = E0602

    ## @brief Regular expression matching all unescaped character.
    ESCAPE_RE = re.compile(r"[\\ \0\n\r\x1b\t]")

    ## @var mtype
    # @brief Message type.

    ## @var name
    # @brief Message name.

    ## @var arguments
    # @brief List of string message arguments.

    def __init__(self, mtype, name, arguments=None):
        """Create a KATCP Message.

           @param self This object.
           @param mtype Message::Type constant.
           @param name String: message name.
           @param arguments List of strings: message arguments.
           """
        self.mtype = mtype
        self.name = name
        if arguments is None:
            self.arguments = []
        else:
            self.arguments = [str(arg) for arg in arguments]

        # check message type

        if mtype not in self.TYPE_SYMBOLS:
            raise KatcpSyntaxError("Invalid command type %r." % (mtype,))

        # check command name validity

        if not name:
            raise KatcpSyntaxError("Command missing command name.")
        if not name.replace("-","").isalnum():
            raise KatcpSyntaxError("Command name should consist only of"
                                " alphanumeric characters and dashes (got %r)."
                                % (name,))
        if not name[0].isalpha():
            raise KatcpSyntaxError("Command name should start with an"
                                " alphabetic character (got %r)."
                                % (name,))

    def __str__(self):
        """Return Message serialized for transmission.

           @param self This object.
           @return Message encoded as a ASCII string.
           """
        if self.arguments:
            escaped_args = [self.ESCAPE_RE.sub(self._escape_match, x)
                            for x in self.arguments]
            escaped_args = [x or "\\@" for x in escaped_args]
            arg_str = " " + " ".join(escaped_args)
        else:
            arg_str = ""

        return "%s%s%s" % (self.TYPE_SYMBOLS[self.mtype], self.name, arg_str)

    def _escape_match(self, match):
        """Given a re.Match object, return the escape code for it."""
        return "\\" + self.REVERSE_ESCAPE_LOOKUP[match.group()]
    # * and ** magic useful here
    # pylint: disable-msg = W0142

    @classmethod
    def request(cls, name, *args):
        """Helper method for creating request messages."""
        return cls(cls.REQUEST, name, args)

    @classmethod
    def reply(cls, name, *args):
        """Helper method for creating reply messages."""
        return cls(cls.REPLY, name, args)

    @classmethod
    def inform(cls, name, *args):
        """Helper method for creating inform messages."""
        return cls(cls.INFORM, name, args)

    # pylint: enable-msg = W0142


class KatcpSyntaxError(ValueError):
    """Exception raised by parsers on encountering syntax errors."""
    pass


class MessageParser(object):
    """Parses lines into Message objects."""

    # We only want one public method
    # pylint: disable-msg = R0903

    ## @brief Copy of TYPE_SYMBOL_LOOKUP from Message.
    TYPE_SYMBOL_LOOKUP = Message.TYPE_SYMBOL_LOOKUP

    ## @brief Copy of ESCAPE_LOOKUP from Message.
    ESCAPE_LOOKUP = Message.ESCAPE_LOOKUP

    ## @brief Regular expression matching all special characters.
    SPECIAL_RE = re.compile(r"[\0\n\r\x1b\t ]")

    ## @brief Regular expression matching all escapes.
    UNESCAPE_RE = re.compile(r"\\(.?)")

    ## @brief Regular expresion matching KATCP whitespace (just space and tab)
    WHITESPACE_RE = re.compile(r"[ \t]+")

    def _unescape_match(self, match):
        """Given an re.Match, unescape the escape code it represents."""
        char = match.group(1)
        if char in self.ESCAPE_LOOKUP:
            return self.ESCAPE_LOOKUP[char]
        elif not char:
            raise KatcpSyntaxError("Escape slash at end of argument.")
        else:
            raise KatcpSyntaxError("Invalid escape character %r." % (char,))

    def _parse_arg(self, arg):
        """Parse an argument."""
        match = self.SPECIAL_RE.search(arg)
        if match:
            raise KatcpSyntaxError("Unescaped special %r." % (match.group(),))
        return self.UNESCAPE_RE.sub(self._unescape_match, arg)

    def parse(self, line):
        """Parse a line, return a Message.

           @param self This object.
           @param line a string to parse.
           @return the resulting Message.
           """
        # find command type and check validity
        if not line:
            raise KatcpSyntaxError("Empty message received.")

        type_char = line[0]
        if type_char not in self.TYPE_SYMBOL_LOOKUP:
            raise KatcpSyntaxError("Bad type character %r." % (type_char,))

        mtype = self.TYPE_SYMBOL_LOOKUP[type_char]

        # (removing possible empty argument resulting from whitespace at end of command)
        parts = self.WHITESPACE_RE.split(line)
        if not parts[-1]:
            del parts[-1]
        name = parts[0][1:]
        arguments = [self._parse_arg(x) for x in parts[1:]]

        return Message(mtype, name, arguments)

    @staticmethod
    def log_to_python(logger, msg):
     """Log a KATCP logging message to a Python logger."""
     (level, timestamp, name, message) = tuple(msg.arguments)
     #created = float(timestamp) * 1e-6
     #msecs = int(timestamp) % 1000
     log_string = "%s %s: %s" % (timestamp, name, message)
     logger.log({"trace": 0,
                 "debug": logging.DEBUG,
                 "info": logging.INFO,
                 "warn": logging.WARN,
                 "error": logging.ERROR,
                 "fatal": logging.FATAL}[level], log_string)#, extra={"created": created})



class BlockingClient(DeviceClient):
    """Implement blocking requests on top of DeviceClient."""

    def __init__(self, host, port, tb_limit=20, timeout=5.0, logger=log):
        """Create a basic BlockingClient.

           @param self This object.
           @param host String: host to connect to.
           @param port Integer: port to connect to.
           @param tb_limit Integer: maximum number of stack frames to
                           send in error traceback.
           @param timeout Float: seconds to wait before a blocking request
                          times out.
           @param logger Object: Logger to log to.
           """
        super(BlockingClient, self).__init__(host, port, tb_limit=tb_limit,
            logger=logger)

        self._request_timeout = timeout

        self._request_end = threading.Event()
        self._request_lock = threading.Lock()
        self._current_name = None
        self._current_informs = None
        self._current_reply = None

    def blocking_request(self, msg):
        """Send a request messsage.

           @param self This object.
           @param msg The request Message to send.
           @return The a tuple containing the reply Message and a list of
                   inform messages.
           """
        try:
            self._request_lock.acquire()
            self._request_end.clear()
            self._current_name = msg.name
            self._current_informs = []
            self._current_reply = None
        finally:
            self._request_lock.release()

        try:
            self.request(msg)
            self._request_end.wait(self._request_timeout)
        finally:
            try:
                self._request_lock.acquire()

                success = self._request_end.isSet()
                informs = self._current_informs
                reply = self._current_reply

                self._request_end.clear()
                self._current_informs = None
                self._current_reply = None
                self._current_name = None
            finally:
                self._request_lock.release()

        if success:
            return reply, informs
        else:
            self._logger.error("Request %s timeout out after %s seconds." %
                                (msg.name, self._request_timeout))

            raise RuntimeError("Request %s timeout out after %s seconds." %
                                (msg.name, self._request_timeout))
    def handle_inform(self, msg):
        """Handle inform messages related to any current requests.

           Inform messages not related to the current request go up
           to the base class method.
           """
        try:
            self._request_lock.acquire()
            if msg.name == self._current_name:
                #print 'HANDLED BLOCKING INFORM: ', msg
                self._current_informs.append(msg)
                return
        finally:
            self._request_lock.release()

        super(BlockingClient, self).handle_inform(msg)

    def handle_reply(self, msg):
        """Handle a reply message related to the current request.

           Reply messages not related to the current request go up
           to the base class method.
           """
        try:
            self._request_lock.acquire()
            if msg.name == self._current_name:
                #print 'HANDLED BLOCKING REPLY: ', msg
                # unset _current_name so that no more replies or informs
                # match this request
                self._current_name = None
                self._current_reply = msg
                self._request_end.set()
                return
        finally:
            self._request_lock.release()

        super(BlockingClient, self).handle_reply(msg)



class FpgaClient(BlockingClient):
    """Client for communicating with a ROACH board.

       Notes:
         - All commands are blocking.
         - If there is no response to an issued command, an exception is thrown
           with appropriate message after a timeout waiting for the response.
         - If the TCP connection dies, an exception is thrown with an
           appropriate message.
       """

    def __init__(self, host, port, tb_limit=20, timeout=5.0, logger=log):
        """Create a basic DeviceClient.

           @param self  This object.
           @param host  String: host to connect to.
           @param port  Integer: port to connect to.
           @param tb_limit  Integer: maximum number of stack frames to
                            send in error traceback.
           @param timeout  Float: seconds to wait before timing out on
                           client operations.
           @param logger Object: Logger to log to.
           """
        super(FpgaClient, self).__init__(host, port, tb_limit=tb_limit,timeout=timeout, logger=logger)
        self._timeout = timeout
        self.start()

    def _request(self, name, *args):
        """Make a blocking request and check the result.
        
           Raise an error if the reply indicates a request failure.

           @param self  This object.
           @param name  String: name of the request message to send.
           @param args  List of strings: request arguments.
           @return  Tuple: containing the reply and a list of inform messages.
           """
        request = Message.request(name, *args)
        reply, informs = self.blocking_request(request)

        if reply.arguments[0] != Message.OK:
            self._logger.error("Request %s failed.\n  Request: %s\n  Reply: %s."
                    % (request.name, request, reply))

            raise RuntimeError("Request %s failed.\n  Request: %s\n  Reply: %s."
                    % (request.name, request, reply))
        return reply, informs

    def listdev(self):
        """Return a list of register / device names.

           @param self  This object.
           @return  A list of register names.
           """
        reply, informs = self._request("listdev")
        return [i.arguments[0] for i in informs]

    def listbof(self):
        """Return a list of executable files.

           @param self  This object.
           @return  List of strings: list of executable files.
           """
        reply, informs = self._request("listbof")
        return [i.arguments[0] for i in informs]

    def listcmd(self):
        """Return a list of available commands. this should not be made  
           available to the user, but can be used internally to query if a
           command is supported.

           @todo  Implement or remove.
           @param self  This object.
           """
        raise NotImplementedError("LISTCMD not implemented by client.")

    def progdev(self, device_name):
        """Return a status string for the given device.

           @param self  This object.
           @param device_name  String: name of the device.
           @return  String: device status.
           """
        reply, informs = self._request("progdev", device_name)
        return reply.arguments[0]

    def status(self):
        """Return the status of the FPGA.

           @param self  This object.
           @return  String: FPGA status.
           """
        reply, informs = self._request("status")
        return reply.arguments[1]

    def execcmd(self, string):
        """Not yet supported.

           @todo  Implement or remove.
           @param self  This object.
           """
        raise NotImplementedError(
            "EXEC not implemented by client.")

    def read(self, device_name, size, offset=0):
        """Return size_bytes of binary data with carriage-return
           escape-sequenced.

           Else error returned along with string (eg, requested size invalid,
           offset exceeds size of file, device not programmed, invalid register  
           etc).

           @param self  This object.
           @param device_name  String: name of device / register to read from.
           @param size  Integer: amount of data to read (in bytes).
           @param offset  Integer: offset to read data from (in bytes).
           @return  Bindary string: data read.
           """
        reply, informs = self._request("read", device_name, str(offset),
            str(size))
        return reply.arguments[1]

    def write(self, device_name, data, offset=0):
        """Should issue a read command after the write and compare return to
           the string argument to confirm that data was successfully written.

           Throw exception if not match. (alternative command 'blindwrite' does
           not perform this confirmation).

           @see blindwrite
           @param self  This object.
           @param device_name  String: name of device / register to write to.
           @param data  Byte string: data to write.
           @param offset  Integer: offset to write data to (in bytes)
           """
        self.blindwrite(device_name, data, offset)
        new_data = self.read(device_name, len(data), offset)
        if new_data != data:
            self._logger.error("Verification of write to %s at offset %d failed."
                % (device_name, offset))

            raise RuntimeError("Verification of write to %s at offset %d failed."
                % (device_name, offset))

    def blindwrite(self, device_name, data, offset=0):
        """Unchecked data write.

           @see write
           @param self  This object.
           @param device_name  String: name of device / register to write to.
           @param data  Byte string: data to write.
           @param offset  Integer: offset to write data to (in bytes)
           """
        assert((type(data)==str))
        self._request("write", device_name, str(offset), data)

    def read_int(self, device_name):
        """Calls .read() command with size=4, offset=0 and
           unpacks returned four bytes into signed 32bit integer.

           @see read
           @param self  This object.
           @param device_name  String: name of device / register to read.
           @return  Integer: value read.
           """
        data = self.read(device_name, 4, 0)
        return struct.unpack(">i", data)[0]

    def write_int(self, device_name, integer):
        """Calls .write() with offset=0 and integer packed into 4 bytes.

           @see write
           @param self  This object.
           @param device_name  String: name of device / register to write to.
           @param integer  Integer: value to write.
           """
        # careful of packing input data into 32 bit - check range: if
        # negative, must be signed int; if positive over 2^16, must be unsigned
        # int.
        if integer < 0:
            data = struct.pack(">i", integer)
        else:
            data = struct.pack(">I", integer)
        self.write(device_name, data, 0)

    def read_uint(self, device_name):
        """As in .read_int(), but unpack into 32 bit unsigned int.

           @see read_int
           @param self  This object.
           @param device_name  String: name of device / register to read from.
           @return  Integer: value read.
           """
        data = self.read(device_name, 4, 0)
        return struct.unpack(">I", data)[0]

    def stop(self):
        """Stop the client.

           @param self  This object.
           """
        super(FpgaClient,self).stop()
        self.join(timeout=self._timeout)
