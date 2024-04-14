module ram(q, addr, data, wr,clk,led);
 output reg [3:0] q;
input [3:0] data;
input [3:0] addr;
 output led;
wire c;
input wr, clk;
reg [3:0] mem [15:0]; 
assign led=c;
div dd(clk,rst,c);
 always @(posedge clk) 
begin 
if(wr==1)
mem[addr]=data; 
else
q=mem[addr]; 
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
