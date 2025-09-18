module JohnsonCoumter(clk,rst,q);
  input clk,rst;
  output reg[3:0]q;
  always@(posedge clk)
  begin
    if(rst==1) q=4'b0000;
    else
      begin
        q[0]<=~q[3];
        q[1]<=q[0];
        q[2]<=q[1];
        q[3]<=q[2];
      end
  end
endmodule

module ringCounter(clk,rst,q);
  input clk,rst;
  output reg[3:0]q;
  always@(posedge clk)
  begin
    if(rst==1) q=4'b0001;
    else
    q=q<<1;
  end
endmodule
  
module test_JC();
  reg clk,rst;
  wire [3:0]q;
  ringCounter C5(clk,rst,q);
  initial
  begin
   clk=1;
   rst=1;
   #20 rst=0;
  end
  always #20 clk=~clk;
endmodule
