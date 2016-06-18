`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:02 06/10/2016 
// Design Name: 
// Module Name:    ARINC_429 
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
module ARINC_429(
					input F50MHz    /*clk*/,
					input BTN0      /*st*/,
					input BTN1,
					input BTN2,
					input reset,
					
					input JB1,
					input JB7,

					output JA1,
					output JA7,
					
					output [3:0] AN,        // Аноды
					output [6:0] seg,       // Сегменты
					output seg_P,           // Точка
					output ce1mss);

parameter [1:0] Vel = 2;
reg [15:0] test_dat = 16'h9ABC;

reg [22:0] data1 = 23'h123400;
reg [7:0]  adr1 = 8'b10000011;
reg [22:0] data2 = 23'h9A8E00;
reg [7:0]  adr2 = 8'b10010001;

reg [22:0] data_to_send = 23'h123400;
reg [7:0]  adr_to_send = 8'b10000011;

reg switch = 0;
reg [1:0] switchState = 0;
/*
reg [7:0] outreg = 0;
assign JA1 = outreg[0];
assign JA2 = outreg[1];
assign JA3 = outreg[2];
assign JA4 = outreg[3];
assign JA5 = outreg[4];
assign JA6 = outreg[5];
assign JA7 = outreg[6];
assign JA8 = outreg[7];


assign LED1 = JB1;
assign LED2 = JB2;
assign LED3 = JB3;
assign LED4 = JB4;
assign LED5 = JB5;
assign LED6 = JB6;
assign LED7 = JB7;
assign LED0 = JB8;
*/
always @(posedge F50MHz) begin
//	outreg <= 8'hff;
	
	switchState <= {switchState[0], BTN2};
	switch <= switchState == 1 ? !switch : switch;
	data_to_send <= switch ? data1 : data2;
	adr_to_send <= switch ? adr1 : adr2;
end

wire D0;
wire D1;

AR_TXD tx(	.clk(F50MHz),
				.Nvel(Vel),
				.ADR(adr_to_send),
				.DAT(data_to_send),
				.st(BTN0),
				.reset(reset),
				
				.TXD0(JA1),
				.TXD1(JA7));
				
wire [22:0] data_recv;
wire [7:0]  adr_recv;
wire ce_wr;

AR_RXD rx(	.clk(F50MHz),
				.RXD0(JB1),
				.RXD1(JB7),
				.out_dat(data_recv),
				.out_adr(adr_recv),
				.ce_wr(ce_wr));
				
wire [15:0] data_disp = BTN1 ? adr_recv : data_recv[22:8];

DISPLAY dis(.clk(F50MHz), 				.AN(AN), //Аноды
            .dat(data_disp),		.seg(seg), //Сегменты
            .set_P(set_P), 			.seg_P(seg_P), //Точка
            .ce1ms(ce1mss));
				

endmodule
