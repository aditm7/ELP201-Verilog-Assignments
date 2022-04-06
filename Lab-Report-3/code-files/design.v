module DFlipFlop(D,clock,preset,Q,Qbar);
input D,clock,preset;
output reg Q,Qbar;

initial
begin
  if(~preset)
  begin
    Q=1;Qbar=0;
  end
  else
  begin
    Q=0;Qbar=1;
  end
end

always@(posedge clock)
begin
  Q <= D;
  Qbar <= ~D;
end
endmodule

module FSM(in,out,clock,q2,q1,q0,q2bar,q1bar,q0bar);
input in,clock;
output wire q2,q1,q0,q2bar,q1bar,q0bar;
output reg out=0;

DFlipFlop ff1((q0bar & in)|(q1 & q0bar)|(q2 & q0bar),clock,1'b1,q0,q0bar);
DFlipFlop ff2((q2bar & q1bar & q0)|(q1 & q0bar),clock,1'b1,q1,q1bar);
DFlipFlop ff3((q2 & q0bar)|(q1 &q0),clock,1'b1,q2,q2bar);
always @(posedge clock ) 
begin
  assign out=(q1 & q0bar)|(q2bar & q0bar & in);
end
endmodule