`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 01:43:18 PM
// Design Name: 
// Module Name: add_array
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


module add_array #(parameter WL=16)(
    input clk,
    input [WL-1:0] add_array_in0,
    input [WL-1:0] add_array_in1,
    input [WL-1:0] add_array_in2,
    input [WL-1:0] add_array_in3,
    input [WL-1:0] add_array_in4,
    input [WL-1:0] add_array_in5,
    input [WL-1:0] add_array_in6,
    input [WL-1:0] add_array_in7,
    input [WL-1:0] add_array_in8,
    input [WL-1:0] add_array_in9,
    input [WL-1:0] add_array_in10,
    input [WL-1:0] add_array_in11,
    input [WL-1:0] add_array_in12,
    input [WL-1:0] add_array_in13,
    input [WL-1:0] add_array_in14,
    input [WL-1:0] add_array_in15,
    output [WL-1:0] add_array_out
    );
    
    
    
    wire [WL-1:0] s0_out0;
    wire [WL-1:0] s0_out1;
    wire [WL-1:0] s0_out2;
    wire [WL-1:0] s0_out3;
    wire [WL-1:0] s0_out4;
    wire [WL-1:0] s0_out5;
    wire [WL-1:0] s0_out6;
    wire [WL-1:0] s0_out7;
    wire [WL-1:0] s1_out0;                                
    wire [WL-1:0] s1_out1;
    wire [WL-1:0] s1_out2;
    wire [WL-1:0] s1_out3;
    wire [WL-1:0] s2_out0;
    wire [WL-1:0] s2_out1;
    
    add add1(
        .A(add_array_in0),
        .B(add_array_in1),
        .S(s0_out0),
        .CLK(clk)
        );
    add add2(
        .A(add_array_in2),
        .B(add_array_in3),
        .S(s0_out1),
        .CLK(clk)
        );
    add add3(
        .A(add_array_in4),
        .B(add_array_in5),
        .S(s0_out2),
        .CLK(clk)
        );
    add add4(
        .A(add_array_in6),
        .B(add_array_in7),
        .S(s0_out3),
        .CLK(clk)
        );
    add add5(
        .A(add_array_in8),
        .B(add_array_in9),
        .S(s0_out4),
        .CLK(clk)
        );
    add add6(
        .A(add_array_in10),
        .B(add_array_in11),
        .S(s0_out5),
        .CLK(clk)
        );
    add add7(
        .A(add_array_in12),
        .B(add_array_in13),
        .S(s0_out6),
        .CLK(clk)
        );
    add add8(
        .A(add_array_in14),
        .B(add_array_in15),
        .S(s0_out7),
        .CLK(clk)
        );
    add add9(
        .A(s0_out0),
        .B(s0_out1),
        .S(s1_out0),
        .CLK(clk)
        );
    add add10(
        .A(s0_out2),
        .B(s0_out3),
        .S(s1_out1),
        .CLK(clk)
        );
    add add11(
        .A(s0_out4),
        .B(s0_out5),
        .S(s1_out2),
        .CLK(clk)
        );
    add add12(
        .A(s0_out6),
        .B(s0_out7),
        .S(s1_out3),
        .CLK(clk)
        );
    add add13(
        .A(s1_out0),
        .B(s1_out1),
        .S(s2_out0),
        .CLK(clk)
        );
    add add14(
        .A(s1_out2),
        .B(s1_out3),
        .S(s2_out1),
        .CLK(clk)
        );    
    add add15(
        .A(s2_out0),
        .B(s2_out1),
        .S(add_array_out),
        .CLK(clk)
        );             
        
endmodule
