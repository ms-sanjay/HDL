module T_FF(
    input wire T,    // Toggle input
    input wire clk,  // Clock input
    input wire rst,  // Asynchronous reset
    output reg Q,    // Output
    output reg Qn    // Inverted Output
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        Q  <= 1'b0;
        Qn <= 1'b1;
    end else if (T) begin
        Q  <= Qn;
        Qn <= Q;
    end
end

endmodule