module Data_Memory(A,WD,clk,rst,WE,RD);

input [31:0] A,WD;
input clk,WE,rst;

output [31:0] RD;

reg [31:0] Data_MEM[1023:0]; //  words of 32 bits

//read
assign RD = Data_MEM[A[31:2]];

//write
always @(posedge clk) begin
    if (WE == 1'b1) begin
        Data_MEM[A[31:2]] <= WD;
    end
end

initial begin
   Data_MEM[7] = 32'h00000020; 
   Data_MEM[10] = 32'h00000002;
end


endmodule