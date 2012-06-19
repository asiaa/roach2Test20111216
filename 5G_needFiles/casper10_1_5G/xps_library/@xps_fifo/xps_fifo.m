%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
%   Center for Astronomy Signal Processing and Electronics Research           %
%   http://seti.ssl.berkeley.edu/casper/                                      %
%   Copyright (C) 2006 University of California, Berkeley                     %
%                                                                             %
%   This program is free software; you can redistribute it and/or modify      %
%   it under the terms of the GNU General Public License as published by      %
%   the Free Software Foundation; either version 2 of the License, or         %
%   (at your option) any later version.                                       %
%                                                                             %
%   This program is distributed in the hope that it will be useful,           %
%   but WITHOUT ANY WARRANTY; without even the implied warranty of            %
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             %
%   GNU General Public License for more details.                              %
%                                                                             %
%   You should have received a copy of the GNU General Public License along   %
%   with this program; if not, write to the Free Software Foundation, Inc.,   %
%   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.               %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function b = xps_fifo(blk_obj)

if ~isa(blk_obj,'xps_block')
    error('XPS_FIFO class requires a xps_block class object');
end

if ~strcmp(get(blk_obj,'type'),'xps_fifo')
    error(['Wrong XPS block type: ',get(blk_obj,'type')]);
end

blk_name = get(blk_obj,'simulink_name');
xsg_obj = get(blk_obj,'xsg_obj');
s.hw_sys = 'any';

switch get_param(blk_name,'io_dir')
    case 'From Processor'
        s.io_dir = 'in';
    case 'To Processor'
        s.io_dir = 'out';
end % switch get_param(blk_name','io_dir')

b = class(s,'xps_fifo',blk_obj);

% opb clk

% bus clock
switch get(xsg_obj,'hw_sys')
    case 'ROACH'
        b = set(b,'opb_clk','epb_clk');
    otherwise
        b = set(b,'opb_clk','sys_clk');
end % switch get(xsg_obj,'hw_sys')

% address offset
b = set(b,'opb_address_offset',256);

% misc ports
misc_ports.user_clk = {1 'in'  get(xsg_obj,'clk_src')};
b = set(b,'misc_ports',misc_ports);

% %ip name, software parameters, borph mode
switch get_param(blk_name,'io_dir')
    case 'From Processor'
        b = set(b,'ip_name','opb_asyncfifo_ppc2simulink');
		    b = set(b,'c_params','in');
		    borph_info.mode = 6;
    case 'To Processor'
		    b = set(b,'c_params','out');
		    b = set(b,'ip_name','opb_asyncfifo_simulink2ppc');
		    borph_info.mode = 5;
end % switch get_param('blk_name,'io_dir')

%parameters
parameters.FIFO_LENGTH = num2str(eval_param(blk_name,'fifo_length'));
parameters.FIFO_WIDTH = num2str(eval_param(blk_name,'data_width'));

b = set(b,'parameters',parameters);

% borph parameters
borph_info.size = 512;
b = set(b,'borph_info',borph_info);
