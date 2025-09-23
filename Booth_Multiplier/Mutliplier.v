module booth_Multiplier #(parameter N = 4)(
    input signed [N-1:0] M,[N-1:0] Q, output reg [2*N-1:0] P;
);

reg signed [N-1:0] A,Q_reg;
reg Q_1;
integer i;
always @(*) begin
    A=0;
    Q_reg=Q;
    Q_1=0;

    for(i=0;i<N;i=i+1)
    begin
        case({Q_reg[0],Q_1})
            2'b10: A=A-M;
            2'b01: A=A+M;
        endcase
        {A,Q_reg,Q_1}={A[N-1],A,Q_reg};
    end
    P={A,Q_reg};
end

endmodule