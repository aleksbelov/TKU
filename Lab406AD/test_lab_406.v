`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:15:02 06/17/2016
// Design Name:   Sch_Lab406
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab406AD/test_lab_406.v
// Project Name:  Lab406AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sch_Lab406
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_lab_406;

	// Inputs
	reg F50MHz;
	reg BTN0;

	// Outputs
	wire seg_P;
	wire [3:0] AN;
	wire [6:0] seg;

	// Instantiate the Unit Under Test (UUT)
	Sch_Lab406 uut (
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
        
		// Add stimulus here
		
		BTN0 = 1;
		#10;
		BTN0 = 0;

	end
	
	always begin
		F50MHz <= !F50MHz;
		#10;
	end
      
endmodule

