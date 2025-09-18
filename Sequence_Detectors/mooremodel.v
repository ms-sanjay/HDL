module sequencemoore(clk,rst,x,y);
  input clk,rst,x;
  output reg y;
  reg[1:0] ps;
  reg[1:0] ns;
always @(posedge clk)
begin
  if(rst==1)
  begin
    y=0;
    ps=2'b00;
    ns=2'b00;
  end
  else
  begin
    ps=ns;
    case (ps)
      2'b00:
      begin
      if(x==0) begin ns=2'b00; end
      else if(x==1) begin ns=2'b01; end
      end
      2'b01:
      begin
      if(x==0) begin ns=2'b10; end
      else if(x==1) begin ns=2'b01; end
      end
      2'b10:
      begin
      if(x==0) begin ns=2'b00; end
      else if(x==1) begin ns=2'b11; end
      end
      2'b11:
      begin
      if(x==0) begin ns=2'b10; end
      else if(x==1) begin ns=2'b01;end
      end
    endcase
    assign y=(ns==2'b11)?1:0;
  end
end
endmodule

module test_sequencemoore();
reg x,clk,rst;
wire y;
sequencemoore C1(clk,rst,x,y);
initial
begin
clk=1;
rst=1;
x=0;
#20 rst=0;
end
always #5 clk=~clk;
always
begin
x=1;#10;
x=1;#10;
x=1;#10;
x=0;#10;
x=1;#10;
x=1;#10;
x=0;#10;
x=1;#10;
x=1;#10;
x=0;#10;
x=1;#10;
end
endmodule

  
  
