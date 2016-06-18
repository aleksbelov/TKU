`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:37 06/18/2016 
// Design Name: 
// Module Name:    SPI_MASTER 
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
module SPI_MASTER( 	input clk,
							input st,
							input MISO,
							input [7:0] DI,
							
							output LOAD_out,
							output SCLK_out,
							output MOSI_out,
							output reg [7:0] DO // принятые данные (запись по фронту LOAD)
    );

parameter Tbit = 1000; // 1 мкс Длительность передачи одного бита - SCLK: _|-|
parameter Tce = Tbit/2; // Период сигнала SCLK
parameter Tclk = 20; 


reg [7:0] sr_MRX = 0;
reg [7:0] sr_MTX = 0;
reg [7:0] cb_tact = 0; // счетчик такта
reg [4:0] cb_bit = 0; // счетчик бит

reg start = 0;
reg LOAD = 1;
reg SCLK = 0;

assign LOAD_out = LOAD;
assign SCLK_out = SCLK;
assign MOSI_out = sr_MTX[7];

always @(posedge clk) begin
	start <= st & LOAD;
	
	LOAD <= start ? 0 : (cb_bit == 8) ? 1 : LOAD;
	cb_tact <= (start | cb_tact == (Tce/Tclk - 1)) ? 0 : cb_tact+1; // Tce/Tclk = 25
	SCLK <= (LOAD) ? 0 : cb_tact == (Tce/Tclk - 1) ? !SCLK : SCLK;
	cb_bit <= start ? 0 : cb_tact == (Tce/Tclk - 1) & SCLK ? cb_bit+1 : cb_bit;
	
	sr_MTX <= LOAD ? DI : ((cb_tact == (Tce/Tclk - 1)) &  SCLK) ? sr_MTX<<1 : sr_MTX; // спад SCLK, сдвиг передачи
	sr_MRX <= LOAD ? 0 :  ((cb_tact == (Tce/Tclk - 1)) & !SCLK) ? (sr_MRX<<1) + MISO : sr_MRX; // фронт SCLK, прием
end

always @(posedge LOAD) begin
	DO <= sr_MRX;
end

endmodule
