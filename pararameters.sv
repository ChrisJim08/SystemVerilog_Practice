module mux2 #(
    parameter width = 8) (       // Default parameter (8)
    input  logic [width-1:0] d0, 
    input  logic [width-1:0] d1,
    input  logic             s,
    output logic [width-1:0] y);
    
  assign y = s ? d1 : d0;

endmodule

module mux4_8(
    input  logic [7:0] d0, 
    input  logic [7:0] d1, 
    input  logic [7:0] d2, 
    input  logic [7:0] d3,
    input  logic [1:0] s,
    output logic [7:0] y);

  logic [7:0] low, hi;

  // Default parameters (width = 8)
  mux2 lowmux(d0,  d1, s[0], low);
  mux2 himux (d2,  d3, s[0], hi);
  mux2 outmux(low, hi, s[1], y);

endmodule

module mux4_12(
    input  logic [11:0] d0, 
    input  logic [11:0] d1, 
    input  logic [11:0] d2, 
    input  logic [11:0] d3,
    input  logic [1:0]  s,
    output logic [11:0] y);

  logic [11:0] low, hi;

  // Parameterized with widths = 12
  mux2 #(12) lowmux(d0,  d1, s[0], low);
  mux2 #(12) himux (d2,  d3, s[0], hi);
  mux2 #(12) outmux(low, hi, s[1], y);

endmodule

module decoder #(
    parameter N = 3) (             // Default parameter (3)
    input     logic [N-1:0]    a,
    output    logic [2**N-1:0] y);

  always_comb
    begin
      y = 0;
      y[a] = 1;
    end

endmodule

module andN #(
    parameter width = 8) (
    input     logic [width-1:0] a,
    output    logic             y);

  genvar            i;
  logic [width-1:0] x;

  generate
    assign x[0] = a[0];
    for(i=1; i<width; i=i+1) begin: forloop
      assign x[i] = a[i] & x[i-1]; end
  endgenerate

  assign y = x[width-1];

endmodule