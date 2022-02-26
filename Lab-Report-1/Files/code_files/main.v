`timescale 1s/100ms
`include "design.v" //inlcuding the gates implementation file

module main(); //module of the testbench starts
reg a,b,c,d;
wire F; wire y1,y2; wire out1,out2;

//instantitation the design module and passing the parameters
// case a:
mux8x1 func1(1,1,~a,a,0,1,1,a,d,c,b,y1);// 8x1 MUX

// case b:
mux4x1 func2(1,1,~a,a,d,c,b,out1); //4x1 MUX-1
mux4x1 func3(0,1,1,a,d,c,~b,out2);// 4x1 MUX-2
ORgate func4(out1,out2,y2);

//Realising function using k-maps
kmap func5(a,b,c,d,F);

initial 
begin
  $monitor("a=%b,b=%b,c=%b,d=%b,y1=%b,y2=%b,F=%b",a,b,c,d,y1,y2,F);
  $dumpfile("design.vcd"); 
  $dumpvars(0,main);

  a=0;b=0;c=0;d=0;#10; 
  a=0;b=0;c=0;d=1;#10;
  a=0;b=0;c=1;d=0;#10;
  a=0;b=0;c=1;d=1;#10;
  
  a=0;b=1;c=0;d=0;#10;
  a=0;b=1;c=0;d=1;#10;
  a=0;b=1;c=1;d=0;#10;
  a=0;b=1;c=1;d=1;#10;

  a=1;b=0;c=0;d=0;#10;
  a=1;b=0;c=0;d=1;#10;
  a=1;b=0;c=1;d=0;#10;
  a=1;b=0;c=1;d=1;#10;

  a=1;b=1;c=0;d=0;#10;
  a=1;b=1;c=0;d=1;#10;
  a=1;b=1;c=1;d=0;#10;
  a=1;b=1;c=1;d=1;#10;

  $finish;
end
endmodule