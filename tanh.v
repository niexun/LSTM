`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2018 09:45:20 AM
// Design Name: 
// Module Name: tanh
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


module tanh #(parameter WL=16)(
    input clk,
    input [WL-1:0] tanh_in,
    output [WL-1:0] tanh_out
    );
    
    
    reg [WL-1:0] add_in_reg = 0;
    reg [WL-1:0] mult_out_reg = 0;
    reg [WL-1:0] add_in = 0;
    reg [WL-1:0] mult_in = 0;
    wire [WL-1:0] mult_out;
    reg [WL-1:0] a0=1, a1=2, a2=3, a3=4, a4=5, a5=6, a6=7, a7=8, a8=9, a9=1011;
    reg [WL-1:0] b0=1, b1=2, b2=3, b3=1114, b4=5, b5=6, b6=7, b7=8, b8=9222, b9=1000;
    
    always @(*) begin
        if(tanh_in < 2) begin
            mult_in <= a0;
            add_in <= b0;
        end
        else if(tanh_in >= 4 && tanh_in <6) begin
            mult_in <= a1; 
            add_in <= b1;
        end
        else if(tanh_in >= 6 && tanh_in <8) begin
            mult_in <= a2;
            add_in <= b2;
        end
        else if(tanh_in >= 8 && tanh_in <10) begin
            mult_in <= a3;
            add_in <= b3;
        end
        else if(tanh_in >= 10 && tanh_in <12) begin
            mult_in <= a4;
            add_in <= b4;
        end
        else if(tanh_in >= 12 && tanh_in <14) begin
            mult_in <= a5;
            add_in <= b5;
        end
        else if(tanh_in >= 14 && tanh_in <16) begin
            mult_in <= a6;
            add_in <= b6;
        end
        else if(tanh_in >= 16 && tanh_in <18) begin
            mult_in <= a7;
            add_in <= b7;
        end
        else if(tanh_in >= 18 && tanh_in <20) begin
            mult_in <= a8;
            add_in <= b8;
        end       
        else begin
            mult_in <= a9;
            add_in <= b9;
        end                         
    end
    
    always @(posedge clk) begin
        add_in_reg <= add_in;
        mult_out_reg <= mult_out;
    end
    
    mult mult_tanh(
        .A(mult_in),
        .B(tanh_in),
        .P(mult_out),
        .CLK(clk)
        );
        
        
    add add_tanh(
        .A(add_in_reg),
        .B(mult_out_reg),
        .S(tanh_out),
        .CLK(clk)
        );
        
endmodule
