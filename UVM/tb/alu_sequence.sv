
class alu_sequence extends uvm_sequence;
  // Register this class with the UVM factory
  `uvm_object_utils(alu_sequence);

  // Constructor
  function new (
    string name ="alu_sequence"
  );
    super.new(name);
    
  endfunction 

  task body ();
    alu_transaction tx;

    repeat(10) begin
      tx = alu_transaction::type_id::create("tx");

      start_item(seq_item);
      
      assert(tx.randomize());

      finish_item(seq_item);
    end
  endtask

endclass
