`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2024 03:47:52 AM
// Design Name: 
// Module Name: NormalizationSim
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


module NormalizationSim();

   reg [127:0] KInverse; 
   wire [31:0] W; 
   wire [7:0] Sum; 
    
   Normalization dut(KInverse, W, Sum); 
    
   initial begin 
   KInverse = {8'd2, 8'd0, 8'd0, 8'd0, 
               8'd0, 8'd3, 8'd0, 8'd0,
               8'd0, 8'd0, 8'd1, 8'd0, 
               8'd0, 8'd0, 8'd0, 8'd5};       
   #100; 
    
   $display ("Solution"); 
   $display ("%d, %d, %d, %d", W[7:0], W[15:8], W[23:16], W[31:24]); 
   
   end
    
endmodule
