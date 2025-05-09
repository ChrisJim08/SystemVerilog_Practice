import uvm_pkg::*;
import types_pkg::*;
`include "uvm_macros.svh"


module alu_tb_top();

  // Clock Generation
  logic clk;
  always #5 clk = ~clk;

  // DUT Interface
  alu_interface alu_if();
  
  // DUT Instantiation
  alu #(
    .DataWidth(32)
  ) dut (
    .src1_i(alu_if.src1),
    .src2_i(alu_if.src2),
    .alu_op_i(alu_if.alu_op),
    .result_o(alu_if.result)
  );

  // Pass interface to UVM and start the test
  initial begin
    // Register the virtual interface with the UVM configuration database
    // This makes the 'alu_if' handle available to any component that requests it
    uvm_config_db #(virtual my_interface)::set(null, "*", "vif", alu_if);

    // Start the UVM testbench runtime
    run_test();
  end


endmodule