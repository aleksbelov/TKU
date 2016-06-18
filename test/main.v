`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:11 06/09/2016 
// Design Name: 
// Module Name:    main 
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
module main(    
					input F50MHz    /*clk*/,
					input BTN0      /*st*/,
					input BTN1,
					output [3:0] AN,        // Аноды
					output [6:0] seg,       // Сегменты
					output seg_P,           // Точка
					output ce1mss);


wire [15:0] sr_dat;
wire clk;

assign clk = F50MHz;

wire push_btn1;

button b(.b(BTN1), .clk(clk), .out(push_btn1));

Data_gen gen(.clk(clk), .data(sr_dat[15:0]), .reset(BTN0), .inc(push_btn1));


DISPLAY dis(.clk(clk), 				.AN(AN), //Аноды
            .dat(sr_dat[15:0]),		.seg(seg), //Сегменты
            .set_P(set_P), 			.seg_P(seg_P), //Точка
            .ce1ms(ce1mss));
				
endmodule
