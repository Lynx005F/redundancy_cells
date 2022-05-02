// Copyright 2020 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
// 
// ECC sram manager (loggs faults, triggers scrubber)

module ecc_manager #(
  parameter int unsigned NumBanks      = 6,
  parameter type         ecc_mgr_req_t = logic,
  parameter type         ecc_mgr_rsp_t = logic
) (
  input  logic                clk_i,
  input  logic                rst_ni,

  input  ecc_mgr_req_t        ecc_mgr_req,
  output ecc_mgr_rsp_t        ecc_mgr_rsp,

  input  logic [NumBanks-1:0] bank_faults
);
  import ecc_manager_reg_pkg::*;

  ecc_manager_reg2hw_t reg2hw;
  ecc_manager_hw2reg_t hw2reg;

  ecc_manager_reg_top #(
    .reg_req_t ( ecc_mgr_req_t ),
    .reg_rsp_t ( ecc_mgr_rsp_t )
  ) i_registers (
    .clk_i     ( clk_i       ),
    .rst_ni    ( rst_ni      ),
    .reg_req_i ( ecc_mgr_req ),
    .reg_rsp_o ( ecc_mgr_rsp ),
    .reg2hw    ( reg2hw      ),
    .hw2reg    ( hw2reg      ),
    .devmode_i ( '0          )
  );

  for (genvar i = 0; i < NumBanks; i++) begin : gen_fault_increment
    assign hw2reg.mismatch_count[i].d = reg2hw.mismatch_count[i].q + 1;
    assign hw2reg.mismatch_count[i].de = bank_faults[i];
  end

endmodule