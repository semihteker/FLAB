
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/24/2016 11:59:56 PM
// Design Name:
// Module Name: lfsr
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

module lfsr(input logic clk,random,load,
            input logic[5:0]seed,
            output logic[2:0] first_column,
            output logic[2:0] second_column);// just take last 3 decimals

logic[5:0] state_out;
logic[5:0] state_in;
logic nextbit;
mux m[5:0] (seed,
            {
            state_out[4],
            state_out[3],
            state_out[2],
            state_out[1],
            state_out[0],
            nextbit},
            load,
            state_in);//state_out is corresponding linear feedback input

flipflop f[5:0](state_in,clk,random,state_out);//shift register
xor feedback(nextbit,state_out[4],state_out[5]);//connect xor as a feedback

assign first_column={state_out[2:0]};
assign second_column = {state_out[5:3]};

endmodule
