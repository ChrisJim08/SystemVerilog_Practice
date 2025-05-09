
class alu_env extends uvm_env;
  // Register this class with the UVM factory
  `uvm_components_utils("alu_env")

  // Agent, Scoreboard Instantiation
  alu_agent agent;
  alu_scoreboard scoreboard;

  // Constructor
  function new (
    string        name = "alu_env",
    uvm_component parent = null
  );
    super.new(name, parent);
  endfunction


  // Build Phase
  function void build_phase (
    uvm_phase phase
  );
    super.build_phase(phase);

    `uvm_info(get_type_name(), "In the build phase", "UVM_MEDIUM");

    scoreboard = alu_scoreboard::type_id::create("scoreboard", this);

    agent = alu_agent::type_id::create("agent", this); 
  endfunction


  //Connect Phase
  function void connect_phase(
    uvm_phase phase
  );
    super.connect_phase(phase);

    agent.monitor.monitor_port.connect(scoreboard.analysis_export);
  endfunction

endclass 
