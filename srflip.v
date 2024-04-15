module srff(s,r,clk,rst,q,qb);
input s,r,clk,rst;
output q,qb;
reg q,qb;
always@(posedge clk)
begin
if(rst==1)
  begin
    q=1'b0;
    qb=1'b0;
  end
else
  begin
  if(s==0&r==0)
  begin
  q=q;
  qb=qb;
end 
else if(s==1&r==0)
begin
  q=1'b1;
  qb=1'b0;
end
else if(s==1&r==1)
begin
  q=q;
  qb=qb;
end   
else if(s==0&r==1)
  begin
    q=1'b0;
    qb=1'b1;
  end
end
end
endmodule

