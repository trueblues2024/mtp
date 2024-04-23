module iir(x,clk,rst,y);
  input clk,rst;
  input [3:0]x;
  output [11:0]y;
  wire [7:0]p1,p2,p3,h1,y1,y2;
  wire [11:0]p4,p5,h2;
  wire [3:0]x1,x2;
  parameter b0=4'b0001;
  parameter b1=4'b0001;
  parameter b2=4'b0001;
  parameter a1=4'b0010;
  parameter a2=4'b0011;
  assign p1=x*b0;
  dff f1(x,clk,rst,x1); 
  assign p2=b1*x1;
  dff f2(x1,clk,rst,x2);
  assign p3=x2*b2;    
  assign h1=p1+p2+p3;
  dff1 f3(h1,clk,rst,y1);
  assign p4=a1*y1;
  dff1 f4(y1,clk,rst,y2);
  assign p5=a2*y2;
  assign h2=p4+p5;
  assign y=h1+h2;
   endmodule
   
module dff(d,clk,rst,q);
input [3:0]d;
input clk,rst;
output reg [3:0]q;
always@(posedge clk)
begin
 if(rst==1)
   q<=0;
 else
   q<=d;
end
 endmodule
 
module dff1(d,clk,rst,q);
input [7:0]d;
input clk,rst;
output reg [7:0]q;
always@(posedge clk)
begin
 if(rst==1)
   q<=0;
 else
   q<=d;
end
 endmodule