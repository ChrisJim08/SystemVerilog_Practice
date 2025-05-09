import types_pkg::*; 
import uvm_pkg::*;
`include "uvm_macros.svh"


class alu_driver extends uvm_driver #(alu_transaction);
  // Register this class with the UVM factory
  `uvm_components_utils("alu_driver")

  // Interface Handle
  virtual alu_interface intf;

  // Constructor
  function new (
    string        name = "alu_driver",
    uvm_component parent = null
  );
    super.new(name, parent);
  endfunction

  // Build Phase
  function void build_phase (
    uvm_phase phase
  );
    super.build_phase(phase);

    // Get interface handle from config DB
    if (!uvm_config_db#(virtual alu_interface)::get(this, "", "vif", intf)) begin
      `uvm_fatal("DRV_IF", "Failed to get alu_interface from config DB")
    end
    
  endfunction

  // Run Phase
  task run_phase (
    uvm_phase phase
  )
    alu_transaction tx;

    forever begin
      @(posedge intf.clk)

        // Get next transaction from sequencer
        seq_item_port.get_next_item(tx);

        // Drive inputs to DUT
        intf.src1   <= tx.src1;
        intf.src2   <= tx.src2;
        intf.alu_op <= tx.alu_op;

        // Wait for a cycle
        @(posedge intf.clk);

        // Capture result from DUT
        tx.result = intf.result;

        // Mark transaction as done
        seq_item_port.item_done();

        `uvm_info("ALU_DRIVER", $sformatf("Drove ALU op %0d with src1=%0h, src2=%0h => result=%0h",
                                         tx.alu_op, tx.src1, tx.src2, tx.result), UVM_MEDIUM)
    end
  endtask

endclass
