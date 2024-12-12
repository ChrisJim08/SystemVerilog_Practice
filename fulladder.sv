module fulladder(
    input  logic a, 
    input  logic b, 
    input  logic cin,
    output logic s, 
    output logic cout);

  logic p, g;

  always_comb //always @(a, b, cin)
    begin
      p = a ^ b;
      g = a & b;
      s = p ^ cin;
      cout = g | (p & cin);
    end

endmodule