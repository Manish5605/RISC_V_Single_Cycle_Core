module ALU_Decoder(ALUOp,Op,funct3,funct7,ALUControl);

   //input output declaration
    input [6:0] Op, funct7;
    input [2:0] funct3;
    input [1:0] ALUOp;
    output [2:0] ALUControl;

    //declaring wires
    wire [1:0] concatenation;

    assign concatenation = {Op[5],funct7[5]}; //Concatenating op5 and funct7

assign ALUControl = (ALUOp == 2'b00) ? 3'b000 : //Load/Store
                    (ALUOp == 2'b01) ? 3'b001 : //Branch
                    ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 : //SLT
                    ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : //AND
                    ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 : //OR
                    ((ALUOp == 2'b10) & (funct3 == 3'b000) & (concatenation == 2'b11)) ? 3'b001 : //SUB
                    ((ALUOp == 2'b10) & (funct3 == 3'b000) & (concatenation != 2'b11)) ? 3'b000 : 3'b000; //ADD
                    



endmodule