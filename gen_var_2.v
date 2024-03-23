
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    assign cout[0] = a[0]&b[0] | b[0]&cin | cin&a[0];
    assign sum[0] = a[0]^b[0]^cin;
    
   // integer i;
    generate
        genvar i;
        for(i=1;i<100;i=i+1) begin : array
           assign cout[i] = (a[i]&b[i]) | (b[i]&cout[i-1]) | (cout[i-1]&a[i]);
          assign  sum[i] = (a[i]^b[i]^cout[i-1]);
        end
    endgenerate
endmodule
