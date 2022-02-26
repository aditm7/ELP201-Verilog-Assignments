module kmap(A,B,C,D,out);
  input A,B,C,D;
  output out;
  assign out = (A & D) | (~B & ~C) | (~C & D) | (~A & C & ~D) | (B & C & ~D);
endmodule

module mux8x1(i0,i1,i2,i3,i4,i5,i6,i7,sel0,sel1,sel2,out);
input i0,i1,i2,i3,i4,i5,i6,i7,sel0,sel1,sel2;
output reg out;
always@(*)
  begin
    if (~sel2 & ~sel1 & ~sel0)
      out=i0;
    else if (~sel2 & ~sel1 & sel0)
      out=i1;
    else if (~sel2 & sel1 & ~sel0)
      out=i2;
    else if (~sel2 & sel1 & sel0)
      out=i3;
    else if (sel2 & ~sel1 & ~sel0)
      out=i4;
    else if (sel2 & ~sel1 & sel0)
      out=i5;
    else if (sel2 & sel1 & ~sel0)
      out=i6;
    else if (sel2 & sel1 & sel0)
      out=i7;
  end
endmodule

module mux4x1(i0,i1,i2,i3,sel0,sel1,E,out); //E is enable line
input i0,i1,i2,i3,sel0,sel1,E;
output reg out;
always@(*)
  begin
    if(E)
      out=0; //if the mux is not active then giving 0 output
    else if (~sel1 & ~sel0)
      out=i0;
    else if (~sel1 & sel0)
      out=i1;
    else if (sel1 & ~sel0)
      out=i2;
    else if (sel1 & sel0)
      out=i3;
  end
endmodule

module ORgate(in1,in2,out);
input in1,in2;
output out;
assign out=in1|in2;
endmodule