`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 07:51:09 AM
// Design Name: 
// Module Name: CordicScaling
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


module CordicScaling(
    input [7:0] IterationNumber, 
    input signed [15:0] In, 
    output signed [15:0] Out
    );
    
    wire signed [26:0] Product; 
    reg signed [10:0]ScalingFactor; 
    assign Product = In * ScalingFactor; 
   
    assign Out = Product>>>9 ;  
    
    always @(*) begin 
        case(IterationNumber) 
            8'd0: ScalingFactor = 11'b01000000000; 
            8'd1: ScalingFactor = 11'b00101101010; //.707
            8'd2: ScalingFactor = 11'b00101000100; //.632
            8'd3: ScalingFactor = 11'b00100111010; //
            8'd4: ScalingFactor = 11'b00100111000; 
            default: ScalingFactor = 11'b00100110110; 
        endcase
    end 
endmodule
