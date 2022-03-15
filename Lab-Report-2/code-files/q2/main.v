`timescale 1s/100ms
`include "design.v"

module main();

reg clk;
wire q0,q1,q2,q3,q3bar,q2bar,q1bar,q0bar;

//Instantating the flip flops with respective intial values
DFlipFlop ff3(q1^q0,clk,1'b0,q3,q3bar);
DFlipFlop ff2(q3,clk,1'b1,q2,q2bar);
DFlipFlop ff1(q2,clk,1'b1,q1,q1bar);
DFlipFlop ff0(q1,clk,1'b1,q0,q0bar);

initial 
begin
$monitor("CLK=%b,q3=%b,q2=%b,q1=%b,q0=%b",clk,q3,q2,q1,q0);
$dumpfile("design.vcd");
$dumpvars(0,main);
  clk=0; //intitially clock=0;
  #150; //simulation time
  $finish;
end
always 
  #5 clk = ~clk; //changing clock after every 5s
endmodule