`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:49:05 06/17/2016 
// Design Name: 
// Module Name:    Sch_Lab406 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sch_Lab406(	input wire F50MHz,
					input wire BTN0,
					input [1:0]SW,
						
					output wire seg_P,
					output wire [3:0]AN,
					output wire [6:0]seg);

wire txen, CW_TX, DW_TX;
wire [15:0] dat_wire;

Gen_txen_DAT Gen (.st(BTN0),// inputs
                  .clk(F50MHz),
						
						.txen(txen),//outputs
						.DAT(dat_wire),
                  .CW_TX(CW_TX),
                  .DW_TX(DW_TX));
										

wire txp_wire, txn_wire, en_tx, ce_tact;
				
MIL_TXD txd (	.clk(F50MHz), // inputs
					.txen(txen),
					.dat(dat_wire),
					
					.TXP(txp_wire), //outputs
					.TXN(txn_wire),
					.en_tx(en_tx),
					.ce_tact(ce_tact));

wire [15:0] RX_DAT;
wire RX_CW_DW, ok_rx;

MIL_RXD rdx ( 	.clk(F50MHz), // inputs
					.In_P(txp_wire),
					.In_N(txn_wire),
					
					.sr_dat(RX_DAT),// outputs
					.CW_DW(RX_CW_DW),
					.ok_rx(ok_rx)
					);
wire [15:0] RX_BUF_CW, RX_BUF_DW;

BUF_RX_DAT dat_buf (	.ce(ok_rx), // inputs
                     .clk(F50MHz),
							.DAT_RX(RX_DAT),
                     .CW_DW(RX_CW_DW),
							.R(BTN0),
							
							.DAT_CW(RX_BUF_CW), //outputs
							.DAT_DW(RX_BUF_DW)
						);
wire [15:0] dat_to_display;			

assign dat_to_display = (SW[0] == 0) ? RX_BUF_CW : RX_BUF_DW;
			
DISPLAY d( 	.clk(F50MHz),
				.dat(dat_to_display),
				.AN(AN),
				.seg(seg),
				.seg_P(seg_P));
				

endmodule
