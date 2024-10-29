`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 08:54:04 AM
// Design Name: 
// Module Name: Cordic1
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


module Cordic1(
    input clk, 
    input Load, 
    input signed [15:0] Xin, 
    input signed [15:0] Yin, 
    input [7:0] IterationNumber, 
    input Direction, 
    
    output reg signed [15:0] Xout, 
    output reg signed [15:0] Yout, 
    output reg UnLoad = 1'b0
    );
    
    reg signed [15:0] X1; 
    reg signed [15:0] Y1; 
    reg signed [15:0] X2; 
    reg signed [15:0] Y2; 
    
    
    always @(posedge clk) begin 
    if (Load) begin 
        X1 = Xin; 
        Y1 = Yin; 
        
        X2 = (X1>>> IterationNumber); 
        Y2 = (Y1>>> IterationNumber); 
        
        UnLoad = 1'b0; 
    end     
    else begin 
        if (Direction) begin 
            Xout = X1 - Y2; 
            Yout = Y1 + X2; 
        end 
        else begin 
            Xout = X1 + Y2; 
            Yout = Y1 - X2; 
        end 
        UnLoad = 1'b1; 
    end 
    end 
    
endmodule
