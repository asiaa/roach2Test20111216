# The package naming convention is <core_name>_xmdf
package provide binary_counter_virtex5_10_0_1ee993c8ed57b9ce_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::binary_counter_virtex5_10_0_1ee993c8ed57b9ce_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::binary_counter_virtex5_10_0_1ee993c8ed57b9ce_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name binary_counter_virtex5_10_0_1ee993c8ed57b9ce
}
# ::binary_counter_virtex5_10_0_1ee993c8ed57b9ce_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::binary_counter_virtex5_10_0_1ee993c8ed57b9ce_xmdf::xmdfApplyParams { instance } {

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

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce.edn
utilities_xmdf::xmdfSetData $instance FileSet $fcount type edif
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce.veo
utilities_xmdf::xmdfSetData $instance FileSet $fcount type verilog_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type coregen_ip
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce_c_counter_binary_v10_0_xst_1.ndf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce_c_counter_binary_v10_0_xst_1.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce_c_counter_binary_v10_0_xst_1.ngc_xst.xrpt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path binary_counter_virtex5_10_0_1ee993c8ed57b9ce_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path core_resources.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type text
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path gui_latency.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type text
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount associated_module binary_counter_virtex5_10_0_1ee993c8ed57b9ce
incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams
