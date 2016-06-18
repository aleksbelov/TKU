`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:21:14 06/17/2016
// Design Name:   MIL_TXD
// Module Name:   H:/MIPT/8 Semestr/TKY/Lab406AD/test_txd.v
// Project Name:  Lab406AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIL_TXD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_txd;

	// Inputs
	reg clk;
	wire [15:0] dat_wire;
	wire txen;

	// Outputs
	wire TXP;
	wire TXN;
	wire SY1;
	wire SY2;
	wire en_tx;
	wire T_dat;
	wire T_end;
	wire SDAT;
	wire FT_cp;
	wire [4:0] cb_bit;
	wire ce_tact;

	// Instantiate the Unit Under Test (UUT)
	MIL_TXD uut (
		.clk(clk), 
		.TXP(TXP), 
		.dat(dat_wire), 
		.TXN(TXN), 
		.txen(txen), 
		.SY1(SY1), 
		.SY2(SY2), 
		.en_tx(en_tx), 
		.T_dat(T_dat), 
		.T_end(T_end), 
		.SDAT(SDAT), 
		.FT_cp(FT_cp), 
		.cb_bit(cb_bit), 
		.ce_tact(ce_tact)
	);
	
	wire CW_TX, DW_TX;
	
	reg st;
	Gen_txen_DAT gen (.st(st),	.txen(txen),
							.clk(clk),	    .DAT(dat_wire),
                                    .CW_TX(CW_TX),
                                    .DW_TX(DW_TX));

	initial begin
		// Initialize Inputs
		clk = 0;
		st = 0;
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

