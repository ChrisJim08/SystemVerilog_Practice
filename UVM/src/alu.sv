`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self-employed
// Engineer: Chris Jimenez
// 
// Create Date: 12/12/2024
// Design Name: 
// Module Name: alu
// Project Name: RISC-V Single-Cycle Processor
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
import types_pkg::*;

module alu #(
  parameter DataWidth = 32
)(
  input  logic [DataWidth-1:0]   src1_i,
  input  logic [DataWidth-1:0]   src2_i,
  input  alu_op_e                alu_op_i,
  output logic [DataWidth-1:0]   result_o
);

always_comb begin
  unique case (alu_op_i)
    ALU_ADD :  result_o = src1_i + src2_i;
    ALU_SUB :  result_o = src1_i - src2_i;
    ALU_XOR :  result_o = src1_i ^ src2_i;
    ALU_OR  :  result_o = src1_i | src2_i;
    ALU_AND :  result_o = src1_i & src2_i;
    ALU_SLL :  result_o = src1_i << src2_i;
    ALU_SRL :  result_o = src1_i >> src2_i;
    ALU_SRA :  result_o = $signed(src1_i) >>> src2_i;
    ALU_SLT :  result_o = ($signed(src1_i)   <  $signed(src2_i))   ? 1 : 0;
    ALU_SLTU:  result_o = ($unsigned(src1_i) <  $unsigned(src2_i)) ? 1 : 0;
    ALU_BEQ :  result_o = (src1_i == src2_i) ? 1 : 0;
    ALU_BNE :  result_o = (src1_i != src2_i) ? 1 : 0;
    ALU_BLT :  result_o = ($signed(src1_i)   <  $signed(src2_i))   ? 1 : 0;
    ALU_BGE :  result_o = ($signed(src1_i)   >= $signed(src2_i))   ? 1 : 0;
    ALU_BLTU:  result_o = ($unsigned(src1_i) <  $unsigned(src2_i)) ? 1 : 0;
    ALU_BGEU:  result_o = ($unsigned(src1_i) >= $unsigned(src2_i)) ? 1 : 0;
  endcase
end

endmodule
