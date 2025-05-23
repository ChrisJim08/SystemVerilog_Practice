module flopr(
    input  logic       clk,
    input  logic       reset,
    input  logic [3:0] d,
    output logic [3:0] q);

  // asynchronous reset
  always_ff @(posedge clk, posedge reset)
    if (reset) q <= 4'b0;
    else       q <= d;

endmodule

module flopr(
    input  logic       clk,
    input  logic       reset,
    input  logic [3:0] d,
    output logic [3:0] q);

  // synchronous reset
  always_ff @(posedge clk)
    if (reset) q <= 4'b0;
    else       q <= d;

endmodule

module flopen(
    input  logic       clk,
    input  logic       reset,
    input  logic       en,
    input  logic [3:0] d,
    output logic [3:0] q);

  // Enable
  always_ff @(posedge clk)
    if (en)    q <= d;

endmodule