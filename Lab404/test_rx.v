`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:05:44 06/18/2016
// Design Name:   URXD1B
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab404/test_rx.v
// Project Name:  Lab404
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: URXD1B
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_rx;

	// Inputs
	reg In;
	reg clk;

	// Outputs
	wire RXD;

	// Instantiate the Unit Under Test (UUT)
	URXD1B uut (
		.In(In), 
		.clk(clk), 
		.RXD(RXD)
	);

	initial begin
		// Initialize Inputs
		In = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		
		In = 1;
		#20;
		In = 0;
		#20;
		In = 1;
		#20;
		In = 0;
        
		// Add stimulus here

	end
	
	always begin
		clk <= !clk;
		#10;
	end
      
endmodule

