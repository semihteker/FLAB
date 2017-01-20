
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2016 05:09:39 PM
// Design Name: 
// Module Name: Upset
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


module Upset(input logic clk,clk_en,load,
             input logic[2:0] seed,
             output logic[7:0][23:0] out);
        logic[2:0] upset;   
        lfsr_3bit lfsr_3bit(clk,clk_en,load,seed,upset);
        
        always_comb
            case(upset)
                3'b000:begin
                    out[7] = 24'b00000000_00111100_00000000;
                    out[6] = 24'b00000000_01000010_00000000;
                    out[5] = 24'b00000000_10100101_00000000;
                    out[4] = 24'b00000000_10001001_00000000;
                    out[3] = 24'b00000000_10001001_00000000;
                    out[2] = 24'b00000000_10100101_00000000;
                    out[1] = 24'b00000000_01000010_00000000;
                    out[0] = 24'b00000000_00111100_00000000;
               end
               3'b001:begin
                    out[7] = 24'b00000000_00000000_00111100;
                    out[6] = 24'b00000000_00000000_01000010;
                    out[5] = 24'b00000000_00000000_10100101;
                    out[4] = 24'b00000000_00000000_10001001;
                    out[3] = 24'b00000000_00000000_10001001;
                    out[2] = 24'b00000000_00000000_10100101;
                    out[1] = 24'b00000000_00000000_01000010;
                    out[0] = 24'b00000000_00000000_00111100;
               end
               3'b010:begin
                    out[7] = 24'b00111100_00000000_00000000;
                    out[6] = 24'b01000010_00000000_00000000;
                    out[5] = 24'b10100101_00000000_00000000;
                    out[4] = 24'b10001001_00000000_00000000;
                    out[3] = 24'b10001001_00000000_00000000;
                    out[2] = 24'b10100101_00000000_00000000;
                    out[1] = 24'b01000010_00000000_00000000;
                    out[0] = 24'b00111100_00000000_00000000;
               end
               3'b011:begin
                    out[7] = 24'b00111100_00111100_00000000;
                    out[6] = 24'b01000010_01000010_00000000;
                    out[5] = 24'b10100101_10100101_00000000;
                    out[4] = 24'b10001001_10001001_00000000;
                    out[3] = 24'b10001001_10001001_00000000;
                    out[2] = 24'b10100101_10100101_00000000;
                    out[1] = 24'b01000010_01000010_00000000;
                    out[0] = 24'b00111100_00111100_00000000;        
               end
               3'b100:begin
                    out[7] = 24'b00111100_00111100_00111100;
                    out[6] = 24'b01000010_01000010_01000010;
                    out[5] = 24'b10100101_10100101_10100101;
                    out[4] = 24'b10001001_10001001_10001001;
                    out[3] = 24'b10001001_10001001_10001001;
                    out[2] = 24'b10100101_10100101_10100101;
                    out[1] = 24'b01000010_01000010_01000010;
                    out[0] = 24'b00111100_00111100_00111100;  
        
               end
               3'b101:begin
                    out[7] = 24'b00000000_00111100_00111100;
                    out[6] = 24'b00000000_01000010_01000010;
                    out[5] = 24'b00000000_10100101_10100101;
                    out[4] = 24'b00000000_10001001_10001001;
                    out[3] = 24'b00000000_10001001_10001001;
                    out[2] = 24'b00000000_10100101_10100101;
                    out[1] = 24'b00000000_01000010_01000010;
                    out[0] = 24'b00000000_00111100_00111100;    
               end
               3'b110:begin
                    out[7] = 24'b00111100_00000000_00111100;
                    out[6] = 24'b01000010_00000000_01000010;
                    out[5] = 24'b10100101_00000000_10100101;
                    out[4] = 24'b10001001_00000000_10001001;
                    out[3] = 24'b10001001_00000000_10001001;
                    out[2] = 24'b10100101_00000000_10100101;
                    out[1] = 24'b01000010_00000000_01000010;
                    out[0] = 24'b00111100_00000000_00111100;   
               end
               3'b111:begin
                    out[7] = 24'b00000000_00111100_00000000;
                    out[6] = 24'b00000000_01000010_00000000;
                    out[5] = 24'b00000000_10100101_00000000;
                    out[4] = 24'b00000000_10001001_00000000;
                    out[3] = 24'b00000000_10001001_00000000;
                    out[2] = 24'b00000000_10100101_00000000;
                    out[1] = 24'b00000000_01000010_00000000;
                    out[0] = 24'b00000000_00111100_00000000;  
               end
               default:;   
            endcase
    
endmodule
