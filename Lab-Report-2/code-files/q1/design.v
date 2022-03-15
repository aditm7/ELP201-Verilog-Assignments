module SRFlipFlop(S,R,clock,Q,Qbar);
input S,R,clock;
output reg Q=0,Qbar=1;

always@(posedge clock)
begin
  if(S & ~R)
    begin
      Q <= 1;
      Qbar <= 0;
    end
  else if(~S & R)
    begin
      Q <= 0;
      Qbar <= 1;
    end
  else if(~S & ~R) 
    begin 
      Q <= Q;
      Qbar <= Qbar;
    end
  else if(S & R)
    begin
      Q <= 1'bx;
      Qbar <= 1'bx;
    end
end
endmodule
