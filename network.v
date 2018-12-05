`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2018 09:59:00 AM
// Design Name: 
// Module Name: network
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


module network #(parameter WL=16)(
    input clk,
    input [WL-1:0] mem_net1,
    input [WL-1:0] mem_net2,
    input [WL-1:0] c_pre,
    input mux_c_gate_sel,
    input mux_c_tanh_sel,
    input accum_rst,
    output [WL-1:0] h_new,
    output [WL-1:0] c_new
    );
    
    
    
    reg [WL-1:0] tanh_in = 0;
    wire [WL-1:0] tanh_out;
    wire [WL-1:0] sig_out;
    reg [WL-1:0] mult_in = 0;
    reg [WL-1:0] c_reg [1:0];
    reg [1:0] mux_c_tanh_sel_reg = 0;
        
    sigmoid #(.WL(WL)) sigmoid_inst(
        clk,
        mem_net1,
        sig_out
        );          
    tanh #(.WL(WL)) tanh_inst(
        clk,
        tanh_in,
        tanh_out
        );
    accum accum_inst(
        .B(h_new),
        .CLK(clk),
        .SCLR(accum_rst),
        .Q(c_new)
        );
    mult mult_inst(
        .A(sig_out),
        .B(mult_in),
        .P(h_new),
        .CLK(clk)
        );
        
    always @(*) begin
        if(mux_c_gate_sel)
            tanh_in <= c_new;
        else
            tanh_in <= mem_net2;
            
        if(mux_c_tanh_sel_reg[0])
            mult_in <= c_reg[0];
        else
            mult_in <= tanh_out;
    end
    
    always @(posedge clk) begin
        c_reg[1] <= c_pre;
        c_reg[0] <= c_reg[1];
        
        mux_c_tanh_sel_reg[1] <= mux_c_tanh_sel; 
        mux_c_tanh_sel_reg[0] <= mux_c_tanh_sel_reg[1];
    end
        
endmodule
