module jk_flipflop (J, K, clk, reset,Q,Q_bar);
  output reg Q,Q_bar;
  wire clk1;
  input J,K,clk,reset;
  div d1(clk,0,clk1);
  always @(posedge clk1 or posedge reset) begin
    if (reset) begin
      Q=1'b0;
      Q_bar=1'b1;
    end else begin
      case ({J, K})
        2'b00: begin 
          Q=Q;
          Q_bar=Q_bar;
        end
        2'b01: begin
          Q=1'b0;
          Q_bar=1'b1;
        end
        2'b10: begin 
          Q=1'b1;
          Q_bar=1'b0;
        end
        2'b11: begin
          Q=~Q;
          Q_bar=~Q_bar;
        end
      endcase
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



