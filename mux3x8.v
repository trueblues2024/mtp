module mux4x1(output ans,input a,b,c,d,s0,s1);
  assign ans=((~s0&~s1&a)|(b&~s0&s1)|(~s1&s0&c)|(d&s0&s1));
endmodule
module mux16x1(output y,input i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,i15,[3:0]sel);
  wire w1,w2,w3,w4;  
  mux4x1 t1(w1,a1,b1,c1,d1,se[0],se[1]);                        
  mux4x1 t2(w2,a2,b2,c2,d2,se[0],se[1]);
  mux4x1 t3(w3,a3,b3,c3,d3,se[0],se[1]);
  mux4x1 t4(w4,a4,b4,c4,d4,se[0],se[1]);
  mux4x1 t5(y,v1,v2,v3,v4,se[2],se[3]);
endmodule  