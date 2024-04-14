module lfsr(clk1,ini,q);
 input clk1,ini;
 output [7:0]q;
 div(clk1,rst,clk); 
 dff d1(clk,x,ini,q[0]);
 dff d2(clk,q[0],ini,q[1]);
 dff d3(clk,q[1],ini,q[2]);
 dff d4(clk,q[2],ini,q[3]);
 dff d5(clk,q[3],ini,q[4]);
 dff d6(clk,q[4],ini,q[5]);
 dff d7(clk,q[5],ini,q[6]);
 dff d8(clk,q[6],ini,q[7]);
 xor(x,q[2],q[4],q[5],q[7]);
endmodule
module dff(clk,d,ini,q);
 input d,clk,ini;
 output q;
 reg q;
 always@(posedge clk)
 begin
 if(ini==1)
 q=1;
 else
 q=d;
 end
endmodule 
module div(clk,rst,q); 
input clk,rst;
output q;
 reg [27:0]sig;
assign LED=q;
always @(posedge clk)
 begin
if(rst==1) 
sig=28'b0; 
else if (rst==0) 
sig=sig+1;
end
assign q=sig[24];
 endmodule 