`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:47 06/17/2016
// Design Name:   Gen_txen_DAT
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab406AD/test_Gen_txen_DAT.v
// Project Name:  Lab406AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Gen_txen_DAT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Gen_txen_DAT;

	// Inputs
	reg st;
	reg clk;

	// Outputs
	wire txen;
	wire [15:0] DAT;
	wire [15:0] CW_TX;
	wire [15:0] DW_TX;

	// Instantiate the Unit Under Test (UUT)
	Gen_txen_DAT uut (
		.st(st), 
		.txen(txen), 
		.clk(clk), 
		.DAT(DAT), 
		.CW_TX(CW_TX), 
		.DW_TX(DW_TX)
	);

	initial begin
		// Initialize Inputs
		st = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		st = 1;
		#10;
		st = 0;
	end

	always begin
		clk <= !clk;
		#10;
	end
endmodule

