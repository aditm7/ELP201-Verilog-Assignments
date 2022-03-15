`timescale 1s/100ms
`include "design.v"

module main();

reg clk;
wire q0,q0bar,q1,q1bar,q2,q2bar,q3,q3bar;

//Instantation of flip flops
SRFlipFlop ff0(q1bar ^ q2bar ^ q3bar,q1 ^ q2 ^ q3,clk,q0,q0bar);
SRFlipFlop ff1(q0 & (q3bar ^ q2),q0 & (q3 ^ q2),clk,q1,q1bar);
SRFlipFlop ff2(q3bar & q1 & q0bar,q3 & q1 & q0bar,clk,q2,q2bar);
SRFlipFlop ff3(q2 & q1bar & q0bar,q2bar & q1bar & q0bar,clk,q3,q3bar);

initial 
begin
$monitor("CLK=%b,q3=%b,q2=%b,q1=%b,q0=%b",clk,q3,q2,q1,q0);
$dumpfile("design.vcd");
$dumpvars(0,main);
  clk=0; //intitially clock=0;
  #160; //simulation time (enough for all states to occur)
  $finish;
end
always 
  #5 clk = ~clk; //changing clock after every 5s
endmodule