
module stimulus();
    reg [31:0] a;
    reg [31:0] b;
    wire [63:0] p;
    
    booth_wallace_32x32 w1 (.A(a), .B(b), .P(p));

    initial
     begin
        a = 32'd14; 
        b = 32'd19;
        #10;
        $display("Test1: a=%0d b=%0d p=%0d", a, b, p);

        a = 32'd0; 
        b = 32'd1234;
        #10;
        $display("Test2: a=%0d b=%0d p=%0d", a, b, p);

        a = 32'd255; 
        b = 32'd255;
         #10;
         $display("Test3: a=%0d b=%0d p=%0d", a, b, p);
 
     
         $stop; 
     end
endmodule