module Main_Decoder(Op,zero,RegWrite,MemWrite,ResultSrc,ALUSrc,ImmSrc,ALUOp,PCSrc,Branch);

   //input output declaration
    input zero;
    input [6:0] Op;
    output RegWrite,MemWrite,ResultSrc,ALUSrc,PCSrc,Branch;
    output [1:0] ImmSrc,ALUOp;

   

    assign RegWrite = ((Op == 7'b0110011) | (Op == 7'b0000011)) ? 1'b1 : 1'b0; //R-type, I-type, Load
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 : 1'b0; //Store
    assign ResultSrc = (Op == 7'b0000011) ? 1'b1 : 1'b0; //Load
    assign ALUSrc = ((Op == 7'b0000011) | (Op == 7'b0100011)) ? 1'b1 : 1'b0; //I-type, Load, Store
    assign ImmSrc = (Op == 7'b0000011) ? 2'b00 : //Load
                    (Op == 7'b0100011) ? 2'b01 : //Store
                    (Op == 7'b1100011) ? 2'b10 : //beq
                    2'b00; //Default case   
    assign Branch = (Op == 7'b1100011) ? 1'b1 : 1'b0; //Branch
    assign ALUOp = (Op == 7'b0110011) ? 2'b10 : //R-type
                   (Op == 7'b0000011) ? 2'b00 : //Load
                   (Op == 7'b0100011) ? 2'b00 : //Store
                   (Op == 7'b1100011) ? 2'b01 : //Branch
                   2'b00; //Default case             

    assign PCSrc = (Branch & zero) ; //Branch and Zero flag
endmodule