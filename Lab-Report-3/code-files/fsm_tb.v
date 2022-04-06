`timescale 1s/100ms
`include "fsm.v"
module fsm_tb();

reg clk,in;
wire q0;
wire q0b;
wire q1;
wire q1b;
wire q2;
wire q2b;
output reg Y;

dflipp dff1((q0b & q1) |(q2 & q0b)|(q0b & in),clk,q0,q0b);
dflipp dff2((q2b & q1b & q0)|(q1 & q0b),clk,q1,q1b);
dflipp dff3((q2 & q0b)|(q1 & q0),clk,q2,q2b);

always @(posedge clk)
begin
  Y=(q0b & q1) | (q0b & q2b & in);
end

initial 
begin
 clk=0; 
 Y=0;
$monitor("q2=%b,q1=%b,q0=%b,clock=%b,output=%b",q2,q1,q0,clk,Y);
$dumpfile("fsm.vcd");
$dumpvars(0,fsm_tb);
in=1; #120;
in=0; #120;
in=1; #20;
in=0;
#120;
 $finish;
end
always 
  #10 clk = ~clk;
endmodule


