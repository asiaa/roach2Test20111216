# The package naming convention is <core_name>_xmdf
package provide single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5
}
# ::single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5_xmdf::xmdfApplyParams { instance } {

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

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5.edn
utilities_xmdf::xmdfSetData $instance FileSet $fcount type edif
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5.mif
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type coregen_ip
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount associated_module single_port_block_memory_virtex2p_6_1_7e236f8fce9276a5
incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams
