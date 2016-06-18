`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:15:31 06/18/2016
// Design Name:   Lab_407
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab407/test_Lab_407.v
// Project Name:  Lab407
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Lab_407
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Lab_407;

	// Inputs
	reg F50MHz;
	reg [3:0] AN;
	reg [6:0] seg;
	reg seg_P;
	reg BTN0;

	// Instantiate the Unit Under Test (UUT)
	Lab_407 uut (
		.F50MHz(F50MHz), 
		.AN(AN), 
		.seg(seg), 
		.seg_P(seg_P), 
		.BTN0(BTN0)
	);

	initial begin
		// Initialize Inputs
		F50MHz = 0;
		AN = 0;
		seg = 0;
		seg_P = 0;
		BTN0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		BTN0 = 1;
		#20;
		BTN0 = 0;
		// Add stimulus here

	end
	
	always begin
		F50MHz = !F50MHz;
		#10;
	end

endmodule

