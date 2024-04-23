module mux4x1(y,a,s);
  input [2:0]s;
  input a;
  output [7:0]y;
  assign y[0] = (~s[0]&~s[1]&~s[2]&a);
  assign y[1] = (s[0]&~s[1]&~s[2]&a);
  assign y[2] = (~s[0]&s[1]&~s[2]&a);
  assign y[3] = (s[0]&s[1]&~s[2]&a);
  assign y[4] = (~s[0]&~s[1]&s[2]&a);
  assign y[5] = (s[0]&~s[1]&s[2]&a);
  assign y[6] = (~s[0]&s[1]&s[2]&a);
  assign y[7] = (s[0]&s[1]&s[2]&a);
endmodule  