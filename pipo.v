module pipo(d,clk,q,qb);
    input [3:0]d;
    input clk;
    output [3:0]q,qb;
    dff a(d[3], clk, q[3],qb[3]);
    dff b(d[2], clk, q[2],qb[2]);
    dff c(d[1], clk, q[1],qb[1]);
    dff e(d[0], clk, q[0],qb[0]);
endmodule
module dff(d,clk,q,qb);
input d,clk;
output q,qb;
reg q,qb;
always@(posedge clk)
begin
if (d==0)
  begin
  q=1'b0;
  qb=1'b1;
end
else
begin
    q=1'b1;
    qb=1'b0;
  end
end
endmodule 
