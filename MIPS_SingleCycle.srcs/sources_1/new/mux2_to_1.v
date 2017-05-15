`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 08:00:20 PM
// Design Name: 
// Module Name: mux2_to_1
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


module mux_2-to-1(
    input in0, 
    input in1, 
    input sel, 
    output out);
    
    assign out = sel ? in1 : in0;
    
endmodule
