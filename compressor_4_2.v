module compressor_4_2 (
    input x1, x2, x3, x4, cin,
    output sum, carry, cout
);
    wire s1, c1, c2;

    assign s1   = x1 ^ x2 ^ x3;
    assign c1   = (x1 & x2) | (x2 & x3) | (x1 & x3);

    assign sum  = s1 ^ x4 ^ cin;
    assign c2   = (s1 & x4) | (x4 & cin) | (s1 & cin);

    assign carry = c2;
    assign cout  = c1;
endmodule
