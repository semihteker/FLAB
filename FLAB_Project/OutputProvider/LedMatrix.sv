`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/28/2016 01:29:19 AM
// Design Name:
// Module Name:
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

module LedMatrix( input clk, input logic [7:0][23:0] inp, output logic [7:0] rowsOut, output logic shcp, stcp, mr, oe, ds);

    logic f;
    logic [23:0] dstotal;
    logic greenDivider=0;
    assign dstotal = greenDivider ? {inp[a][23:16],8'b0,inp[a][7:0]} : {8'b0,inp[a][15:8],8'b0};
    int i; logic [2:0] a = 0;
    divide divider(clk, shcp, stcp , oe, i,f);

    always_ff@(negedge f)
        begin
        if(i<3)
            mr<=0;
        else
            mr<=1;
        if(i>2&&i<27)
            ds <= dstotal[i-3];
        else
            ds <=0;
        end

    always_ff@(negedge f)
        if(i==410) begin
            if(greenDivider)
            a <= a+1;
            else a<=a;
            greenDivider++;
        end
        else begin
            a <= a;
            greenDivider<=greenDivider;
        end

    always_comb
    case(a)
        0: rowsOut = 1;
        1: rowsOut = 2;
        2: rowsOut = 4;
        3: rowsOut = 8;
        4: rowsOut = 16;
        5: rowsOut = 32;
        6: rowsOut = 64;
        7: rowsOut = 128;
    default: rowsOut = 0;
    endcase

endmodule

module divide(input logic clk, output logic shcp, stcp,oe, int i, output logic f );

    logic [7:0] counter =0;

    always_ff@(posedge clk)
        counter <= counter+1;

    assign f = counter[7];

    always_ff@(negedge f)
    if(i==410)
        i<=1;
    else
        i <= i+1;
    always_ff@(negedge clk)
        if(i<28)
        begin
            shcp<=f;
            stcp<=~f;
        end
        else
        begin
            shcp<=0;
            stcp<=1;
        end

    always_ff@(posedge f)
        if(i>28 && i<409)
            oe <= 0;
        else
            oe<= 1;
endmodule
