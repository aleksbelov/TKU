`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:43:07 06/18/2016
// Design Name:   Sch_404
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab404/Lab_404_test.v
// Project Name:  Lab404
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sch_404
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Lab_404_test;

	// Inputs
	reg F50MHz;
	reg BTN0;

	// Outputs
	wire seg_P;
	wire [3:0] AN;
	wire [6:0] seg;

	// Instantiate the Unit Under Test (UUT)
	Sch_404 uut (
		.F50MHz(F50MHz), 
		.BTN0(BTN0), 
		.seg_P(seg_P), 
		.AN(AN), 
		.seg(seg)
	);

	initial begin
		// Initialize Inputs
		F50MHz = 0;
		BTN0 = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		BTN0 = 1;
		#20;
		BTN0 = 0;
		#100000
		BTN0 = 1;
		#10;
		BTN0 = 0;
		// Add stimulus here

	end
	
	always begin
		F50MHz <= !F50MHz;
		#10;
	end
      
endmodule

