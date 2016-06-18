`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:00 06/09/2016 
// Design Name: 
// Module Name:    buttom 
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
module button(
			input wire b,
			input clk,
			output wire out
    );

wire divided_clk;

divide_clk #(.d(21)) divider(.clk(clk), .out(divided_clk));

reg [2:0] pushes = 0;

assign out = (pushes[0] & pushes[1]) | (pushes[1] & pushes[2]) | (pushes[2] & pushes[0]);

always @(posedge divided_clk) begin
	pushes <= {pushes << 1, b};
end

endmodule
