
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2016 03:30:57 AM
// Design Name: 
// Module Name: BirdMotion_Moore
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


module BirdMotion(input logic up,cont,clk,reset,
                  output logic[23:0] head,
                  output logic [23:0]tail,
                  output logic gameOver );
typedef enum logic[4:0]{S0,S1,S2,S3,S4,S5,S6,S7,S8,
                        S9,S10,S11,S12,S13,S14,S15,
                        S16,S17,S18,S19,S20,S21,S22,S23,S24,S25} stateType;
                        
stateType[4:0] state,nextState;

always_ff@(posedge clk or posedge reset)
    begin
            state<=(reset)?S8:nextState;
    end
    
always_comb
    case(state)
        S0: nextState = S0;//(up)?S7:S0;//GAME OVER CASE 1 cause problem because it passes directly S7
        S1: nextState = (!cont)?S1:(up)?S2:S0;
        S2: nextState = (!cont)?S2:(up)?S3:S1;
        S3: nextState = (!cont)?S3:(up)?S5:S4;
        S4: nextState = (!cont)?S4:(up)?S3:S0;
        S5: nextState = (!cont)?S5:(up)?S7:S3;
        S6: nextState = (!cont)?S6:(up)?S7:S4;
        S7: nextState = (!cont)?S7:(up)?S8:S6;
        S8: nextState = (!cont)?S8:(up)?S10:S7;
        S9: nextState = (!cont)?S9:(up)?S10:S6;
        S10: nextState = (!cont)?S10:(up)?S11:S9;
        S11: nextState = (!cont)?S11:(up)?S12:S10;
        S12: nextState = (!cont)?S12:(up)?S13:S15;
        S13: nextState = (!cont)?S13:(up)?S14:S12;
        S14: nextState = (!cont)?S14:(up)?S16:S17;
        S15: nextState = (!cont)?S15:(up)?S12:S9;
        S16: nextState = (!cont)?S16:(up)?S18:S14;
        S17: nextState = (!cont)?S17:(up)?S14:S15;
        S18: nextState = (!cont)?S18:(up)?S20:S19;
        S19: nextState = (!cont)?S19:(up)?S18:S17;
        S20: nextState = (!cont)?S20:(up)?S21:S18;
        S21: nextState = (!cont)?S21:(up)?S23:S22;
        S22: nextState = (!cont)?S22:(up)?S21:S19;
        S23: nextState = (!cont)?S23:(up)?S24:S21;
        S24: nextState = (!cont)?S24:(up)?S24:S25;
        S25: nextState = (!cont)?S25:(up)?S24:S22;
        default: nextState = S7;
    endcase   
    
    //assign head[23:8] = {16{1'b0}};
    assign head[0] = (state==S1 | state==S4);
    assign head[1] = (state==S2 | state==S3 | state==S6);
    assign head[2] = (state==S5 | state==S7 | state==S9);
    assign head[3] = (state==S8 | state==S10 | state==S15);
    assign head[4] = (state==S11 | state==S12 | state==S17);
    assign head[5] = (state==S13 | state==S14 | state==S19);
    assign head[6] = (state==S16 | state==S18 | state==S22);
    assign head[7] = (state==S20 | state==S21);  
    assign head[15:8] = head[7:0];
    assign head[23:16] = head[7:0];

    assign tail[0] = (state==S1 | state==S2 );
    assign tail[1] = (state==S3 | state==S4 | state==S5);
    assign tail[2] = (state==S6 | state==S7 | state==S8);
    assign tail[3] = (state==S9 | state==S10 | state==S11);
    assign tail[4] = (state==S12 | state==S13 | state==S15);
    assign tail[5] = (state==S14 | state==S16 | state==S17);
    assign tail[6] = (state==S18 | state==S19 | state==S20);
    assign tail[7] = (state==S21 | state==S22 | state==S23);
    assign tail[15:8] = tail[7:0];
    assign tail[23:16] = tail[7:0];
    
    assign gameOver = (state == S0);//collision to boundaries


endmodule
