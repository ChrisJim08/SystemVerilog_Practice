package types_pkg;

  typedef enum logic [3:0] {
    ALU_ADD   = 4'h0,
    ALU_SUB   = 4'h1,
    ALU_XOR   = 4'h2,
    ALU_OR    = 4'h3,
    ALU_AND   = 4'h4,
    ALU_SLL   = 4'h5,
    ALU_SRL   = 4'h6,
    ALU_SRA   = 4'h7,
    ALU_SLT   = 4'h8,
    ALU_SLTU  = 4'h9,
    ALU_BEQ   = 4'hA,
    ALU_BNE   = 4'hB,
    ALU_BLT   = 4'hC,
    ALU_BGE   = 4'hD,
    ALU_BLTU  = 4'hE,
    ALU_BGEU  = 4'hF
  } alu_op_e;

endpackage
