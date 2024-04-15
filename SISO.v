module SISO(in,clk,out);
input in,clk;
output out;
wire q1,q2,q3,q;
div c1(clk,0,q);
D d1(in,q,q1);
D d2(q1,q,q2);
D d3(q2,q,q3);
D d4(q3,q,out);
endmodule
module D(D,clk,Q);
input D,clk;
output reg Q;
wire clk1;
always@(posedge clk)
begin
if(D==1)
begin 
Q=D;
end
else
    Q=0;
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