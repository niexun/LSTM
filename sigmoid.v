`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2018 09:57:08 AM
// Design Name: 
// Module Name: sigmoid
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


module sigmoid #(parameter WL=16)(
    input clk,
    input [WL-1:0] sig_in,
    output [WL-1:0] sig_out
    );
    
    
    reg [WL-1:0] add_in_reg = 0;
    reg [WL-1:0] mult_out_reg = 0;
    reg [WL-1:0] add_in = 0;
    reg [WL-1:0] mult_in = 0;
    wire [WL-1:0] mult_out;
    reg [WL-1:0] a0=1, a1=100, a2=551, a3=1, a4=1, a5=1, a6=5541, a7=1, a8=5201, a9=1111;
    reg [WL-1:0] b0=1, b1=1, b2=100, b3=1, b4=1, b5=1111, b6=1, b7=1111, b8=1, b9=1001;
    
    always @(*) begin
        if(sig_in < -8) begin
            mult_in <= a0;
            add_in <= b0;
        end
        else if(sig_in >= -8 && sig_in <-6) begin
            mult_in <= a1; 
            add_in <= b1;
        end
        else if(sig_in >= -6 && sig_in <-4) begin
            mult_in <= a2;
            add_in <= b2;
        end
        else if(sig_in >= -4 && sig_in <-2) begin
            mult_in <= a3;
            add_in <= b3;
        end
        else if(sig_in >= -2 && sig_in <0) begin
            mult_in <= a4;
            add_in <= b4;
        end
        else if(sig_in >= 0 && sig_in <2) begin
            mult_in <= a5;
            add_in <= b5;
        end
        else if(sig_in >= 2 && sig_in <4) begin
            mult_in <= a6;
            add_in <= b6;
        end
        else if(sig_in >= 4 && sig_in <6) begin
            mult_in <= a7;
            add_in <= b7;
        end
        else if(sig_in >= 6 && sig_in <8) begin
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
    
    mult mult_sig(
        .A(mult_in),
        .B(sig_in),
        .P(mult_out),
        .CLK(clk)
        );
        
        
    add add_sig(
        .A(add_in_reg),
        .B(mult_out_reg),
        .S(sig_out),
        .CLK(clk)
        );
        
endmodule
