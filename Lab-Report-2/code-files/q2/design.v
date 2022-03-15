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
