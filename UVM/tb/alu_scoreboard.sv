import types_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"

class alu_scoreboard extends uvm_component;
  `uvm_component_utils(alu_scoreboard)

  // Analysis export to receive from monitor
  uvm_analysis_imp #(alu_transaction, alu_scoreboard) analysis_export;

  // Constructor
  function new (
    string name = "alu_scoreboard",  
    uvm_component parent = null
  );
    super.new(name, parent);
  endfunction

  // Build Phase
  function void build_phase(
    uvm_phase phase
  );
    super.build_phase(phase);

    analysis_export = new("analysis_export", this);
  endfunction

  // Write method — called automatically when monitor sends data
  function void write(alu_transaction tx);
    bit [31:0] expected;

    // Reference model
    case (tx.alu_op)
      ALU_ADD  : expected = tx.src1 + tx.src2;
      ALU_SUB  : expected = tx.src1 - tx.src2;
      ALU_XOR  : expected = tx.src1 ^ tx.src2;
      ALU_OR   : expected = tx.src1 | tx.src2;
      ALU_AND  : expected = tx.src1 & tx.src2;
      ALU_SLL  : expected = tx.src1 << tx.src2;
      ALU_SRL  : expected = tx.src1 >> tx.src2;
      ALU_SRA  : expected = $signed(tx.src1) >>> tx.src2;
      ALU_SLT  : expected = ($signed(tx.src1) <  $signed(tx.src2)) ? 1 : 0;
      ALU_SLTU : expected = ($unsigned(tx.src1) < $unsigned(tx.src2)) ? 1 : 0;
      ALU_BEQ  : expected = (tx.src1 == tx.src2) ? 1 : 0;
      ALU_BNE  : expected = (tx.src1 != tx.src2) ? 1 : 0;
      ALU_BLT  : expected = ($signed(tx.src1) <  $signed(tx.src2)) ? 1 : 0;
      ALU_BGE  : expected = ($signed(tx.src1) >= $signed(tx.src2)) ? 1 : 0;
      ALU_BLTU : expected = ($unsigned(tx.src1) <  $unsigned(tx.src2)) ? 1 : 0;
      ALU_BGEU : expected = ($unsigned(tx.src1) >= $unsigned(tx.src2)) ? 1 : 0;
      default  : expected = 32'hx;
    endcase

    if (tx.result !== expected) begin
      `uvm_error("ALU_SCOREBOARD", $sformatf(
        "Mismatch: ALU op %0d, src1=%0h, src2=%0h, DUT result=%0h, expected=%0h",
        tx.alu_op, tx.src1, tx.src2, tx.result, expected))

    end else begin
      `uvm_info("ALU_SCOREBOARD", $sformatf(
        "PASS: ALU op %0d, src1=%0h, src2=%0h, result=%0h",
        tx.alu_op, tx.src1, tx.src2, tx.result), UVM_LOW)
        
    end
  endfunction

endclass
