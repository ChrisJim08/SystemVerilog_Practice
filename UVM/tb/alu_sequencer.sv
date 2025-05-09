
class alu_sequencer extends uvm_sequencer #(alu_transaction);
  // Register this class with the UVM factory
  `uvm_components_utils("alu_sequencer")

  // Constructor
  function new (
    string        name = "alu_sequencer",
    uvm_component parent = null
  );
    super.new(name, parent);
  endfunction

endclass 
