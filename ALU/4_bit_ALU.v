module ALU(
    input wire clk,
    input wire rst,
    input wire [3:0] A,
    input wire [3:0] B,
    input wire [1:0] opcode,
    output reg [3:0] result,
    output reg cout,   // carry/overflow or error flag
    output reg zero    // result is zero
);

    // Opcode encoding
    localparam ADD = 2'b00,
               SUB = 2'b01,
               MUL = 2'b10,
               DIV = 2'b11;

    reg [3:0] a_reg, b_reg;
    reg [7:0] temp_result; // 8-bit to detect overflow for mul/div

    // Synchronous capture of inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg   <= 4'd0;
            b_reg   <= 4'd0;
            result  <= 4'd0;
            cout    <= 1'b0;
            zero    <= 1'b0;
        end else begin
            a_reg <= A;
            b_reg <= B;

            // Default flags
            cout   <= 1'b0;
            temp_result <= 8'd0;

            case (opcode)
                ADD: begin
                    temp_result = a_reg + b_reg;
                    result = temp_result[3:0];
                    cout = temp_result[4];            // carry-out
                end

                SUB: begin
                    temp_result = {1'b0, a_reg} - {1'b0, b_reg};
                    result = temp_result[3:0];
                    cout = (a_reg < b_reg) ? 1'b1 : 1'b0; // borrow
                end

                MUL: begin
                    temp_result = a_reg * b_reg;
                    result = temp_result[3:0];
                    cout = |temp_result[7:4];         // overflow if upper 4 bits not zero
                end

                DIV: begin
                    if (b_reg == 4'd0) begin
                        result = 4'd0;
                        cout = 1'b1;                  // division by zero error
                    end else begin
                        result = a_reg / b_reg;
                        cout = 1'b0;
                    end
                end

                default: begin
                    result = 4'd0;
                    cout = 1'b0;
                end
            endcase

            // Update zero flag
            zero = (result == 4'd0) ? 1'b1 : 1'b0;
        end
    end

endmodule
