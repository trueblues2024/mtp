module tff(t,clk,rst,q,qb,clk1);
input t,clk,rst;
output q,qb,clk1;
reg q,qb;
div c1(clk,0,clk1);
always@(posedge clk1)
begin
if(rst==1)
  begin
    q=1'b0;
    qb=1'b0;
  end
  else if(t==0)
    begin
      q=1'b1;
      qb=1'b0;
      end
else if(t==1)
  begin
      q=~q;
      qb=~qb;
      end
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