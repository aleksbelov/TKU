`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:26 06/18/2016 
// Design Name: 
// Module Name:    Lab_407 
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
module Lab_407( 	input F50MHz,
						input BTN0,
						
						output [3:0] AN,
						output [6:0] seg,
						output seg_P
    );
wire [7:0] MASTER_DI;
wire [7:0] MASTER_DO;
wire [7:0] SLAVE_DI;
wire [7:0] SLAVE_DO;

wire LOAD, MISO, MOSI, SCLK;

reg [7:0] m_di = 8'hAB;
reg [7:0] s_di = 8'h97;

assign MASTER_DI = m_di;
assign SLAVE_DI = s_di;

SPI_MASTER master (	.clk(F50MHz),
							.st(BTN0),
							.MISO(MISO),
							.DI(MASTER_DI),
							
							.LOAD_out(LOAD),
							.SCLK_out(SCLK),
							.MOSI_out(MOSI),
							.DO(MASTER_DO)
						);

SPI_SLAVE slave	(	.LOAD(LOAD),
							.SCLK(SCLK),
							.MOSI(MOSI),
							.DI(SLAVE_DI),
							
							.MISO(MISO),
							.DO(SLAVE_DO)
						);
							
DISPLAY display 	( 	.clk(F50MHz),
							.dat(disp_dat),
							.AN(AN),
							.seg(seg),
							.seg_P(seg_P)
						);

endmodule
