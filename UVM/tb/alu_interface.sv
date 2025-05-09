import types_pkg::*;

interface alu_interface (
  input logic clk
);

  logic [31:0] src1;     
  logic [31:0] src2;        
  alu_op_e     alu_op;      
  logic [31:0] result;     

endinterface 