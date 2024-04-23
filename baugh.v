module Baugh_Multiplier(p,a,b);
  input [3:0]a;
  input [3:0]b;
  output [7:0]p;
  wire [37:0]w;
  andgate l1(p[0],a[0],b[0]);
  andgate l2(w[1],a[1],b[0]);
  andgate l3(w[2],a[0],b[1]);
  andgate l5(w[3],a[0],b[2]);
  andgate l6(w[4],a[1],b[1]);
  andgate l7(w[5],a[1],b[2]);
  andgate l8(w[6],~a[0],b[3]);
  halfadder l4(p[1],w[7],w[1],w[2]);
  halfadder l9(w[8],w[9],w[3],w[4]);
  halfadder l10(w[10],w[13],w[5],w[6]);
  andgate l11(w[11],a[2],b[0]);
  andgate l12(w[12],a[2],b[1]);
  andgate l13(w[14],a[3],~b[1]);
  andgate l14(w[36],a[2],b[2]);
  fulladder l15(p[2],w[15],w[8],w[7],w[11]);
  fulladder l16(w[16],w[17],w[10],w[9],w[12]);
  fulladder l17(w[18],w[19],w[36],w[13],w[14]);
  andgate l18(w[20],a[3],~b[0]);
  andgate l19(w[21],~a[1],b[3]);
  andgate l20(w[22],~a[2],b[3]);
  andgate l21(w[23],a[3],b[3]);
  andgate l22(w[0],a[3],~b[2]);
  fulladder l23(w[24],w[25],w[16],w[15],w[20]);
  fulladder l24(w[26],w[27],w[18],w[17],w[21]);
  fulladder l25(w[28],w[29],w[0],w[19],w[22]);
  fulladder l26(w[30],w[31],~a[3],~b[3],w[23]);
  fulladder l27(p[3],w[32],w[24],a[3],b[3]);
  fulladder l28(p[4],w[33],w[26],w[25],w[32]);
  fulladder l29(p[5],w[34],w[28],w[27],w[33]);
  fulladder l30(p[6],w[35],w[30],w[29],w[34]);
  fulladder l31(p[7],w[37],1,w[31],w[35]);
endmodule

module fulladder(s,c,a,b,ca);
  input a,b,ca;
  output s,c;
  assign s=a^b^ca;
  assign c=(b&ca)|(a&b)|(a&ca);
endmodule

module halfadder(sum,carry,a,b);
  input a,b;
  output sum,carry;
  assign sum=a^b;
  assign carry=a&b;
endmodule

module andgate(c,a,b);
  input a,b;
  output c;
  assign c=a&b;
endmodule
