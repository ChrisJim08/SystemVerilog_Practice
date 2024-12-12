module t_flipflop (
  input  logic  t_in,        // Toggle input
  input  logic  clk_in,      // Clock input (active on negative edge)
  input  logic  reset_in,    // Reset input (active high)
  output logic  q_out        // Flip-flop output
);

  // Sequential always block for flip-flop behavior
  always_ff @(negedge clk_in or posedge reset_in) begin
    if (reset_in) begin
      q_out <= 1'b0; // Asynchronous reset to 0
    end else if (t_in) begin
      q_out <= ~q_out; // Toggle output when t_in is high
    end
  end

endmodule
