module queue(clk,rst,datain,rw,dataout,full,empty,led); 
input clk,rst,rw;
input [3:0]datain; 
reg [3:0]readptr;
 reg [3:0]writeptr; 
output led;
wire c;
output reg [3:0]dataout;
 reg [3:0]mem[15:0]; 
assign led=c;
output reg full,empty; 
div dd(clk,rst,c); 
always @(posedge c) 
begin
if(rst==1) 
begin
dataout=0; 
readptr=0; 
writeptr=0;
 end
else if(rw==1&&writeptr<15)
 begin 
mem[writeptr]=datain;
 writeptr=writeptr+1;
end
else if(rw==1&&writeptr==15)
 full=1;
else if(rw==0&&readptr<writeptr)
 begin
dataout=mem[readptr]; 
readptr=readptr+1;
end 
else
empty=1; 
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

