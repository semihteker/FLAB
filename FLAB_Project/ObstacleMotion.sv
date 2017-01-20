
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2016 10:45:09 PM
// Design Name: 
// Module Name: ObstacleMotion
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


module ObstacleMotion(input logic[1:0][23:0]inp1,
                      input logic[1:0][23:0]inp0,
                      input logic cont,clk,
                      input logic reset,
                      output logic genRandom1,genRandom2,
                      output logic[7:0][23:0] out,
                      output logic[23:0] last,
                      output logic isPassed );
typedef enum logic [3:0]{init,S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14} stateType;
stateType [3:0] state,nextState;                          
//register
always_ff@(posedge clk,posedge reset) begin
        state <=(reset)?init:nextState;
end
always_comb
     case(state)
        init:begin
            out[7:0] = {8{1'b0}};
            nextState = (cont)?S0:init;
        end    
        S0:
        begin
             out[7:1]={7{1'b0}};
             out[0]=inp1[1];
             last = inp1[1];            
             nextState =(cont)?S1:S0;        
        end
        S1:
        begin
            out[7:2]={6{1'b0}};
            out[1]=inp1[1];
            out[0]=inp1[0];
            last = (inp1[1][4:0] > inp1[0][4:0])?inp1[1]:inp1[0];
            nextState =(cont)?S2:S1;
        end
        S2:
        begin
            out[7:3]={5{1'b0}};
            out[0]=1'b0;
            out[2]=inp1[1];
            out[1]=inp1[0];
            last = (inp1[1][4:0] > inp1[0][4:0])?inp1[1]:inp1[0]; 
            nextState =(cont)?S3:S2;
        end
        S3:
        begin
            out[7:4]={4{1'b0}};
            out[3]=inp1[1];
            out[2]=inp1[0]; 
            last = (inp1[1][4:0] > inp1[0][4:0])?inp1[1]:inp1[0];
            out[1:0]={2{1'b0}};
            nextState =(cont)?S4:S3;
        end
        S4:
        begin
            out[7:5]={3{1'b0}};
            out[4]=inp1[1];
            out[3]=inp1[0];
            last = (inp1[1][4:0]> inp1[0][4:0])?inp1[1]:inp1[0];
            out[2:0]={3{1'b0}};
            nextState =(cont)?S5:S4;
        end
        S5:
        begin
            out[7:6]={2{1'b0}};
            out[5]=inp1[1];
            out[4]=inp1[0];
            last = (inp1[1][4:0] > inp1[0][4:0])?inp1[1]:inp1[0];
            out[3:0]={4{1'b0}};
            nextState =(cont)?S6:S5;
        end
        S6:
        begin
            out[6]=inp1[1];
            out[5]=inp1[0];
            out[0]=inp0[1];
            last = (inp1[1][4:0]> inp1[0][4:0])?inp1[1]:inp1[0];
            out[4:1]={4{1'b0}};
            out[7] = 1'b0;
            nextState =(cont)?S7:S6;
        end
        S7:
        begin
            out[7]=inp1[1];
            out[6]=inp1[0];
            last = (inp1[1][4:0] > inp1[0][4:0])?inp1[1]:inp1[0];
            out[1]=inp0[1];
            out[0]=inp0[0];
            out[5:2]={4{1'b0}};
            nextState =(cont)?S8:S7;
        end
        S8:
        begin
            out[7]=inp1[0];
            out[2]=inp0[1];
            out[1]=inp0[0];
            last = (inp0[1][4:0] > inp0[0][4:0])?inp0[1]:inp0[0];
            out[6:3]={4{1'b0}};
            out[0] = 1'b0;
            nextState =(cont)?S9:S8;
        end
        S9:begin
            out[7:4] ={8{1'b0}};
            out[3]=inp0[1];
            out[2]=inp0[0];
            last = (inp0[1][4:0] > inp0[0][4:0])?inp0[1]:inp0[0];
            out[1:0] ={2{1'b0}};
            nextState =(cont)?S10:S9;  
         end
        S10:begin
            out[7:5]={3{1'b0}};
            out[4]=inp0[1];
            out[3]=inp0[0];
            last = (inp0[1][4:0] > inp0[0][4:0])?inp0[1]:inp0[0];
            out[2:0]={3{1'b0}};
            nextState =(cont)?S11:S10; 
        end
        S11:begin
             out[7:6]={2{1'b0}};
             out[5]=inp0[1];
             out[4]=inp0[0];
             last = (inp0[1][4:0] > inp0[0][4:0])?inp0[1]:inp0[0];
             out[3:0]={4{1'b0}};
             nextState =(cont)?S12:S11; 
        end
        S12:begin
             out[4:1]={4{1'b0}};
             out[6]=inp0[1];
             out[5]=inp0[0];
             last = (inp0[1][4:0] > inp0[0][4:0])?inp0[1]:inp0[0];
             out[0]=inp1[1];
             out[7]=1'b0;
             nextState =(cont)?S13:S12; 
         end
         S13:begin
             out[7]=inp0[1];
             out[6]=inp0[0];
             out[5:2]={4{1'b0}};
             out[1]=inp1[1];
             last = (inp0[1][4:0] > inp0[0][4:0])?inp0[1]:inp0[0];
             out[0]=inp1[0];
             nextState =(cont)?S14:S13; 
         end
         S14:begin
            out[7]=inp0[0];
            out[6:3]={4{1'b0}};
            out[2]=inp1[1];
            last = (inp1[1][4:0] > inp1[0][4:0])?inp1[1]:inp1[0];
            out[1]=inp1[0];
            out[0]=1'b0;
            nextState =(cont)?S3:S14;
         end
        default: nextState = S0;
    endcase
    assign isPassed = (state == S14) | (state == S8);   
    assign genRandom1 = (state == S11) | (state == init);
    assign genRandom2 = (state == S5) | (state == init);
endmodule
