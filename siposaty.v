module SIPO(in,clk,out);
input in,clk;
output[3:0]out;
div s(clk,0,q);
D d1(in,q,out[0]);
D d2(out[0],q,out[1]);
D d3(out[1],q,out[2]);
D d4(out[2],q,out[3]);
endmodule
module D(d,clk,Q);
input d,clk;
output reg Q;
always@(posedge clk)
begin
if(d==1)
begin 
Q=d;
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
