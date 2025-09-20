module JK_FF(
    input wire J,    // J input
    input wire K,    // K input
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
        case ({J, K})
            2'b00: begin
                Q  <= Q;      // No change
                Qn <= Qn;
            end
            2'b01: begin
                Q  <= 1'b0;   // Reset
                Qn <= 1'b1;
            end
            2'b10: begin
                Q  <= 1'b1;   // Set
                Qn <= 1'b0;
            end
            2'b11: begin
                Q  <= Qn;     // Toggle
                Qn <= Q;
            end
        endcase
    end
end

endmodule