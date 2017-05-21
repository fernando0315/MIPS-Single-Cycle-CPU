`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2017 01:38:19 PM
// Design Name: 
// Module Name: signExt4-to-16
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


module signExt4to16(
    input [3:0] in,
    output wire [15:0] out
    );
    
    assign out = {{12{in[3]}},in};
endmodule
