`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2017 01:55:31 PM
// Design Name: 
// Module Name: memory64KB
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


module memory64KB(
    input clk,
    input [15:0] address,
    input [15:0] inData,
    input memRead,
    input memWrite,
    output wire [15:0] data
    );
    
    reg [7:0]memBlock [0:2**16];
    
    always @(posedge clk) begin
        if(memWrite == 1) begin
            memBlock[address] <= inData[7:0];
            memBlock[address+1] <= inData[15:8];
        end
    end
    
    assign #5 data = memRead ? {memBlock[address+1], memBlock[address]} : 16'h0;
endmodule
