`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:49:30 06/10/2016
// Design Name:   ARINC_429
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab405AD/test_arinc429.v
// Project Name:  Lab405AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ARINC_429
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_arinc429;

	// Inputs
	reg F50MHz;
	reg BTN0;
	reg BTN1;
	reg reset;
	// Outputs

	// Instantiate the Unit Under Test (UUT)
	ARINC_429 uut (
		.F50MHz(F50MHz), 
		.BTN0(BTN0), 
		.BTN1(BTN1),
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		F50MHz = 0;
		BTN0 = 0;
		BTN1 = 0;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#100;
      
		reset = 1;
		#20;
		reset = 0;
		#20;
		
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

