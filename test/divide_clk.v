`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:39 06/09/2016 
// Design Name: 
// Module Name:    divide_clk 
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
module divide_clk 
		#(
			parameter d = 1
		)
		(
			input clk,
			output wire out
		);

reg [d:0] counter = 0;

assign out = counter[d - 1];

always @(posedge clk) begin
	counter <= counter - 1;
end

endmodule
