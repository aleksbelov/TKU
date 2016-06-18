`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:23 06/17/2016 
// Design Name: 
// Module Name:    URXD1B 
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
module URXD1B(	input wire In,
					input wire clk,
					
					output reg [7:0] RXD = 0,
					output reg ok
    );

parameter Fclk=50000000; //50 MHz
parameter VEL = 115200; //115.2 kBod (из таблицы 1 вариантов)
parameter Nt = Fclk/VEL; //~434
reg [15:0] cb_tact = 0; //Счетчик такта
reg [3:0]  cb_bit = 0; // Счетчик бит
assign ce_tact = (cb_tact==Nt); // Границы бит
assign ce_bit = (cb_tact == Nt/2); // Серидины бит


reg en_rx_byte = 0;
reg [1:0] in_buf = 0;
assign In_front = (in_buf[0] ^ in_buf[1]) & !in_buf[0];
assign start = In_front & !en_rx_byte;

assign T_start = !In & (cb_bit == 0); // Компаратор старт такта
assign T_dat = (cb_bit<9) & (cb_bit>0); // Компаратор интервала данных
assign T_stop = ((cb_bit==9) & en_rx_byte); // Компаратор стоп такта




always @(posedge clk) begin
	cb_tact <= (start | ce_tact) ? 1 : cb_tact + 1 ; //"Сброс" в 1 при cb_tact==Nt
	in_buf <= (in_buf << 1) + In;
	en_rx_byte = (ce_bit & T_start) ? 1 : (ce_bit & T_stop) ? 0 : en_rx_byte;
	cb_bit <= start ? 0 : (ce_tact & en_rx_byte) ? cb_bit+1 : cb_bit ;
	RXD <= (T_dat & ce_bit) ? (RXD >> 1 | {In,7'b0}) : RXD;
	ok <= (T_stop & ce_bit & RXD) ? 1 : 0;
end


endmodule
