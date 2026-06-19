module wallace_tree(
    input  [703:0] pp,
    output [63:0] sum,
    output [63:0] carry
);

wire [63:0] pp0  = pp[63:0];
wire [63:0] pp1  = pp[127:64];
wire [63:0] pp2  = pp[191:128];
wire [63:0] pp3  = pp[255:192];
wire [63:0] pp4  = pp[319:256];
wire [63:0] pp5  = pp[383:320];
wire [63:0] pp6  = pp[447:384];
wire [63:0] pp7  = pp[511:448];
wire [63:0] pp8  = pp[575:512];
wire [63:0] pp9  = pp[639:576];
wire [63:0] pp10 = pp[703:640];

wire [64:0] carry_chain1;
wire [64:0] carry_chain2;

assign carry_chain1[0] = 1'b0;
assign carry_chain2[0] = 1'b0;

genvar i;

generate
for(i=0;i<64;i=i+1) begin : column

    wire s1, c1, cout1;
    wire s2, c2;

    // First 4:2 compression (4 inputs)
    compressor_4_2 C1(
        .x1(pp0[i]),
        .x2(pp1[i]),
        .x3(pp2[i]),
        .x4(pp3[i]),
        .cin(carry_chain1[i]),
        .sum(s1),
        .carry(c1),
        .cout(cout1)
    );

    // 3:2 compression for remaining bits
    compressor_3_2 C2(
        .x1(pp4[i]),
        .x2(pp5[i]),
        .x3(pp6[i]),
        .sum(s2),
        .carry(c2)
    );

    // Final reduction for this column
    compressor_3_2 C3(
        .x1(s1),
        .x2(s2),
        .x3(pp7[i]),
        .sum(sum[i]),
        .carry(carry[i])
    );

    // Carry propagate to next column
    assign carry_chain1[i+1] = c1 | cout1;
    assign carry_chain2[i+1] = c2;

end
endgenerate

endmodule