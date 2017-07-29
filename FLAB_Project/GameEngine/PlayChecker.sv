
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/06/2016 11:10:35 AM
// Design Name:
// Module Name: PlayChecker
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

module PlayChecker(input logic gameFinished,gameOver,collision,//add collision logic
                   output logic endGame);
    always_comb
        begin
            endGame = gameFinished | gameOver | collision ;
        end
 // all conditions must be provided to enable continuity

endmodule
