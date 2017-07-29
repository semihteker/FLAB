

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/13/2016 03:28:34 PM
// Design Name:
// Module Name: RandomColoring
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
// Powerful Random Generator with LinearShiftBackRegister!

module RandomColoring(input logic clk,clk_en,load,
                      input logic[5:0] seed,
                      output logic[23:0] out);
    logic[2:0] first;
    logic[2:0] second;
    logic[4:0] concat;
    lfsr lfsr(clk,clk_en,load,seed,first,second);
    assign concat[2:0] = first[2:0];
    assign concat[4:3] = second[1:0];


    always_comb
        begin
            case(concat)
                5'd0: out = 24'b10000101_11001101_01001001;
                5'd1: out = 24'b11011001_10101010_10101010;
                5'd2: out = 24'b01101001_01011011_01101011;
                5'd3: out = 24'b10101010_00011111_01001010;
                5'd4: out = 24'b01001111_11110110_10111111;
                5'd5: out = 24'b01010110_01110101_10001100;
                5'd6: out = 24'b11110101_10001001_10010111;
                5'd7: out = 24'b10110100_00110110_00101000;
                5'd8: out = 24'b00001010_10000001_01010100;
                5'd9: out = 24'b01100001_10010001_10011001;
                5'd10: out = 24'b01011001_00111011_10001001;
                5'd11: out = 24'b10110000_10000001_11001101;
                5'd12: out = 24'b01111101_11011111_01000011;
                5'd13: out = 24'b11100110_10111101_10010110;
                5'd14: out = 24'b00101110_01110101_00010101;
                5'd15: out = 24'b01011011_00110000_00000111;
                5'd16: out = 24'b11101001_00100011_01101100;
                5'd17: out = 24'b11000111_01101100_10100111;
                5'd18: out = 24'b01101111_11101011_11000101;
                5'd19: out = 24'b01110011_01111101_01001101;
                5'd20: out = 24'b11111111_00101001_10111001;
                5'd21: out = 24'b00110000_10100111_01110010;
                5'd22: out = 24'b11111100_01010001_00011101;
                5'd23: out = 24'b10000101_11010101_11101101;
                5'd24: out = 24'b11101110_00001001_10011001;
                5'd25: out = 24'b00000111_10011100_10000110;
                5'd26: out = 24'b01001110_10111011_10110001;
                5'd27: out = 24'b11011110_01010011_00001110;
                5'd28: out = 24'b11101000_11000101_00101110;
                5'd29: out = 24'b00110001_00000011_11011010;
                5'd30: out = 24'b00010011_10100100_01100011;
                5'd31: out = 24'b11101011_10100001_00001000;
            endcase
        end
endmodule
