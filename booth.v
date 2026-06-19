module booth_wallace_32x32 (
    input  [31:0] A,
    input  [31:0] B,
    output [63:0] P
);

wire [703:0] partial_products; 
wire [63:0] sum, carry;

booth_encoder_radix8 BE (
    .multiplicand(A),
    .multiplier(B),
    .pp(partial_products)
);

wallace_tree WT (
    .pp(partial_products),
    .sum(sum),
    .carry(carry)
);

assign P = sum + (carry << 1);

endmodule

