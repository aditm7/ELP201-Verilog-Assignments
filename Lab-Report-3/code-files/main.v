`timescale 1s/100ms
`include "design.v"

module main();

reg clk,in;
wire q0,q1,q2,q2bar,q1bar,q0bar,out;

//Instantating the finite state machine
FSM func(in,out,clk,q2,q1,q0,q2bar,q1bar,q0bar);

initial 
begin
$monitor("CLK=%b,out=%b,in=%b,q2=%b,q1=%b,q0=%b",clk,out,in,q2,q1,q0);
$dumpfile("design.vcd");
$dumpvars(0,main);
  clk=0; //initially clock=0;
  in=1;#60 //initially input=1;
  in=0;#60; //after running the simulation for 60s, input is made 0;
  in=1;#10;in=0;
  #60;
  $finish;
end
always 
  #5 clk = ~clk; //changing clock after every 5s
endmodule