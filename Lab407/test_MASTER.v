`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:24:06 06/18/2016
// Design Name:   SPI_MASTER
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab407/test_MASTER.v
// Project Name:  Lab407
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_MASTER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_MASTER;

	// Inputs
	reg clk;
	reg st;
	reg MISO;
	reg [7:0] DI;

	// Outputs
	wire LOAD_out;
	wire SCLK_out;
	wire MOSI_out;
	wire [7:0] DO;

	// Instantiate the Unit Under Test (UUT)
	SPI_MASTER uut (
		.clk(clk), 
		.st(st), 
		.MISO(MISO), 
		.DI(DI), 
		.LOAD_out(LOAD_out), 
		.SCLK_out(SCLK_out), 
		.MOSI_out(MOSI_out), 
		.DO(DO)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		st = 0;
		MISO = 0;
		DI = 8'hA6;

		// Wait 100 ns for global reset to finish
		#100;
       
		st = 1;
		#20;
		st = 0;
		// Add stimulus here

	end
      
		
	always begin
		clk = !clk;
		#10;
	end
endmodule

