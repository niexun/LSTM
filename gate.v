`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 12:48:13 PM
// Design Name: 
// Module Name: gate
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


module gate #(parameter WL=16) (
    input clk,
    input [16*WL-1:0] x,
    input [16*WL-1:0] h,
    input [16*WL-1:0] wx,
    input [16*WL-1:0] wh,
    input [WL-1:0] b,
    input mux_mult_sel,
    input mux_acc_sel,
    input accum_rst,
    output [WL-1:0] gate_out
    );
    
    reg [4:0]counter = 0;
    wire [16*WL-1:0] mult_array_in0;
    wire [16*WL-1:0] mult_array_in1;
    wire [WL-1:0] add_array_out;
    wire [WL-1:0] accum_in;
    wire [WL-1:0] mult_array_in0_0;
    wire [WL-1:0] mult_array_in0_1;
    wire [WL-1:0] mult_array_in0_2;
    wire [WL-1:0] mult_array_in0_3;
    wire [WL-1:0] mult_array_in0_4;
    wire [WL-1:0] mult_array_in0_5;
    wire [WL-1:0] mult_array_in0_6;
    wire [WL-1:0] mult_array_in0_7;
    wire [WL-1:0] mult_array_in0_8;
    wire [WL-1:0] mult_array_in0_9;
    wire [WL-1:0] mult_array_in0_10;
    wire [WL-1:0] mult_array_in0_11;
    wire [WL-1:0] mult_array_in0_12;
    wire [WL-1:0] mult_array_in0_13;
    wire [WL-1:0] mult_array_in0_14;
    wire [WL-1:0] mult_array_in0_15;
    wire [WL-1:0] mult_array_in1_0;
    wire [WL-1:0] mult_array_in1_1;
    wire [WL-1:0] mult_array_in1_2;
    wire [WL-1:0] mult_array_in1_3;
    wire [WL-1:0] mult_array_in1_4;
    wire [WL-1:0] mult_array_in1_5;
    wire [WL-1:0] mult_array_in1_6;
    wire [WL-1:0] mult_array_in1_7;
    wire [WL-1:0] mult_array_in1_8;
    wire [WL-1:0] mult_array_in1_9;
    wire [WL-1:0] mult_array_in1_10;
    wire [WL-1:0] mult_array_in1_11;
    wire [WL-1:0] mult_array_in1_12;
    wire [WL-1:0] mult_array_in1_13;
    wire [WL-1:0] mult_array_in1_14;
    wire [WL-1:0] mult_array_in1_15;
    wire [WL-1:0] mult_array_out0;
    wire [WL-1:0] mult_array_out1;
    wire [WL-1:0] mult_array_out2;
    wire [WL-1:0] mult_array_out3;
    wire [WL-1:0] mult_array_out4;
    wire [WL-1:0] mult_array_out5;
    wire [WL-1:0] mult_array_out6;
    wire [WL-1:0] mult_array_out7;
    wire [WL-1:0] mult_array_out8;
    wire [WL-1:0] mult_array_out9;
    wire [WL-1:0] mult_array_out10;
    wire [WL-1:0] mult_array_out11;
    wire [WL-1:0] mult_array_out12;
    wire [WL-1:0] mult_array_out13;
    wire [WL-1:0] mult_array_out14;
    wire [WL-1:0] mult_array_out15;
  
    mult_array #(.WL(WL)) mult_array_inst (
        clk,
        mult_array_in0_0,
        mult_array_in0_1,
        mult_array_in0_2,
        mult_array_in0_3,
        mult_array_in0_4,
        mult_array_in0_5,
        mult_array_in0_6,
        mult_array_in0_7,
        mult_array_in0_8,
        mult_array_in0_9,
        mult_array_in0_10,
        mult_array_in0_11,
        mult_array_in0_12,
        mult_array_in0_13,
        mult_array_in0_14,
        mult_array_in0_15,
        mult_array_in1_0,
        mult_array_in1_1,
        mult_array_in1_2,
        mult_array_in1_3,
        mult_array_in1_4,
        mult_array_in1_5,
        mult_array_in1_6,
        mult_array_in1_7,
        mult_array_in1_8,
        mult_array_in1_9,
        mult_array_in1_10,
        mult_array_in1_11,
        mult_array_in1_12,
        mult_array_in1_13,
        mult_array_in1_14,
        mult_array_in1_15,
        mult_array_out0,
        mult_array_out1,
        mult_array_out2,
        mult_array_out3,
        mult_array_out4,
        mult_array_out5,
        mult_array_out6,
        mult_array_out7,
        mult_array_out8,
        mult_array_out9,
        mult_array_out10,
        mult_array_out11,
        mult_array_out12,
        mult_array_out13,
        mult_array_out14,
        mult_array_out15
        );
    add_array #(.WL(WL)) add_array_inst(
        clk,
        mult_array_out0,
        mult_array_out1,
        mult_array_out2,
        mult_array_out3,
        mult_array_out4,
        mult_array_out5,
        mult_array_out6,
        mult_array_out7,
        mult_array_out8,
        mult_array_out9,
        mult_array_out10,
        mult_array_out11,
        mult_array_out12,
        mult_array_out13,
        mult_array_out14,
        mult_array_out15,
        add_array_out
        );
    accum accum_inst(
        .B(accum_in),
        .CLK(clk),
        .SCLR(accum_rst),
        .Q(gate_out)
        );
    
    assign mult_array_in0 = mux_mult_sel ? wh : wx;
    assign mult_array_in1 = mux_mult_sel ? h : x;
    assign accum_in = mux_acc_sel ? b : add_array_out;
    assign mult_array_in0_0 = mult_array_in0[WL-1:0];
    assign mult_array_in0_1 = mult_array_in0[2*WL-1:WL];
    assign mult_array_in0_2 = mult_array_in0[3*WL-1:2*WL];
    assign mult_array_in0_3 = mult_array_in0[4*WL-1:3*WL];
    assign mult_array_in0_4 = mult_array_in0[5*WL-1:4*WL];
    assign mult_array_in0_5 = mult_array_in0[6*WL-1:5*WL];
    assign mult_array_in0_6 = mult_array_in0[7*WL-1:6*WL];
    assign mult_array_in0_7 = mult_array_in0[8*WL-1:7*WL];
    assign mult_array_in0_8 = mult_array_in0[9*WL-1:8*WL];
    assign mult_array_in0_9 = mult_array_in0[10*WL-1:9*WL];
    assign mult_array_in0_10 = mult_array_in0[11*WL-1:10*WL];
    assign mult_array_in0_11 = mult_array_in0[12*WL-1:11*WL];
    assign mult_array_in0_12 = mult_array_in0[13*WL-1:12*WL];
    assign mult_array_in0_13 = mult_array_in0[14*WL-1:13*WL];
    assign mult_array_in0_14 = mult_array_in0[15*WL-1:14*WL];
    assign mult_array_in0_15 = mult_array_in0[16*WL-1:15*WL];
    assign mult_array_in1_0 = mult_array_in1[WL-1:0];
    assign mult_array_in1_1 = mult_array_in1[2*WL-1:WL];
    assign mult_array_in1_2 = mult_array_in1[3*WL-1:2*WL];
    assign mult_array_in1_3 = mult_array_in1[4*WL-1:3*WL];
    assign mult_array_in1_4 = mult_array_in1[5*WL-1:4*WL];
    assign mult_array_in1_5 = mult_array_in1[6*WL-1:5*WL];
    assign mult_array_in1_6 = mult_array_in1[7*WL-1:6*WL];
    assign mult_array_in1_7 = mult_array_in1[8*WL-1:7*WL];
    assign mult_array_in1_8 = mult_array_in1[9*WL-1:8*WL];
    assign mult_array_in1_9 = mult_array_in1[10*WL-1:9*WL];
    assign mult_array_in1_10 = mult_array_in1[11*WL-1:10*WL];
    assign mult_array_in1_11 = mult_array_in1[12*WL-1:11*WL];
    assign mult_array_in1_12 = mult_array_in1[13*WL-1:12*WL];
    assign mult_array_in1_13 = mult_array_in1[14*WL-1:13*WL];
    assign mult_array_in1_14 = mult_array_in1[15*WL-1:14*WL];
    assign mult_array_in1_15 = mult_array_in1[16*WL-1:15*WL];
     
endmodule