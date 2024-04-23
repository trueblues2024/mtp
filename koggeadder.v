module ksa(d,s,c,a,b);
  input [3:0]a;
  input [3:0]b;
  output [3:0]s;
  output [3:0]c;
  output [3:0]d;
assign s[0]=a[0]^b[0];
assign s[1]=a[1]^b[1];
assign s[2]=a[2]^b[2];
assign s[3]=a[3]^b[3];
assign c[0]=a[0]&b[0];
assign c[1]=a[1]&b[1];
assign c[2]=a[2]&b[2];
assign c[3]=a[3]&b[3];  
assign d=s+c;
endmodule