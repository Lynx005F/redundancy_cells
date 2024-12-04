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

`include "common_cells/registers.svh"


module retry_start # (
    parameter type DataType  = logic,
    // The size of the ID to use as an auxilliary signal
    // For an in-order process, this can be set to 1.
    // For an out of order process, it needs to be big enough so that the out-of-orderness can never
    // rearange the elements with the same id next to each other
    // As an estimate you can use log2(longest_pipeline) + 1
    // Needs to match with retry_end!
    parameter IDSize = 1,
    // Amount of bits from the ID which are defined externally and should not be incremented.
    // This allows for seperating the ID spaces into multiple sections, which will behave and overwrite
    // each other indefinitely. For example, if you set IDSize=3 and ExternalIDBits=1, then you will get 
    // two sets of IDs which each cycle through the ID.
    // Set 1: 000, 001, 010, 011
    // Set 2: 100, 101, 110, 111
    // You can use this to reduce storage space required if some operations take significantly longer in
    // the pipelines than others. E.g. use Set 1 with operations done in 1 cycle, and Set 2 with operations 
    // that take 10 cycles. Each subset must satisfy the required ID Size of log2(longest_pipeline) + 1, 
    // excluding the bits used to distinguish the sets.
    parameter ExternalIDBits = 0,
    // Physical width of the ID bits input so that the case of 0 is well defined
    // Must be equal or greater than the ExternalIDBits that are actually used
    parameter ExternalIDWidth = (ExternalIDBits == 0) ? 1 : ExternalIDBits, 
    localparam NormalIDSize = IDSize - ExternalIDBits
) (
    input logic clk_i,
    input logic rst_ni,

    // Upstream connection
    input DataType data_i,
    input logic valid_i,
    output logic ready_o,
    input logic [ExternalIDWidth-1:0] ext_id_bits_i,

    // Downstream connection
    output DataType data_o,
    output logic [IDSize-1:0] id_o,
    output logic valid_o,
    input logic ready_i,

    // Retry Connection
    retry_interface.start retry
);
    

    //////////////////////////////////////////////////////////////////////
    // Register to store failed id for one cycle
    logic [IDSize-1:0] failed_id_q;
    logic retry_valid_q;
    logic retry_ready, internal_ready;
    logic retry_reg_ena;

    // Internal register enable for this stage
    // Upstream ready is only defined by the current register (otherwise there would be a ready loop)
    // But internal pipereg is determined also by downstream ready
    assign retry.ready = ~retry_valid_q;
    assign internal_ready = (~retry_valid_q | retry_ready);
    assign retry_reg_ena = retry.valid & internal_ready;

    `FFL(retry_valid_q, retry.valid, internal_ready, '0); // Valid signal only depends on ready as standard
    `FFL(  failed_id_q, retry.id,    retry_reg_ena, '0);

    //////////////////////////////////////////////////////////////////////
    // ID Counter, triggers on all outputs

    logic [IDSize-1:0] counter_id_d, counter_id_q;
    logic out_reg_ena;

    assign out_reg_ena = valid_o & ready_i;

    always_comb begin: gen_id_counter
        if (out_reg_ena) begin

            // The topmost ID bits are not incremented but are controlled externally if 
            // required to split the storage area into sections. In this case get it from external
            // or take it from the element to retry.
            counter_id_d[NormalIDSize-1:0] = counter_id_q[NormalIDSize-1:0] + 1;
            if (ExternalIDBits > 0) begin
                if (retry_valid_q) begin
                    counter_id_d[IDSize-1: NormalIDSize] = failed_id_q[IDSize-1: NormalIDSize];
                end else begin
                    counter_id_d[IDSize-1: NormalIDSize] = ext_id_bits_i[ExternalIDBits-1 :0];
                end
            end

        end else begin
            counter_id_d = counter_id_q;
        end
    end

    `FF(counter_id_q, counter_id_d, 0);

    assign id_o = counter_id_q;

    //////////////////////////////////////////////////////////////////////
    // General Element storage, stores all outputs

    logic [2 ** IDSize -1:0][$bits(DataType)-1:0] data_storage_d, data_storage_q;

    always_comb begin: gen_failed_state
        // Keep data as is as abase
        data_storage_d = data_storage_q;

        if (out_reg_ena) begin
            data_storage_d[counter_id_q] = data_o;
        end
    end

    `FF(data_storage_q, data_storage_d, 0);

    //////////////////////////////////////////////////////////////////////
    // Switch between retry and non-retry output

    logic retry_switch;

    // We need another FF here so we surely store if we need to switch
    // until the previous data is gone - which is different from storing
    // the retry element.
    `FFL(retry_switch, retry.valid, out_reg_ena, 0);

    always_comb begin
        if (retry_switch) begin
            ready_o = '0;
            valid_o = '1;
            retry_ready = ready_i;
            data_o = data_storage_q[failed_id_q];
        end else begin
            ready_o = ready_i;
            retry_ready = '0;
            valid_o = valid_i;
            data_o = data_i;
        end
    end

endmodule
