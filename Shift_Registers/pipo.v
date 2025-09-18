module pipo(input [3:0] parallel_in, clk, rst, load, output reg [3:0] parallel_out)
    always @(posedge clk or posedge rst) 
    begin
        if(rst) parallel_out<=0;
        else if(load) parallel_out<=parallel_in;
    end
endmodule