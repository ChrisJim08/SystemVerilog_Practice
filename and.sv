`timescale 1ps/1ps

module and1 #(
  parameter N = 1
)(
  input  logic [N:0] src1_i,
  input  logic [N:0] src2_i,
  output logic [N:0] result_o
);

  assign result_o = src1_i & src2_i;

endmodule