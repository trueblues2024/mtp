module FIR(x,clk3,rst,y);
  input [7:0]x;
  input clk3,rst;
  output [15:0]y;
  wire [15:0]w1,w2,w3;
  wire [7:0]w4,w5;
  parameter a=8'b00000010;
  parameter b=8'b00000100;
  parameter c=8'b00001000;
  assign w1=a*x;
  pipo i7(x,clk3,rst,w4);
  assign w2= w4*b;
  pipo i8(w4,clk3,rst,w5);
  assign w3= w5*c;
  assign y=w1+w2+w3;
endmodule
module pipo(D,clk1,rst,Q);
  input [7:0]D,clk1,rst;
  output [7:0]Q;
  dff i1(clk1,D[0],rst,Q[0]);
  dff i2(clk1,D[1],rst,Q[1]);
  dff i3(clk1,D[2],rst,Q[2]);
  dff i4(clk1,D[3],rst,Q[3]);
  dff i5(clk1,D[4],rst,Q[4]);
  dff i6(clk1,D[5],rst,Q[5]);
  dff i7(clk1,D[6],rst,Q[6]);
  dff i8(clk1,D[7],rst,Q[7]);
endmodule

module dff(clk,d,clr,q);
  input d,clk,clr;
  output q;
  reg q;
  always@(posedge clk)
  begin
    if(clr==1)
      q=0;
    else
      q=d;
    end 
  endmodule
