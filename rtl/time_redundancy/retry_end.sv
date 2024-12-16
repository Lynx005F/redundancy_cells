// Author: Maurus Item <itemm@student.ethz.ch>, ETH Zurich
// Date: 25.04.2024
// Description: retry is a pair of modules that can be used to run an operation
// passing through a (pipelined) combinatorial process.
//
// In order to propperly function:
// - id_o of retry_start needs to be passed paralelly along the combinatorial logic,
//   using the same handshake and arrive at id_i of retry_end
// - interface retry of retry_start needs to be directly connected to retry of retry_end

// - All elements in processing have a unique ID
//
// This modules might cause operations to reach the output of retry_end in a different
// order than they have entered retry_start e.g. can be out-of-order in case of a retry
// so make sure you can deal with out-of-order results.
// For the special case that the process is purely combinatorial, the same operaton is tried again
// in the very next cycle and thus the order is preserved.
// If you need in-order for pipelined processes have a look at retry_inorder instead.

module retry_end # (
    parameter type DataType  = logic,
    // The size of the ID to use as an auxilliary signal
    // For an in-order process, this can be set to 1.
    // For an out of order process, it needs to be big enough so that the out-of-orderness can never
    // rearange the elements with the same id next to each other
    // As an estimate you can use log2(longest_pipeline) + 1
    // Needs to match with retry_start!
    parameter IDSize = 1
) (
    input logic clk_i,
    input logic rst_ni,

    // Upstream connection
    input DataType data_i,
    input logic [IDSize-1:0] id_i,
    input logic needs_retry_i,
    input logic valid_i,
    output logic ready_o,

    // Downstream connection
    output DataType data_o,
    output logic valid_o,
    input logic ready_i,

    // Retry Connection
    retry_interface.ende retry
);
    
    // Assign signals to retry interface
    assign retry.id = id_i;
    assign retry.valid = valid_i;
    assign retry.is_ready = ready_o;
    assign retry.needs_retry = needs_retry_i;

    // No data modification ever, just handshake stuff
    assign data_o = data_i;

    // Set upstream ready if downstream is ready
    // (We could also set it on needs_retry_i but that can cause loops / long crit path)
    assign ready_o = ready_i;

    // Filter out output if result is not fine
    assign valid_o = valid_i & !needs_retry_i & retry.fine;

endmodule


