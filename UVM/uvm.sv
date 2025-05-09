`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Self-employed
// Engineer: Chris Jimenez
// 
// Create Date: 5/8/2024
// Design Name: 
// Module Name: RISC_V
// Project Name: UVM Practice
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*
  UVM (Universal Verificiation Methodogy)
        
      - Framework of SV Classes from which testbenches can be built

      - Set of rules on What, When, and How how to verify 

      - UVM has SV Base Class Library (BCL)

      - Base on OVM (Open Verification Methodology)

      - Constrained Random Verification
          - Idea of using random vectors during testing
          - Great for finding unexpected Bugs
          - 3 C's
              - Checkers    - Knowing if the design work
              - Coverage    - Are done yet? Recording what goes on and identifying the thoroughness (coverage)
              - Constraints - Limits the range of the random inputs. Make sure the values are legal and/or useful

    Advantages
        - Reusability, one testbench can be used on mulitple designs with similar functions
        - 

    Basic Structure

        Components      - Created at zero simulation time                              ?(Componenet Classes)
            - TOP
            - TEST
            - ENVIROMENT
            - DRIVER, SEQUENCER, MONITOR, AGENT

        Objects         - Transient (Created and destroyed as needed during testing)    ?(Data classes)
            - SEQUENCE
            - TRANSACTION (Sequence Item) (Packet)

    How to use
        - `include "uvm_macros.svh"
        - import uvm_pkg::*;                    package that contains basic component classes



*/

module top();

  my_design dut (

  );

  initial begin
    run_test("my_test");
  end

endmodule


/* 
  Generic UVM Component Class

      `include "uvm_macros.svh"

      class my_component exted uvm_component;
          
          // Factory Registration
          `uvm_component_utils(my_component)

          // Virtual Interfaces (for driver & monitor only as they only interface with DUT)
          virtual dut_intf dut_intff_h;

          // Internal uvm_component declarations if any (components inside the component)
          my_sequencer my_sequencer_h;
          my_driver    my_driver_h;

          // Standard uvm_components functions and tasks
          function      new(); ...                      - Construcitor
          function void build_phase(...); ...           
          function void connect_phase(...); ...
          task          run_phase(...); ...
          

      endclass
*/

/*
    Generic UVM Transaction (Object/Packet/Data) Class

        class my_transaction extends uvm_sequence_item;
            
            // Factory Registration
            `uvm_object_utils(my_transaction)

            // Transaction Items (Data Members)
            rand bit [3:0] length;
            rand bit [31:0] data[];

            // Constraints
            constraint data_length{ 
              length >= 1;
            }

            // Standard uvm_sequence_item functions
            function      new(); ...                      - Construcitor
            function void do_copy(...); ...           
            function void do_compare(...); ...

        endclass
*/

/*
    Generic UVM Transaction (Object/Packet/Data) Class

        class my_sequence extends uvm_sequence;
            
            // Factory Registration
            `uvm_object_utils(my_sequence)

            // Data Members (if any)
            int my_id;

            // Standard uvm_sequence functions and task
            function new(); ...                           - Construcitor
            task     body(...); ..                        - Only in sequences

        endclass
*/
