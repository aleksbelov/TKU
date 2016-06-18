`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:35:52 06/09/2016
// Design Name:   Data_gen
// Module Name:   H:/MIPT/8 Semestr/TKY/test/test_data_gen.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_data_gen;

	// Inputs
	reg clk;
	reg reset;
	reg inc;

	// Outputs
	wire [15:0] data;

	// Instantiate the Unit Under Test (UUT)
	Data_gen uut (
		.clk(clk), 
		.reset(reset), 
		.inc(inc), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		inc = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		inc = 1;
	end
	
	always begin
		clk = !clk; #10;
	end
      
endmodule

