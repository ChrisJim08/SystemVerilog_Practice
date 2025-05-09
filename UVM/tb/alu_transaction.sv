import types_pkg::*;


class alu_transaction extends uvm_sequence_item;
  // Register this class with the UVM factory
  `uvm_object_utils(alu_transaction)

  // Request Items
  rand bit [31:0] src1;
  rand bit [31:0] src2;
  rand alu_op_e   alu_op;

  // Response Items
  bit [31:0] result;

  // Constructor
  function new (
    string name = "alu_transaction"
  );
    super.new(name);
  endfunction

endclass
