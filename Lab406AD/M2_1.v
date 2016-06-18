`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:12 06/11/2016 
// Design Name: 
// Module Name:    M2_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module M2_1(input D0,	output wire O,
            input D1,
            input S0);
            
assign O = S0? D1: D0;

endmodule
