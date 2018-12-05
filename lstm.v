`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2018 03:52:03 PM
// Design Name: 
// Module Name: lstm
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


module lstm #(parameter WL=12)(
    input clk,
    input chip_en,
    input rst,
    output memory_net_done
    );

    
    wire start_gate;
    wire start_net;
    wire [WL-1:0] mem_gate_in;
    wire [WL-1:0] h_new;
    wire [WL-1:0] c_new;
    wire [16*WL-1:0]  x;
    wire [16*WL-1:0] h;
    wire [16*WL-1:0]  wx;
    wire [16*WL-1:0]  wh;
    wire [WL-1:0]  b;
    wire [WL-1:0]  c_pre;
    wire [WL-1:0] mem_net1;
    wire [WL-1:0] mem_net2;
    wire  x_done;
    wire  h_gate_done;
    wire  b_done;
    wire  f_done;
    wire  i_done;
    wire  c_done;
    wire  memory_gate_done;
//    wire  memory_net_done;
    wire accum_rst_gate;
    wire accum_rst_net; 
    wire mux_mult_sel;
    wire mux_acc_sel;
    wire mux_c_gate_sel;
    wire mux_c_tanh_sel;
//    wire [WL-1:0] gate_out;
    
    gate #(.WL(WL)) gate_inst(
         clk,
          x,
          h,
          wx,
          wh,
          b,
         mux_mult_sel,
         mux_acc_sel,
         accum_rst_gate,
          mem_gate_in
        );
        
    network #(.WL(WL)) network_inst (
         clk,
          mem_net1,
          mem_net2,
          c_pre,
         mux_c_gate_sel,
         mux_c_tanh_sel,
         accum_rst_net,
          h_new,
          c_new
        );
        
    controller controller_inst(
         clk,
         chip_en,
         rst,
         x_done,
         h_gate_done,
         b_done,
         i_done,
         f_done,
         c_done,
         memory_gate_done,
         memory_net_done,
          mux_mult_sel,
          mux_acc_sel,
          mux_c_gate_sel,
          mux_c_tanh_sel,
          start_gate,
          start_net
        );
        
    memory #(.WL(WL)) memory_inst(
         clk,
         start_gate,
         start_net,
          mem_gate_in,
          h_new,
          c_new,
          x,
          h,
          wx,
          wh,
          b,
          c_pre,
          mem_net1,
          mem_net2,
          x_done,
          h_gate_done,
          b_done,
          f_done,
          i_done,
          c_done,
          memory_gate_done,
          memory_net_done,
         accum_rst_gate,
          accum_rst_net         
        );
    
endmodule

  