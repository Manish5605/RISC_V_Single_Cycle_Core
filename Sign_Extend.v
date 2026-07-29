module Sign_Extend(In,Imm_Ext,ImmSrc);

input [31:0] In;
output [31:0] Imm_Ext;
input [1:0] ImmSrc;

 assign Imm_Ext = (ImmSrc == 2'b00) ? {{20{In[31]}},In[31:20]} :               //I-type (Load, ALU-imm)
                  (ImmSrc == 2'b01) ? {{20{In[31]}},In[31:25],In[11:7]} :      //S-type (Store)
                  (ImmSrc == 2'b10) ? {{20{In[31]}},In[7],In[30:25],In[11:8],1'b0} : //B-type (Branch)
                  32'h00000000;

endmodule