
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2016 02:19:29 AM
// Design Name: 
// Module Name: random_generator
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

module random_generator(input logic clk,random,load,mode,
                        input logic[5:0] seed,
                        output logic[23:0] column1,
                        output logic[23:0] column2);//COOLEST PART ON PROJECT ;)
logic[2:0] first;
logic[2:0] second;

lfsr lfsr(clk,random,load,seed,first,second);// just take last 3 decimals
always_comb
begin
   case(first)
       3'b000: column1 = (mode)?8'b1111_0001:8'b1110_0111;
       3'b001: column1 = (mode)?8'b1000_1111:8'b1000_0011;
       3'b010: column1 = (mode)?8'b1111_0011:8'b1100_0001;
       3'b011: column1 = (mode)?8'b1100_1111:8'b1100_0011;
       3'b100: column1 = (mode)?8'b1110_0111:8'b1000_0111;
       3'b101: column1 = (mode)?8'b1111_1001:8'b1110_0001;
       3'b110: column1 = (mode)?8'b1001_1111:8'b1100_0111;
       3'b111: column1 = (mode)?8'b1100_0111:8'b1110_0011;
       default:column1 = 8'b1110_0011;
    endcase
    
    case(second)
        3'b000: column2 = (mode)?column1:8'b1110_0111;
        3'b001: column2 = (mode)?column1:8'b1000_0011;
        3'b010: column2 = (mode)?column1:8'b1100_0001;
        3'b011: column2 = (mode)?column1:8'b1100_0011;
        3'b100: column2 = (mode)?column1:8'b1000_0111;
        3'b101: column2 = (mode)?column1:8'b1110_0001;
        3'b110: column2 = (mode)?column1:8'b1100_0111;
        3'b111: column2 = (mode)?column1:8'b1110_0011;
        default:column2 = 8'b1110_0011;
     endcase 
end
   
endmodule
