
class alu_test extends uvm_test;
  // Register this class with the UVM factory
  `uvm_components_utils(alu_test);

  // Enviroment Instantiation
  alu_env  env;

  // Constructor 
  function new (
    string        name   = "alu_test",
    uvm_component parent = null
  );
    super.new(name, parent);
  endfunction


  // Build Phase
  function void build_phase (
    uvm_phase phase
  );
    super.build_phase(phase);
    env = alu_env::type_id::create("env", this);
  endfunction


  // Run Phase
  task run_phase (
    uvm_phase phase
  );
    alu_sequence seq;

    phase.raise_objection(this);

    seq = alu_sequence::type_id::create("seq");
    seq.start(env.agent.sequencer); 

    phase.drop_objection(this);
  endtask

endclass
