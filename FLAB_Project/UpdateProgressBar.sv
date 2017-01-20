
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2016 11:22:42 PM
// Design Name: 
// Module Name: UpdateProgressBar
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


module UpdateProgressBar(input logic clk,isPassed,reset,
                         input logic[2:0] nums,
                         output logic[15:0] progressOut,
                         output logic gameFinished);

typedef enum logic[5:0]{S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16} stateType;
stateType state,nextState;
logic[2:0] countPass;
logic passEnable;

always@(posedge clk, posedge reset) begin
  if(reset)begin
    countPass = 3'd0;
    passEnable = 1'b0;
  end
  else begin
    if( isPassed == 1'b1)
        countPass = countPass + 1;
    if ( countPass == nums )begin
        countPass = 3'd0;
        passEnable = 1'b1;
     end
     else
        passEnable = 1'b0;
   end

end

always_ff@(posedge passEnable or posedge reset)
begin
        state <= (reset)?S0:nextState;
end  

//next state logic
always_comb
    case(state)  
        S0: nextState =(isPassed)?S1:S0;
        S1: nextState =(isPassed)?S2:S1;
        S2: nextState =(isPassed)?S3:S2;
        S3: nextState =(isPassed)?S4:S3; 
        S4: nextState =(isPassed)?S5:S4;
        S5: nextState =(isPassed)?S6:S5;
        S6: nextState =(isPassed)?S7:S6; 
        S7: nextState =(isPassed)?S8:S7; 
        S8: nextState =(isPassed)?S9:S8;
        S9: nextState =(isPassed)?S10:S9;  
        S10: nextState =(isPassed)?S11:S10;
        S11: nextState =(isPassed)?S12:S11; 
        S12: nextState =(isPassed)?S13:S12;
        S13: nextState =(isPassed)?S14:S13;  
        S14: nextState =(isPassed)?S15:S14;   
        S15: nextState =(isPassed)?S16:S15;
        default: nextState = S0;    
    endcase
//output logic
assign progressOut[0] = (state != S0);
assign progressOut[1] = (progressOut[0] & state != S1);
assign progressOut[2] = (progressOut[1] & state != S2);
assign progressOut[3] = (progressOut[2] & state != S3);
assign progressOut[4] = (progressOut[3] & state != S4);
assign progressOut[5] = (progressOut[4] & state != S5);
assign progressOut[6] = (progressOut[5] & state != S6);
assign progressOut[7] = (progressOut[6] & state != S7);
assign progressOut[8] = (progressOut[7] & state != S8);
assign progressOut[9] = (progressOut[8] & state != S9);
assign progressOut[10] = (progressOut[9] & state != S10);
assign progressOut[11] = (progressOut[10] & state != S11);
assign progressOut[12] = (progressOut[11] & state != S12);
assign progressOut[13] = (progressOut[12] & state != S13);
assign progressOut[14] = (progressOut[13] & state != S14);
assign progressOut[15] = (progressOut[14] & state != S15);

assign gameFinished = progressOut[15];
  
endmodule
