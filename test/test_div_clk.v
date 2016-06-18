`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:19:04 06/09/2016
// Design Name:   divide_clk
// Module Name:   H:/MIPT/8 Semestr/TKY/test/test_div_clk.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divide_clk
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_div_clk;

	// Inputs
	reg clk;

	// Outputs
	wire divided_clk;

	// Instantiate the Unit Under Test (UUT)

	divide_clk #(.d(2)) uut
	(
		.clk(clk), 
		.divided_clk(divided_clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		
		
	end
	
	always begin
		clk = !clk;
		#10;
	end
      
endmodule

