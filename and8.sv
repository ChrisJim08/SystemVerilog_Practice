/* 
  8 1-bit and gate
*/
module and8 (
  input  logic [7:0] a,
  output logic       y
);
    
  assign y = &a;
  //assign y = a[7] & a[6] & a[5] & a[4] & a[3] & a[2] & a[1] & a[0];

endmodule