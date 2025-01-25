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
    
    output [127:0]XoutScaled, 
    output [127:0]YoutScaled, 
    output reg UnLoad
    );
    
    reg [7:0] Counter = 7'd0; 
    
    reg [127:0] Xout; 
    reg [127:0] Yout; 
    CordicScaling Xout0 (Counter, Xout[15:0], XoutScaled[15:0]); 
    CordicScaling Xout1 (Counter, Xout[31:16], XoutScaled[31:16]); 
    CordicScaling Xout2 (Counter, Xout[47:32], XoutScaled[47:32]); 
    CordicScaling Xout3 (Counter, Xout[63:48], XoutScaled[63:48]); 
    CordicScaling Xout4 (Counter, Xout[79:64], XoutScaled[79:64]); 
    CordicScaling Xout5 (Counter, Xout[95:80], XoutScaled[95:80]); 
    CordicScaling Xout6 (Counter, Xout[111:96], XoutScaled[111:96]); 
    CordicScaling Xout7 (Counter, Xout[127:112], XoutScaled[127:112]); 
    
    CordicScaling Yout0 (Counter, Yout[15:0], YoutScaled[15:0]); 
    CordicScaling Yout1 (Counter, Yout[31:16], YoutScaled[31:16]); 
    CordicScaling Yout2 (Counter, Yout[47:32], YoutScaled[47:32]); 
    CordicScaling Yout3 (Counter, Yout[63:48], YoutScaled[63:48]); 
    CordicScaling Yout4 (Counter, Yout[79:64], YoutScaled[79:64]); 
    CordicScaling Yout5 (Counter, Yout[95:80], YoutScaled[95:80]); 
    CordicScaling Yout6 (Counter, Yout[111:96], YoutScaled[111:96]); 
    CordicScaling Yout7 (Counter, Yout[127:112], YoutScaled[127:112]); 
    
    reg [7:0] Tolerance = 0; 
    
    reg [127:0] XintermediateIn; 
    reg [127:0] YintermediateIn; 
    wire [127:0] XintermediateOut;  
    wire [127:0] YintermediateOut; 
    
    reg LoadInternal = 1'b1; 
    wire UnLoadInternal; 
    
    reg UnLoaded =0; 
    
    Cordic2 C( clk, LoadInternal, XintermediateIn, YintermediateIn, Counter, XintermediateOut, YintermediateOut, UnLoadInternal); 
    
    always @(posedge clk) begin 
        if (Load) begin 
            XintermediateIn = Xin; 
            YintermediateIn = Yin; 
            UnLoad = 1'b0; 
            LoadInternal = 1'b1; 
            Counter = 7'd0;
            Tolerance = 2 ;  
        end 
        
        else if (((YintermediateIn[15:0] <= Tolerance) && UnLoadInternal) | (Counter==15)) begin 
            Xout = XintermediateOut; 
            Yout = YintermediateOut; 
            UnLoad = 1'b1; 
        end 
        
        else if (YintermediateIn[15:0]<= Tolerance) begin 
            Xout = XintermediateIn; 
            Yout = YintermediateIn; 
            UnLoad = 1'b1; 
        end
        
        else if (UnLoadInternal & ~UnLoaded) begin 
            XintermediateIn = XintermediateOut; 
            YintermediateIn = YintermediateOut; 
            
            LoadInternal = 1'b1; 
            Counter = Counter + 8'd1; 
            UnLoaded = 1;  
        end 
        else begin 
            LoadInternal = 1'b0;
            UnLoaded = 0; 
        end    
    end    
        
endmodule
