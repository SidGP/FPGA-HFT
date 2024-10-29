`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 07:54:41 AM
// Design Name: 
// Module Name: CordicScalingSim
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


module CordicScalingSim();

    reg [15:0] In; 
    wire [15:0] Out; 
    
    CordicScaling dut(In, Out);
    
    initial begin 
        In = 16'd1000; 
    end 
    
endmodule
