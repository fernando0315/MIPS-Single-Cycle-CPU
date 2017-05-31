`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2017 11:32:17 PM
// Design Name: 
// Module Name: PCff
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


module PCff(
    input clk, reset,
    input [15:0] in,
    output reg [15:0] out
    );
    
    always @(posedge clk) begin
    #5
        if(reset) begin
            out <= 0;
        end else begin 
            out <= in;
        end
    end
endmodule
