`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:27:13 06/17/2016
// Design Name:   UTXD1B
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab404/tx_test.v
// Project Name:  Lab404
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UTXD1B
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tx_test;

	// Inputs
	reg clk;
	reg [7:0] dat;
	reg st;

	// Outputs
	wire TXD;
	wire ce_tact;
	wire en_tx_byte;
	wire [3:0] cb_bit;
	wire T_start;
	wire T_dat;
	wire T_stop;
	wire ce_stop;
	wire [7:0] sr_dat;

	// Instantiate the Unit Under Test (UUT)
	UTXD1B uut (
		.clk(clk), 
		.TXD(TXD), 
		.dat(dat), 
		.ce_tact(ce_tact), 
		.st(st), 
		.en_tx_byte(en_tx_byte), 
		.cb_bit(cb_bit), 
		.T_start(T_start), 
		.T_dat(T_dat), 
		.T_stop(T_stop), 
		.ce_stop(ce_stop), 
		.sr_dat(sr_dat)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		dat = 8'hE;
		st = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		st = 1;
		#10;
		st = 0;

	end
      
	always begin
		clk <= ! clk;
		#10;
	end
endmodule

