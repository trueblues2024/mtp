module piso(d,clk1,s,y);
  input [3:0]d;
  input clk1,s;
  wire sb,clk1;
  output y;
  wire w1,w2,w3,w4,y1,y2,y3,y4,y5,y6,z1,z2,z3;
  assign sb=~s;
  div kk(clk1,0,clk); 
  dff l1(d[0],clk,w1);
  ad l5(w1,s,y1);
  ad l6(d[1],sb,y2);
  orr l7(y1,y2,z1);
  dff l2(z1,clk,w2);
  ad l8(w2,s,y3);
  ad l9(d[2],sb,y4);
  orr l10(y3,y4,z2);
  dff l3(z2,clk,w3);
  ad l11(w3,s,y5);
  ad l12(d[3],sb,y6);
  orr l13(y5,y6,z3);
  dff l4(z3,clk,y);
endmodule
module dff(in,clk,out);
  input in,clk;
  output reg out;
  always @(posedge clk)
  begin
    if(in!=0)
     out=in;
   else
     out=0;
  end
endmodule
module ad(x,y,z);
  input x,y;
  output z;
  assign z=x&y;
endmodule
module orr(x1,y1,z1);
  input x1,y1;
  output z1;
  assign z1=x1|y1;
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