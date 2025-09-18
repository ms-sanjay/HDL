module Sequence0011(clk,rst,x,y);
input x,rst,clk;
output reg y;
reg [1:0]ps;
reg [1:0]ns;
always@(posedge clk)
begin
  if(rst==1) begin y=0; ps=2'b00; ns=2'b00; end
  else
    begin
    ps=ns;
    case(ps)
    2'b00:
    begin
      if(x==0) begin ns=2'b01; y=0; end
      else begin ns=2'b00; y=0; end
    end
    2'b01:
    begin
      if(x==0) begin ns=2'b10; y=0; end
      else begin ns=2'b00; y=0; end
    end
    2'b10:
    begin
      if(x==0) begin ns=2'b10; y=0; end
      else begin ns=2'b11; y=0; end
    end
    2'b11:
    begin
      if(x==0) begin ns=2'b01; y=0; end
      else begin ns=2'b00; y=1; end
    end
    endcase
    end
end
endmodule

module test_0011();
reg clk,rst,x;
wire y;
Sequence0011 I1(clk,rst,x,y);
initial
begin
  clk=1;
  rst=1;
  #20 rst=0;
end
always #5 clk=~clk;
initial
begin
  x=1; #10;
  x=1; #10;
  x=0; #10;
  x=0; #10;
  x=1; #10;
  x=1; #10;
  x=0; #10;
  x=1; #10;
  x=0; #10;
  x=0; #10;
  x=1; #10;
  x=1; #10;
end
endmodule


