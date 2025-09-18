module sequence110(clk,rst,x,y);
  input clk,rst,x;
  output reg y;
  reg[1:0]ps;
  reg[1:0]ns;
always@(posedge clk)
begin
  if(rst==1) begin ps=2'b00; ns=2'b00; y=0; end
else
  begin
    ps=ns;
    case(ps)
      2'b00:
      if(x==0) begin ns=2'b00; y=0; end
      else begin ns=2'b01; y=0; end
      2'b01:
      if(x==0) begin ns=2'b00; y=0; end
      else begin ns=2'b10; y=0; end
      2'b10:
      if(x==0) begin ns=2'b00; y=1; end
      else begin ns=2'b01; y=0; end 
    endcase
  end
end
endmodule

module D_flipf(clk,rst,d,q);
input clk,rst,d;
output reg q;
always @(posedge clk)
begin
if(rst==1) q=0;
else q=d;
end
endmodule

module sequenceD(clk,rst,x,y);
  input clk,rst,x;
  output y;
  wire da,db,qa,qb;
  assign da= qb&x;
  assign db= ~qb&x;
  D_flipf A1(clk,rst,da,qa);
  D_flipf B2(clk,rst,db,qb);
  assign y= qa & ~x;
endmodule

module test_110();
  reg clk,rst,x;
  wire y;
  sequenceD S3(clk,rst,x,y);
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
  x=1; #10;
  x=1; #10;
  x=0; #10;
  x=0; #10;
  x=1; #10;
  x=1; #10;
  x=0; #10;
  x=1; #10;
  x=1; #10;
  x=0; #10;  
  end
endmodule
  


