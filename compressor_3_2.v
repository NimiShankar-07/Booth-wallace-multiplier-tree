module compressor_3_2(
    input x1, x2, x3,
    output sum, carry
);

assign sum   = x1 ^ x2 ^ x3;
assign carry = (x1 & x2) | (x2 & x3) | (x1 & x3);

endmodule