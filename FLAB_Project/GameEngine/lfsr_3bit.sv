

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2016 04:55:24 PM
// Design Name: 
// Module Name: lfsr_3bit
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


module lfsr_3bit(input logic clk,clk_en,load,
                 input logic[2:0] seed,
                 output logic[2:0] out);
    logic[2:0] state_out;
    logic[2:0] state_in;
    logic nextbit;
    mux m[2:0] (seed,
                {
                state_out[1],
                state_out[0],
                nextbit},
                load,
                state_in);//state_out is corresponding linear feedback input
                
    flipflop f[2:0](state_in,clk,clk_en,state_out);//shift register      
    xor feedback(nextbit,state_out[1],state_out[2]);//connect xor as a feedback
    
    assign out[2:0] = {state_out[2:0]};
      
endmodule

