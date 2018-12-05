`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 02:01:55 PM
// Design Name: 
// Module Name: mult_array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mult_array #(parameter WL=16) (
    input clk,
    input [WL-1:0] mult_array_in0_0,
    input [WL-1:0] mult_array_in0_1,
    input [WL-1:0] mult_array_in0_2,
    input [WL-1:0] mult_array_in0_3,
    input [WL-1:0] mult_array_in0_4,
    input [WL-1:0] mult_array_in0_5,
    input [WL-1:0] mult_array_in0_6,
    input [WL-1:0] mult_array_in0_7,
    input [WL-1:0] mult_array_in0_8,
    input [WL-1:0] mult_array_in0_9,
    input [WL-1:0] mult_array_in0_10,
    input [WL-1:0] mult_array_in0_11,
    input [WL-1:0] mult_array_in0_12,
    input [WL-1:0] mult_array_in0_13,
    input [WL-1:0] mult_array_in0_14,
    input [WL-1:0] mult_array_in0_15,
    input [WL-1:0] mult_array_in1_0,
    input [WL-1:0] mult_array_in1_1,
    input [WL-1:0] mult_array_in1_2,
    input [WL-1:0] mult_array_in1_3,
    input [WL-1:0] mult_array_in1_4,
    input [WL-1:0] mult_array_in1_5,
    input [WL-1:0] mult_array_in1_6,
    input [WL-1:0] mult_array_in1_7,
    input [WL-1:0] mult_array_in1_8,
    input [WL-1:0] mult_array_in1_9,
    input [WL-1:0] mult_array_in1_10,
    input [WL-1:0] mult_array_in1_11,
    input [WL-1:0] mult_array_in1_12,
    input [WL-1:0] mult_array_in1_13,
    input [WL-1:0] mult_array_in1_14,
    input [WL-1:0] mult_array_in1_15,
    output [WL-1:0] mult_array_out0,
    output [WL-1:0] mult_array_out1,
    output [WL-1:0] mult_array_out2,
    output [WL-1:0] mult_array_out3,
    output [WL-1:0] mult_array_out4,
    output [WL-1:0] mult_array_out5,
    output [WL-1:0] mult_array_out6,
    output [WL-1:0] mult_array_out7,
    output [WL-1:0] mult_array_out8,
    output [WL-1:0] mult_array_out9,
    output [WL-1:0] mult_array_out10,
    output [WL-1:0] mult_array_out11,
    output [WL-1:0] mult_array_out12,
    output [WL-1:0] mult_array_out13,
    output [WL-1:0] mult_array_out14,
    output [WL-1:0] mult_array_out15
    );
    
    
    mult mult0(
        .A(mult_array_in0_0),
        .B(mult_array_in1_0),
        .P(mult_array_out0),
        .CLK(clk)
        );
    mult mult1(
        .A(mult_array_in0_1),
        .B(mult_array_in1_1),
        .P(mult_array_out1),
        .CLK(clk)
        );
    mult mult2(
        .A(mult_array_in0_2),
        .B(mult_array_in1_2),
        .P(mult_array_out2),
        .CLK(clk)
        );
    mult mult3(
        .A(mult_array_in0_3),
        .B(mult_array_in1_3),
        .P(mult_array_out3),
        .CLK(clk)
        );
    mult mult4(
        .A(mult_array_in0_4),
        .B(mult_array_in1_4),
        .P(mult_array_out4),
        .CLK(clk)
        );
    mult mult5(
        .A(mult_array_in0_5),
        .B(mult_array_in1_5),
        .P(mult_array_out5),
        .CLK(clk)
        );
    mult mult6(
        .A(mult_array_in0_6),
        .B(mult_array_in1_6),
        .P(mult_array_out6),
        .CLK(clk)
        );
    mult mult7(
        .A(mult_array_in0_7),
        .B(mult_array_in1_7),
        .P(mult_array_out7),
        .CLK(clk)
        );
    mult mult8(
        .A(mult_array_in0_8),
        .B(mult_array_in1_8),
        .P(mult_array_out8),
        .CLK(clk)
        );
    mult mult9(
        .A(mult_array_in0_9),
        .B(mult_array_in1_9),
        .P(mult_array_out9),
        .CLK(clk)
        );
    mult mult10(
        .A(mult_array_in0_10),
        .B(mult_array_in1_10),
        .P(mult_array_out10),
        .CLK(clk)
        );
    mult mult11(
        .A(mult_array_in0_11),
        .B(mult_array_in1_11),
        .P(mult_array_out11),
        .CLK(clk)
        );
    mult mult12(
        .A(mult_array_in0_12),
        .B(mult_array_in1_12),
        .P(mult_array_out12),
        .CLK(clk)
        );
    mult mult13(
        .A(mult_array_in0_13),
        .B(mult_array_in1_13),
        .P(mult_array_out13),
        .CLK(clk)
        );
    mult mult14(
        .A(mult_array_in0_14),
        .B(mult_array_in1_14),
        .P(mult_array_out14),
        .CLK(clk)
        );
    mult mult15(
        .A(mult_array_in0_15),
        .B(mult_array_in1_15),
        .P(mult_array_out15),
        .CLK(clk)
        );

endmodule
