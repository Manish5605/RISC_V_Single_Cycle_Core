module ALU(A,B,Result,ALU_Control,OverFlow,Carry,Zero,Negative);

    input [31:0]A,B;
    input [2:0]ALU_Control;
    output Carry,OverFlow,Zero,Negative;
    output [31:0]Result;

    wire Cout;
    wire [31:0]Sum;

    assign {Cout,Sum} = (ALU_Control[0] == 1'b0) ? A + B :
                                          (A + ((~B)+1)) ;
    assign Result = (ALU_Control == 3'b000) ? Sum :
                    (ALU_Control == 3'b001) ? Sum :
                    (ALU_Control == 3'b010) ? A & B :
                    (ALU_Control == 3'b011) ? A | B :
                    (ALU_Control == 3'b101) ? {{31{1'b0}},(Sum[31])} : {32{1'b0}};
    
    assign OverFlow = ((Sum[31] ^ A[31]) & 
                      (~(ALU_Control[0] ^ B[31] ^ A[31])) &
                      (~ALU_Control[1]));
    assign Carry = ((~ALU_Control[1]) & Cout);
    assign Zero = &(~Result);
    assign Negative = Result[31];

endmodule