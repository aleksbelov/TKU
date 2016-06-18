`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:08 06/10/2016 
// Design Name: 
// Module Name:    AR_RXD 
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
module AR_RXD(
	input wire clk,
	input wire RXD0,
	input wire RXD1,
	output reg [7:0] out_adr = 0,
	output reg [22:0] out_dat = 0,
	output wire ce_wr
	);
	
	wire QM = RXD0 | RXD1;
	reg [1:0] QM_front = 0; // Детектор фронта QM
	reg [4:0] bit_count = 0; // Счетчик бит
	reg [7:0] adr = 0; // Регистр приема адреса
	reg [23:0] dat = 0; // Регистр приема данных  и бита контроля четности
	wire to_recv_adr = bit_count < 8; // Интервал приема адреса
	wire to_recv_dat = bit_count > 7; // Интервал приема данных
	
	reg error = 0;
	reg end_recv = 0;
	
	always @(posedge clk) begin
		QM_front 	<= {QM_front[0], QM};
		bit_count 	<= (QM_front == 2'b01) 	? bit_count + 1 : bit_count;
		end_recv 	<= (QM_front == 2'b01) 	? ((bit_count == 31 | bit_count == 0) ? 1 : 0 ) : end_recv;
		adr 			<= (QM_front == 2'b01) 	? (bit_count == 0 ? {7'b0000000, RXD1} : (to_recv_adr ? {adr[6:0], RXD1}  : adr)) : adr;
		dat 			<= (QM_front == 2'b01) 	? (bit_count == 0 ? 0 : (to_recv_dat ? {RXD1, dat[23:1]} : dat)) : dat;
		error			<= (bit_count == 31 | bit_count == 0)   	? !((^adr) ^ (^dat)) : 0;
		out_adr		<= (bit_count == 31 | bit_count == 0)		? adr : 0;
		out_dat		<= (bit_count == 31 | bit_count == 0)		? dat[22:0] : 0; 
	end


endmodule
