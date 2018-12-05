`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2018 03:01:14 PM
// Design Name: 
// Module Name: controller
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


module controller(
    input clk,
    input chip_en,
    input rst,
    input x_done,
    input h_gate_done,
    input b_done,
    input i_done,
    input f_done,
    input c_done,
    input memory_gate_done,
    input memory_net_done,
    output reg mux_mult_sel = 0,
    output reg mux_acc_sel = 0,
    output reg mux_c_gate_sel = 0,
    output reg mux_c_tanh_sel = 0,
    output reg start_gate = 0,
    output reg start_net = 0
    );
    

    
       parameter S0  = 4'b0000;
       parameter S1  = 4'b0001;
       parameter S2  = 4'b0010;
       parameter S3  = 4'b0011;
       parameter S4  = 4'b0100;
       parameter S5  = 4'b0101;
       parameter S6  = 4'b0110;
       parameter S7  = 4'b0111;
       parameter S8  = 4'b1000;
//       parameter <state10> = 4'b1001;
//       parameter <state11> = 4'b1010;
//       parameter <state12> = 4'b1011;
//       parameter <state13> = 4'b1100;
//       parameter <state14> = 4'b1101;
//       parameter <state15> = 4'b1110;
//       parameter <state16> = 4'b1111;
    
       reg [3:0] present_state = S0;
       reg [3:0] next_state = S0;
       
       always @(posedge clk) begin
           if (rst) 
               present_state <= S0;
           else
               present_state <= next_state;
       end
    
       always @(*) begin
             case (present_state)
                S0 : begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 0;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 0;
                     start_gate <= 0;
                     start_net <= 0; 
                     if (chip_en) begin
                         mux_mult_sel <= 0;
                         mux_acc_sel <= 1;
                         mux_c_gate_sel <= 0;
                         mux_c_tanh_sel <= 0;
                         start_gate <= 1;
                         start_net <= 0;      
                         next_state <= S1;
                     end
                     else
                         next_state <= S0;
                end
                S1 : begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 1;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 0;
                     start_gate <= 0;
                     start_net <= 0; 
                   if (b_done) begin
                        mux_mult_sel <= 0;
                        mux_acc_sel <= 0;
                        mux_c_gate_sel <= 0;
                        mux_c_tanh_sel <= 0;
                        start_gate <= 0;
                        start_net <= 0;
                        next_state <= S2;
                   end   
                   else
                      next_state <= S1;
                end
                S2 : begin
                    mux_mult_sel <= 0;
                    mux_acc_sel <= 0;
                    mux_c_gate_sel <= 0;
                    mux_c_tanh_sel <= 0;
                    start_gate <= 0;
                    start_net <= 0;
                   if (x_done) begin
                       mux_mult_sel <= 1;
                       mux_acc_sel <= 0;
                       mux_c_gate_sel <= 0;
                       mux_c_tanh_sel <= 0;
                       start_gate <= 0;
                       start_net <= 0;
                       next_state <= S3;
                   end   
                   else
                      next_state <= S2;
                end
                S3 : begin
                   mux_mult_sel <= 1;
                   mux_acc_sel <= 0;
                   mux_c_gate_sel <= 0;
                   mux_c_tanh_sel <= 0;
                   start_gate <= 0;
                   start_net <= 0;
                   if (h_gate_done) begin
                      mux_mult_sel <= 0;
                      mux_acc_sel <= 1;
                      mux_c_gate_sel <= 0;
                      mux_c_tanh_sel <= 0;
                      start_gate <= 0;
                      start_net <= 0;
                      next_state <= S4;
                  end
                   else if (memory_gate_done) begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 0;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 1;
                     start_gate <= 0;
                     start_net <= 1;
                     next_state <= S5;
                   end
                   else
                      next_state <= S3;
                end
                S4 : begin
                  mux_mult_sel <= 0;
                  mux_acc_sel <= 1;
                  mux_c_gate_sel <= 0;
                  mux_c_tanh_sel <= 0;
                  start_gate <= 0;
                  start_net <= 0;
                   if (b_done) begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 0;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 0;
                     start_gate <= 0;
                     start_net <= 0;
                     next_state <= S2;
                  end
                   else
                      next_state <= S4;
                end
                S5 : begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 0;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 1;
                     start_gate <= 0;
                     start_net <= 0;
                   if (f_done) begin
                       mux_mult_sel <= 0;
                       mux_acc_sel <= 0;
                       mux_c_gate_sel <= 0;
                       mux_c_tanh_sel <= 0;
                       start_gate <= 0;
                       start_net <= 0;
                       next_state <= S6;
                      end
                   else
                      next_state <= S5;
                end
                S6 : begin
                   mux_mult_sel <= 0;
                   mux_acc_sel <= 0;
                   mux_c_gate_sel <= 0;
                   mux_c_tanh_sel <= 0;
                   start_gate <= 0;
                   start_net <= 0;
                   if (i_done) begin
                      mux_mult_sel <= 0;
                      mux_acc_sel <= 0;
                      mux_c_gate_sel <= 0;
                      mux_c_tanh_sel <= 0;
                      start_gate <= 0;
                      start_net <= 0;
                      next_state <= S7;
                  end
                   else
                      next_state <= S6;
                end
                S7 : begin
                  mux_mult_sel <= 0;
                  mux_acc_sel <= 0;
                  mux_c_gate_sel <= 0;
                  mux_c_tanh_sel <= 0;
                  start_gate <= 0;
                  start_net <= 0;
                   if (c_done) begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 0;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 1;
                     start_gate <= 0;
                     start_net <= 0;
                      next_state <= S8;
                  end
                   else if (memory_net_done) begin
                        mux_mult_sel <= 0;
                        mux_acc_sel <= 0;
                        mux_c_gate_sel <= 0;
                        mux_c_tanh_sel <= 0;
                        start_gate <= 0;
                        start_net <= 0;
                        next_state <= S0;
                      end
                   else
                      next_state <= S7;
                end
                S8 : begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 0;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 1;
                     start_gate <= 0;
                     start_net <= 0;
                   if (f_done) begin
                        mux_mult_sel <= 0;
                        mux_acc_sel <= 0;
                        mux_c_gate_sel <= 0;
                        mux_c_tanh_sel <= 0;
                        start_gate <= 0;
                        start_net <= 0;
                        next_state <= S6;
                    end
                   else
                      next_state <= S8;
                end
                default : begin
                     mux_mult_sel <= 0;
                     mux_acc_sel <= 0;
                     mux_c_gate_sel <= 0;
                     mux_c_tanh_sel <= 0;
                     start_gate <= 0;
                     start_net <= 0; 
                     next_state <= S0;
                end
             endcase
        end
    


       // Add other output equations as necessary
                                
                            
endmodule				


