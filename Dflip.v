module dff(d,clk,q,qb);
input d,clk;
output q,qb;
reg q,qb;
always@(posedge clk)
begin
if (d==0)
  begin
  q=1'b1;
  qb=1'b0;
end
else
begin
    q=1'b0;
    qb=1'b1;
  end
end
endmodule
