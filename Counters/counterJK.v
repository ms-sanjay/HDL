module JKff(clk,rst,j,k,q);
  input clk,rst,j,k;
  output reg q;
always@(posedge clk)
begin
  if(rst==1) q=0;
  else if(j==0&&k==0) q=q;
  else if(j==0&&k==1) q=0;
  else if(j==1&&k==0) q=1;
  else if(j==1&&k==1) q=~q;
end
endmodule

module counterJK(clk,rst,q);
  input clk,rst;
  output [2:0]q;
  JKff A1(clk,rst,q[1],q[1],q[2]);
  JKff B1(clk,rst,1,1,q[1]);
  JKff C1(clk,rst,0,x,q[0]);
endmodule

module test_counterJk();
  reg clk,rst;
  wire [2:0]q;
  counterJK C3(clk,rst,q);
  initial
  begin
  clk=1;
  rst=1;
  #20 rst=0;
  end
  always #20 clk=~clk;
endmodule


  
  