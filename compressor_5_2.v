module compressor_5_2(input x1,x2,x3,x4,x5,cin1,cin2,output sum,carry,cout1,cout2);
    wire s1,s2,s3,c1,c2,c3;
    
    assign s1=x1^x2^x3;
    assign c1=(x1&x2)|(x2&x3)|(x3&x1);
    
    assign s2=x4^x5^cin1;
    assign c2=(x4&x5)|(x5&cin1)|(x4&cin1);
    
    assign s3=s1^s2^cin2;
    assign c3=(s1&s2)|(s2&cin2)|(s1&cin2);
    
    assign sum=s3;
    assign carry=c3;
    assign cout1=c2;
    assign cout2=c1;
    
endmodule
    
    
    
