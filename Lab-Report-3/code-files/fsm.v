module dflipp(D,clk,Q,Qb);
input D,clk,pre;
output reg Q=0,Qb=1;

always @(posedge clk)
begin
    if(D==0)
begin
Q<=0;
Qb<=1;
end
else if(D==1)
begin
Q<=1;
Qb<=0;
end
end
endmodule


