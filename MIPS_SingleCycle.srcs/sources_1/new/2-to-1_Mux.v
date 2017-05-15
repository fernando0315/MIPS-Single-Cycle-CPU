`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 08:19:09 PM
// Design Name: 
// Module Name: 2-to-1_Mux
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


module TwotoOne_Mux(
    input  [15:0]in0, 
    input  [15:0]in1, 
    input  sel, 
    output [15:0]out);
        
assign out = sel ? in1 : in0;        

endmodule
