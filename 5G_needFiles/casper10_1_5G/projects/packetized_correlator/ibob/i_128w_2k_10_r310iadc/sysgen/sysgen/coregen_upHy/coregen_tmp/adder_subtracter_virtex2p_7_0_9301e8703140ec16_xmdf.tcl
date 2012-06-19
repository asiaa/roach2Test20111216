# The package naming convention is <core_name>_xmdf
package provide adder_subtracter_virtex2p_7_0_9301e8703140ec16_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::adder_subtracter_virtex2p_7_0_9301e8703140ec16_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::adder_subtracter_virtex2p_7_0_9301e8703140ec16_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name adder_subtracter_virtex2p_7_0_9301e8703140ec16
}
# ::adder_subtracter_virtex2p_7_0_9301e8703140ec16_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::adder_subtracter_virtex2p_7_0_9301e8703140ec16_xmdf::xmdfApplyParams { instance } {

set fcount 0
# Array containing libraries that are assumed to exist
# Examples include unisim and xilinxcorelib
# Optional
# In this example, we assume that the unisim library will
# be magically
# available to the simulation and synthesis tool
utilities_xmdf::xmdfSetData $instance FileSet $fcount type logical_library
utilities_xmdf::xmdfSetData $instance FileSet $fcount logical_library unisim
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path adder_subtracter_virtex2p_7_0_9301e8703140ec16.edn
utilities_xmdf::xmdfSetData $instance FileSet $fcount type edif
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path adder_subtracter_virtex2p_7_0_9301e8703140ec16.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path adder_subtracter_virtex2p_7_0_9301e8703140ec16.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path adder_subtracter_virtex2p_7_0_9301e8703140ec16.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path adder_subtracter_virtex2p_7_0_9301e8703140ec16.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path adder_subtracter_virtex2p_7_0_9301e8703140ec16.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type coregen_ip
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path adder_subtracter_virtex2p_7_0_9301e8703140ec16_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount associated_module adder_subtracter_virtex2p_7_0_9301e8703140ec16
incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams
