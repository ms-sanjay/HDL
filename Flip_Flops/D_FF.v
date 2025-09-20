module D_FF(
    input wire D,    // Data input
    input wire clk,  // Clock input
    input wire rst,  // Asynchronous reset
    output reg Q,    // Output
    output reg Qn    // Inverted Output
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q  <= 1'b0;
        Qn <= 1'b1;
    end else begin
        Q  <= D;
        Qn <= ~D;
    end
end

endmodule