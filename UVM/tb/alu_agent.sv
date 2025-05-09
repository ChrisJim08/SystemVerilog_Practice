
class alu_agent extends uvm_agent;
  // Register this class with the UVM factory
  `uvm_components_utils("alu_agent")

  // Sequenencer, Driver, Monitor Instantiation
  alu_sequencer sequencer;
  alu_driver    driver;
  alu_monitor   monitor;

  // Constructor
  function new (
    string        name = "alu_agent",
    uvm_component parent = null
  );
    super.new(name, parent);
  endfunction

  
  // Build Phase
  function void build_phase (
    uvm_phase phase
  );
    sequencer = alu_sequencer::type_id::create("sequencer", this);
    driver    = alu_driver::type_id::create("driver", this);
    monitor   = alu_monitor::type_id::create("monitor", this);
  endfunction


  //Connect Phase
  function void connect_phase(
    uvm_phase phase
  );
    super.connect_phase(phase);

    // Connect driver to sequencer
    driver.seq_item_port.connect(sequencer.seq_item_export)
  endfunction
  
endclass
