module booth_encoder_radix8(
    input  signed [31:0] multiplicand,
    input  signed [31:0] multiplier,
    output reg signed [703:0] pp   
);

integer i;
reg [3:0] group;
reg signed [63:0] temp_pp;
reg signed [63:0] mcand_ext;
reg [32:0] extended_multiplier;

always @(*) begin

    mcand_ext = {{32{multiplicand[31]}}, multiplicand};
    extended_multiplier = {multiplier,1'b0};

    for (i = 0; i < 11; i = i + 1) begin
        
        group = extended_multiplier[3*i +: 4];

        case(group)

            4'b0000,4'b1111: temp_pp = 64'd0;

            4'b0001,4'b0010:
                temp_pp =  mcand_ext <<< (3*i);

            4'b0011,4'b0100:
                temp_pp =  mcand_ext <<< (3*i+1);

            4'b0101,4'b0110:
                temp_pp = (mcand_ext <<< (3*i)) +
                          (mcand_ext <<< (3*i+1));

            4'b0111:
                temp_pp =  mcand_ext <<< (3*i+2);

            4'b1000:
                temp_pp = -(mcand_ext <<< (3*i+2));

            4'b1001,4'b1010:
                temp_pp = -((mcand_ext <<< (3*i)) +
                            (mcand_ext <<< (3*i+1)));

            4'b1011,4'b1100:
                temp_pp = -(mcand_ext <<< (3*i+1));

            4'b1101,4'b1110:
                temp_pp = -(mcand_ext <<< (3*i));

            default:
                temp_pp = 64'd0;

        endcase

        pp[64*i +: 64] = temp_pp;

    end
end

endmodule