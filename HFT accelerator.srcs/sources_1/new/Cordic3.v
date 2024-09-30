`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 09:45:14 AM
// Design Name: 
// Module Name: Cordic3
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


module Cordic3(
    input clk, 
    input Load, 
    input [127:0] Xin, 
    input [127:0] Yin, 
    
    output reg [127:0]Xout, 
    output reg [127:0]Yout, 
    output reg UnLoad
    );
    
    parameter Tolerance = 16'd2; 
    
    reg [127:0] XintermediateIn; 
    reg [127:0] YintermediateIn; 
    wire [127:0] XintermediateOut;  
    wire [127:0] YintermediateOut; 
    
    reg LoadInternal = 1'b1; 
    wire UnLoadInternal; 
    reg [7:0] Counter = 7'd0; 
    
    Cordic2 C( clk, LoadInternal, XintermediateIn, YintermediateIn, Counter, XintermediateOut, YintermediateOut, UnLoadInternal); 
    
    always @(posedge clk) begin 
        if (Load) begin 
            XintermediateIn = Xin; 
            YintermediateIn = Yin; 
            UnLoad = 1'b0; 
            LoadInternal = 1'b1; 
            Counter = 7'd0; 
        end 
        
        else if ((-Tolerance < YintermediateIn[15:0] < Tolerance) && UnLoadInternal) begin 
            Xout = XintermediateOut; 
            Yout = YintermediateOut; 
            UnLoad = 1'b1; 
        end 
        else if (UnLoadInternal) begin 
            XintermediateIn = XintermediateOut; 
            YintermediateIn = YintermediateOut; 
            
            LoadInternal = 1'b1; 
            Counter = Counter + 8'd1; 
        end 
        else begin 
            LoadInternal = 1'b0; 
        end    
    end    
        
endmodule
