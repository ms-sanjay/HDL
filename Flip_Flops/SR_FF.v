module SR_FF(
    input wire S,    // Set
    input wire R,    // Reset
    input wire clk,  // Clock
    input wire rst,  // Asynchronous reset
    output reg Q,    // Output
    output reg Qn    // Inverted Output
);

always @(posedge clk or posedge rst) begin
    if(rst) begin
        Q<=1'b0;
        Qn<=1'b1;
    end
    else begin
        case({S,R})
            2'b00: begin
                Q<=Q;      // No change
                Qn<=Qn;
            end
            2'b01: begin
                Q<=1'b0;
                Qn<=1'b1;  // Reset
            end
            2'b10: begin
                Q<=1'b1;
                Qn<=1'b0;  // Set
            end
            2'b11: begin
                Q<=1'bx;  // Invalid state
                Qn<=1'bx;
            end
        endcase
end

endmodule