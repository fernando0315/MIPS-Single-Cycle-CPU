`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2017 08:34:18 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    output [15:0] A, [15:0] B, 
    input [15:0] C,
    input [3:0] Aaddr, [3:0] Baddr, [3:0] Caddr,
    input Load, Clear, clk
    );
    
    //Hold the data of the reg file
    reg [15:0]regFile [0:15] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};   
    
    assign #5 A = regFile[Aaddr];
    assign #5 B = regFile[Baddr];
    
    always @(posedge clk) begin
        if(Load && Clear) 
            regFile[Caddr] <= C;
    end
    
    always @(Clear) begin
        if(!Clear) begin
            regFile[0] <= 0;
            regFile[1] <= 0;
            regFile[2] <= 0;
            regFile[3] <= 0;
            regFile[4] <= 0;
            regFile[5] <= 0;
            regFile[6] <= 0;                  
            regFile[7] <= 0;
            regFile[8] <= 0;
            regFile[9] <= 0;
            regFile[10] <= 0;
            regFile[11] <= 0;
            regFile[12] <= 0;
            regFile[13] <= 0;
            regFile[14] <= 0;
            regFile[15] <= 0;
        end
    end 
    
endmodule
