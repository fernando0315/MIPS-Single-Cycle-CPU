`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2017 11:44:40 PM
// Design Name: 
// Module Name: InstMemory
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


module InstMemory(
    input [15:0] address,
    output wire [15:0] MemData
    );
    
    reg [7:0]memBlock [0:2**16];
    
    assign #5 MemData = {memBlock[address+1], memBlock[address]};

//little endian
initial begin
    {memBlock[1],memBlock[0]} = 16'h2110;   //R0 = 1 + 2
    {memBlock[3],memBlock[2]} = 16'h2110;   //R0 = 1 + 2
    {memBlock[5],memBlock[4]} = 16'h2110;   //R0 = 1 + 2
    {memBlock[7],memBlock[6]} = 16'h2110;   //R0 = 1 + 2
    {memBlock[9],memBlock[8]} = 16'h2110;   //R0 = 1 + 2
    {memBlock[11],memBlock[10]} = 16'h2110;   //R0 = 1 + 2
    {memBlock[13],memBlock[12]} = 16'h2110;   //R0 = 1 + 2
    {memBlock[15],memBlock[14]} = 16'hE30C;   //R0 = 1 + 2
end    
    
endmodule
