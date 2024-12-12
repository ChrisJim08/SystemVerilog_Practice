module sync_counter(input logic  clk, reset,
                    output logic [2:0] Q );

    logic t2;

    and a1(t2, Q[0], Q[1]);
    
    t_flipflop tff0(1, clk, reset, Q[0]);
    t_flipflop tff1(Q[0], clk, reset, Q[1]);
    t_flipflop tff2(t2, clk, reset, Q[2])

endmodule
