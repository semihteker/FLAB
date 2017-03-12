
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Onur Sönmez
// 
// Create Date: 12/16/2016 01:05:12 AM
// Design Name: 
// Module Name: DifficultyLevel
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


module DifficultyLevel(input logic[1:0] difficulty,
                       output logic[28:0] size,
                       output logic[2:0] nums);
    always_comb
        case(difficulty)
            2'b00:begin
                 size = 29'd60000000;
                 nums = 3'b1;
            end
            2'b01:begin
                 size = 29'd45000000;
                 nums = 3'b1;
            end
            2'b10:begin
                 size = 29'd45000000;
                 nums = 3'd2;
            end
            2'b11:begin
                 size = 29'd30000000;
                 nums = 3'd3;
             end
            default: size = 29'd60000000;
        endcase    
endmodule
