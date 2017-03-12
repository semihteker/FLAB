`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2016 08:19:05 AM
// Design Name: 
// Module Name: ButtonSynchronizer
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


module ButtonSynchronizer( input logic in,clk,reset,
                           output logic out );
typedef enum logic [1:0] {S0,S1,S2} stateType;
stateType [1:0] state,nextState;                          
//register
always_ff@(posedge clk,posedge reset)//no resetable ff
    state <=(reset)?S0: nextState;
    
//next state logic
always_comb   
    case(state)
        S0: nextState = (in)?S1:S0;
        S1: nextState = (in)?S2:S0;
        S2: nextState = (in)?S2:S0;
        default: nextState = S0;  
    endcase  
    
//output logic
assign out = (state == S1);
                    
endmodule
