import types_pkg::*; 
import uvm_pkg::*;
`include "uvm_macros.svh"


class alu_monitor extends uvm_monitor;
  // Register this class with the UVM factory
  `uvm_components_utils("alu_monitor ")

  // Interface Handle
  virtual alu_interface intf;

  // Analysis port to send observed transactions to scoreboard or coverage
  uvm_analysis_port #(alu_transaction) monitor_port;

  // Constructor
  function new (
    string        name = "alu_monitor",
    uvm_component parent = null
  );
    super.new(name, parent);
  endfunction


  // Build Phase
  function void build_phase (
    uvm_phase phase
  );

    // Get interface from config DB
    if (!uvm_config_db#(virtual alu_interface)::get(this, "", "vif", intf)) begin
      `uvm_fatal("MON_IF", "Failed to get alu_interface from config DB")
    end

    // Create analysis port
    monitor_port = new("monitor_port", this);
  endfunction


  // Run Phase
  task run_phase (
    uvm_phase phase
  );
    alu_transaction tx; 
    
    forever begin
      @(posedge intf.clk);

        // Sample a transaction from interface signals
        tx = alu_transaction::type_id::create("tx", this);

        tx.src1   = intf.src1;
        tx.src2   = intf.src2;
        tx.alu_op = intf.alu_op;
        tx.result = intf.result;

        // Send it through the analysis port
        monitor_port.write(tx);

        `uvm_info("ALU_MONITOR", $sformatf("Observed ALU op %0d: %0h + %0h = %0h",
                                          tx.alu_op, tx.src1, tx.src2, tx.result), UVM_MEDIUM)
    end
  endtask

endclass
