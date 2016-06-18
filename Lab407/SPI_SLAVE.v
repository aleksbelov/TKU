`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:17 06/18/2016 
// Design Name: 
// Module Name:    SPI_SLAVE 
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
module SPI_SLAVE( //input clk,
						input wire LOAD, // 0 - передача
						input wire SCLK, // импульсы записи бит в регистр сдвига
						input wire MOSI, // линия принимаемых данных
						input wire [7:0] DI,
						
						output wire MISO,
						output reg [7:0] DO
    );
	 
parameter m = 8;

reg [7:0] sr_STX = 0;
reg [7:0] sr_SRX = 0;

assign MISO = sr_STX[7];

always @(posedge SCLK) begin // Прием в регистр сдвига по фронту SCLK
	sr_SRX <= (sr_SRX << 1) + MOSI;
end

always @(posedge LOAD) begin // Запись принятых данных для хранения
	DO <= sr_SRX;
end

always @(posedge LOAD or negedge SCLK) begin
	sr_STX <= LOAD ? DI : sr_STX << 1;
end

endmodule
