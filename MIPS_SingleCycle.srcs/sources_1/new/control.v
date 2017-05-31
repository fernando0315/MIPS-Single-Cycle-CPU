`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2017 04:47:24 AM
// Design Name: 
// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module control(
    input [3:0] OpCode,
    output wire Mux1,Mux2,Mux3,
    output wire Branch,MemRead,MemWrite,
    output wire RegWrite,
    output reg [2:0] ALUOp
    );
    
    parameter ADD = 4'h2, 
              SUB = 4'h6,
              AND = 4'h0,
              OR  = 4'h1,
              SLT = 4'h7,
              LW  = 4'h8,
              SW  = 4'ha,
              BNE = 4'he; 
    
    assign #5 Mux1     = OpCode == LW;
    assign #5 Mux2     = OpCode == LW;
    assign #5 Mux3     = (OpCode != LW) && (OpCode != SW);
    assign #5 Branch   = OpCode == BNE;
    assign #5 MemRead  = OpCode == LW;
    assign #5 MemWrite = OpCode == SW;
    assign #5 RegWrite = (OpCode != SW) && (OpCode != BNE);
    
    always @(*) begin
        #5
        case(OpCode) 
            ADD: ALUOp = 1; 
            SUB: ALUOp = 2; 
            AND: ALUOp = 3; 
            OR : ALUOp = 4;
            SLT: ALUOp = 5;
            LW : ALUOp = 0;
            SW : ALUOp = 0;
            BNE: ALUOp = 6;
        endcase
    end
    
endmodule
