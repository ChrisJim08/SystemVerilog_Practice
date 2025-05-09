# compile.do
vlib work
vmap work work

# Compile UVM library (if not auto-included)
vlog -sv +acc +define+UVM_NO_DEPRECATED +incdir+$UVM_HOME/src $UVM_HOME/src/uvm_pkg.sv

# Compile your design and testbench files
vlog -sv +acc src/alu.sv
vlog -sv +acc src/types_pkg.sv
vlog -sv +acc tb/alu_interface.sv
vlog -sv +acc tb/alu_transaction.sv
vlog -sv +acc tb/alu_sequence.sv
vlog -sv +acc tb/alu_sequencer.sv
vlog -sv +acc tb/alu_driver.sv
vlog -sv +acc tb/alu_monitor.sv
vlog -sv +acc tb/alu_scoreboard.sv
vlog -sv +acc tb/alu_agent.sv
vlog -sv +acc tb/alu_env.sv
vlog -sv +acc tb/alu_test.sv
vlog -sv +acc tb/alu_tb_top.sv
