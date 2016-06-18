`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:24 06/09/2016 
// Design Name: 
// Module Name:    Data_gen 
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
module Data_gen(
		input wire clk,
		input wire reset,
		input wire inc,
		output [15:0] data
    );

reg [15:0] data_reg = 16'h9ABC;
assign data = data_reg;

divide_clk #(.d(21)) divider(.clk(clk), .out(divided_clk));

reg mode = 0;

reg [63:0] counter = 0;

reg [2:0] div = 0;

always @(posedge divided_clk) begin
	div <= div + 1;
	counter <= inc ? counter + 1 : 0;
	mode <= ((inc == 0)&(counter > 4)) ? !mode : (counter == 1) ? !mode : mode;
	
	data_reg <= (reset) ? 0 :  (counter > 400) ? ( mode ? data_reg + 65 :  data_reg - 65):
										(counter > 300) ? ( mode ? data_reg + 31 :  data_reg - 31):
										(counter > 200) ? ( mode ? data_reg + 7 :  data_reg - 7):
										(counter > 100) ? ( mode ? data_reg + 1 :  data_reg - 1):
										((counter > 4) && (div == 0)) ? ( mode ? data_reg + 1  :  data_reg - 1) : data_reg;
end

endmodule
