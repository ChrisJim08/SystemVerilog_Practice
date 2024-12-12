module t_flipflop(input logic  t_in, clk_in, reset_in,
                  output logic q_out);

    always_ff @ (negedge clk_in) begin
        if(reset_in) q_out <= 1'b0;
        else if(t_in) q_out <= ~q_out; end

endmodule