`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:47 06/18/2016 
// Design Name: 
// Module Name:    Sch_404 
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
module Sch_404(	input wire F50MHz,
						input wire BTN0,
						
						output wire seg_P,
						output wire [3:0]AN,
						output wire [6:0]seg);
wire [7:0] dat_to_send = 8'hA7;
wire TXD;

UTXD1B tx ( .clk(F50MHz),
				.dat(dat_to_send),
				.st(BTN0),
				.TXD(TXD));
				
wire [7:0] RX_DATA;
wire ok_rx;
URXD1B rx ( .clk(F50MHz),
				.In(TXD),
				.RXD(RX_DATA),
				.ok(ok_rx));
				
reg [7:0] data_recvd = 0;

always @(posedge F50MHz) begin
	data_recvd <= ok_rx ? RX_DATA : data_recvd;
end

DISPLAY display ( .clk(F50MHz),
						.dat({dat_to_send, data_recvd}),
						.AN(AN),
						.seg(seg),
						.seg_P(seg_P));

endmodule
