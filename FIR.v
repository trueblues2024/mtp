// main module FIR
------------------------------------------------
+module filterfir(clk,rst,x,dataout);
input [7:0]x;
input clk,rst;
output [9:0]dataout;
wire [7:0]d1,d2,d3;
wire [7:0]m1,m2,m3,m4,m5;
wire [7:0]d11,d12,d13,d14;
parameter h0=3'b101;
parameter h1=3'b100;
parameter h2=3'b011;
parameter h3=3'b010;
parameter h4=3'b001; 
assign m1=x*h0;
dff u2(clk,rst,x,d11);
assign m2=d11*h1;
assign dataout=m1+m2;
endmodule

module dff(clk,rst,d,q);// sub module d flipflop
input clk,rst;
input [7:0]d;
output [7:0]q;
reg [7:0]q;
always@(posedge clk)
begin
if(rst==1)
begin
q=0;
end
else
begin
q=d;
end
end

endmodule