`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2018 12:59:46 PM
// Design Name: 
// Module Name: memory
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


module memory #(parameter WL=16)(
    input clk,
    input start_gate,
    input start_net,
    input [WL-1:0] mem_gate_in,
    input [WL-1:0] h_new,
    input [WL-1:0] c_new,
    output [16*WL-1:0] x,
    output [16*WL-1:0] h,
    output [16*WL-1:0] wx,
    output [16*WL-1:0] wh,
    output [WL-1:0] b,
    output [WL-1:0] c_pre,
    output [WL-1:0] mem_net1,
    output [WL-1:0] mem_net2,
    output reg x_done = 0,
    output reg h_gate_done = 0,
    output reg b_done = 0,
    output reg f_done = 0,
    output reg i_done = 0,
    output reg c_done = 0,
    output reg memory_gate_done = 0,
    output reg memory_net_done = 0,
    output accum_rst_gate,
    output reg accum_rst_net = 0         
    );
    
    
    
    reg [2:0] counter_gate = 0;
    reg [7:0] counter_gate_outer = 0;
    reg counter_gate_enable = 0;
    reg [8:0] address_wx = 0;
    reg [9:0] address_wh = 0;
    reg address_x = 0;
    reg [1:0] address_h_gate = 0;
    reg [1:0] address_h_net = 0;
    reg [1:0] address_h;
    reg [7:0] address_b = 0;
    reg [5:0] address_c = 0;
    reg [3:0] shift_gate_we = 0;
    reg [7:0] shift_address_gate [0:4];
    reg [2:0] counter_net = 0;
    reg [7:0] counter_net_outer = 0;
    reg [3:0] counter_net_h_temp = 0;
    reg counter_net_enable = 0;
   // wire [7:0] address_gate;
    reg [7:0] address_gate_network = 0;
    reg [7:0] address_gate_network_dual = 0;
    reg [7:0] address_i = 0;
    reg [7:0] address_f = 64;
    reg [7:0] address_g = 128;
    reg [7:0] address_o = 192;
    reg [16*WL-1:0] h_temp = 0;
    reg [2:0] shift_h_we = 0;
    reg h_net_temp_done = 0;
    reg [7:0] address_gate_mem = 0;
    mem_wh wh_inst(
        .a(address_wh),
        .spo(wh)
        );
        
    mem_wx wx_inst(
        .a(address_wx),
        .spo(wx)
        );        
    
    mem_h h_inst(
        .a({2'b00,address_h}),
        .d(h_temp),
        .clk(clk),
        .we(shift_h_we [0]),
        .spo(h)
        );
        
    mem_x x_inst(
        .a({3'b000,address_x}),
        .spo(x)
        );
        
    mem_b b_inst(
        .a(address_b),
        .spo(b)
        );
        
    mem_gate gate_inst(
        .a(address_gate_mem),
        .d(mem_gate_in),
        .clk(clk),
        .we(shift_gate_we[0]),
        .spo(mem_net1),
        .dpra(address_gate_network_dual),
        .dpo(mem_net2)
        );
    
    mem_c c_inst(
        .a(address_c),
        .d(c_new),
        .clk(clk),
        .we(c_done),
        .spo(c_pre)
        );
        
    always @(posedge clk) begin : gate
        if(start_gate) begin
            counter_gate_enable <= 1;
            counter_gate <= 0;
            counter_gate_outer <= 0;
        end
        else begin
            counter_gate_enable <= counter_gate_enable;
            counter_gate <= counter_gate;
            counter_gate_outer <= counter_gate_outer;
        end
        
        if(counter_gate_enable == 1) begin
            counter_gate <= counter_gate + 1;
            b_done <= 0;
            x_done <= 0;
            h_gate_done <= 0;
            memory_gate_done <= 0;
            counter_gate_outer <= counter_gate_outer;
            address_b <= address_b;
            address_x <= address_x;
            address_h_gate <= address_h_gate;
            if (counter_gate == 0) begin
                address_b <= address_b + 1;
                address_x <= address_x + 1;
                address_wx <= address_wx + 1;
                b_done <= 1;
            end
            else if (counter_gate == 1) begin
                address_x <= address_x + 1;
                address_wx <= address_wx + 1;
                x_done <= 1;
            end
            else if (counter_gate == 5) begin
                address_h_gate <= address_h_gate + 1;
                address_wh <= address_wh + 1;
                h_gate_done <= 1;
                counter_gate_outer <= counter_gate_outer + 1; 
                counter_gate <= 0;
                if(counter_gate_outer == 255) begin
                    memory_gate_done <= 1;
                    counter_gate_enable <= 0;
                end
                else begin
                    memory_gate_done <= 0;
                    counter_gate_enable <= 1;
                end
            end
            else begin
                address_h_gate <= address_h_gate + 1;
                address_wh <= address_wh + 1;
            end
        end
        else begin
            counter_gate <= 0;
            b_done <= 0;
            x_done <= 0;
            h_gate_done <= 0;
            memory_gate_done <= 0;
            counter_gate_outer <= 0;
            address_b <= 0;
            address_x <= 0;
            address_h_gate <= 0;
            address_wx <= 0;
            address_wh <= 0;
        end
        
    end
    
    always @(posedge clk) begin
        shift_gate_we[0] <= shift_gate_we[1];
        shift_gate_we[1] <= shift_gate_we[2];
        shift_gate_we[2] <= shift_gate_we[3];
        shift_gate_we[3] <= h_gate_done;
        
        shift_address_gate[0] <= shift_address_gate[1];
        shift_address_gate[1] <= shift_address_gate[2];
        shift_address_gate[2] <= shift_address_gate[3];
        shift_address_gate[3] <= shift_address_gate[4];
        shift_address_gate[4] <= counter_gate_outer;
        
        shift_h_we [0] <= shift_h_we [1];
        shift_h_we [1] <= shift_h_we [2];
        shift_h_we [2] <= h_net_temp_done;
    end
    
    always @(posedge clk) begin : network
        if(start_net) begin
            counter_net_enable <= 1;
            counter_net <= 0;
            counter_net_outer <= 0;
        end
        else begin
            counter_net_enable <= counter_net_enable;
            counter_net <= counter_net;
            counter_net_outer <= counter_net_outer;
        end
        
        if(counter_net_enable == 1) begin
            counter_net <= counter_net + 1;
            f_done <= 0;
            i_done <= 0;
            c_done <= 0;
            accum_rst_net <= 0;
            h_net_temp_done <= 0;
            if(counter_net == 0) begin
                address_gate_network <= address_f;
                address_f <= address_f + 1;
//                address_c <= address_c + 1;
                f_done <= 1;
            end
            else if(counter_net == 1) begin
                address_gate_network <= address_i;
                address_gate_network_dual <= address_g;
                address_i <= address_i + 1;
                address_g <= address_g + 1;
                i_done <= 1;
            end
            else if(counter_net == 3) begin
                accum_rst_net <= 1;
            end
            else if(counter_net == 5) begin
                address_gate_network <= address_o;
                address_o <= address_o + 1;
                counter_net <= 0;
                counter_net_outer <= counter_net_outer + 1;
                counter_net_h_temp <= counter_net_h_temp + 1;
                c_done <= 1;
                address_c <= address_c + 1;
                case (counter_net_h_temp)
                    0 : h_temp[WL-1:0] = h_new;
                    1 : h_temp[2*WL-1:WL] = h_new;
                    2 : h_temp[3*WL-1:2*WL] = h_new;
                    3 : h_temp[4*WL-1:3*WL] = h_new;
                    4 : h_temp[5*WL-1:4*WL] = h_new;
                    5 : h_temp[6*WL-1:5*WL] = h_new;
                    6 : h_temp[7*WL-1:6*WL] = h_new;
                    7 : h_temp[8*WL-1:7*WL] = h_new;
                    8 : h_temp[9*WL-1:8*WL] = h_new;
                    9 : h_temp[10*WL-1:9*WL] = h_new;
                    10 : h_temp[11*WL-1:10*WL] = h_new;
                    11 : h_temp[12*WL-1:11*WL] = h_new;
                    12 : h_temp[13*WL-1:12*WL] = h_new;
                    13 : h_temp[14*WL-1:13*WL] = h_new;
                    14 : h_temp[15*WL-1:14*WL] = h_new;
                    15 : h_temp[16*WL-1:15*WL] = h_new;
                endcase
                if (counter_net_h_temp == 15) begin
                    address_h_net <= address_h_net + 1;
                    counter_net_h_temp <= 0;    
                    h_net_temp_done <= 1;
                end
                else begin
                    address_h_net <= address_h_net;
                    h_net_temp_done <= 0;
                 end
                if (counter_net_outer == 64)
                begin
                    counter_net_enable <= 0;
                    memory_net_done <= 1;
                end
                else begin
                    counter_net_enable <= 1;
                    memory_net_done <= 0;
                end
            end
        end
        else begin
            counter_net <= 0;
            counter_net_outer <= 0;
            memory_net_done <= 0;
            address_h_net <= 0;  
            address_gate_network <= 0;
            address_f <= 0;
            address_c <= 0;   
            address_gate_network_dual <= 0;
            address_i <= 0;
            address_g <= 0;
            address_o <= 0;
            f_done <= 0;
            i_done <= 0;
            c_done <= 0;
            accum_rst_net <= 0;
            counter_net_h_temp <= 0;
        end
    end
    
    
    always @(*) begin
        if(counter_gate_enable) begin
            address_h <= address_h_gate;
            address_gate_mem <= shift_address_gate[0];
        end
        else begin
            address_h <= address_h_net;
            address_gate_mem <= address_gate_network;
        end
    end
    
    assign accum_rst_gate = shift_gate_we[0];

endmodule

