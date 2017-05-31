`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2017 11:42:16 PM
// Design Name: 
// Module Name: alu
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

/********************************************************************************
OPcode  Operation
000     unsigned X + Y
001     2's X + Y
010     2's X - Y
011     X & Y
100     X | Y
101     Set on less than
110     set zero
*********************************************************************************/

module alu(
    input [15:0] X, [15:0] Y,
    output reg [15:0] out,
    input Cin,
    output reg Cout,
    output wire lt, eq, gt,
    output reg V,
    input [2:0] opcod
    );
   
    assign #5 lt = X < Y ? 1 : 0;
    assign #5 gt = X > Y ? 1 : 0;
    assign #5 eq = X == Y ? 1 : 0;
    
    wire [15:0]holdData1 = {1'b0,X[14:0]} + {1'b0,Y[14:0]} + Cin;
    wire [15:0]holdData2 = {1'b0,X[14:0]} - {1'b0,Y[14:0]} + Cin;
    
    always @(*) begin
        #5
        case(opcod)
            3'b000: begin
                {Cout, out} = X + Y + Cin;
                V = Cout;
                $display("out value: %d", out) ;
            end
            3'b001: begin 
                {Cout, out} = X + Y + Cin;
                V = Cout ^ holdData1[15];
            end
            3'b010: begin 
                {Cout, out} = X - Y + Cin;
                V = Cout ^ holdData2[15];
            end
            3'b011: begin
                out = X & Y;
                {Cout, V} = 0;
            end
            3'b100: begin
                out = X | Y;
                {Cout, V} = 0;
            end
            3'b101: begin
                out = lt;
                {Cout, V} = 0;
            end
            3'b110: begin
                out = eq;
                {Cout, V} = 0;
            end                                                             
        endcase
    end
endmodule
