module Tff(clk,rst,t,q);
input clk,rst,t;
output reg q;
always @(posedge clk)
begin
  if(rst) q=0;
  else if(t==0) q=q;
  else if(t==1) q=~q;
end
endmodule 

module counter(clk,rst,q);
input clk,rst;
output[1:0]q;
Tff T1(clk,rst,q[0],q[1]);
Tff T2(clk,rst,1,q[0]);
endmodule

module test_0123();
reg clk,rst;
wire [1:0]q;
counter C1(clk,rst,q);
initial
begin
  clk=1;
  rst=1;
  #10 rst=0;
end
always #10 clk=~clk;
endmodule

