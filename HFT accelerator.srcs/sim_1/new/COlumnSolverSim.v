`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 08:25:54 AM
// Design Name: 
// Module Name: COlumnSolverSim
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


module COlumnSolverSim();
    
    reg [127:0] R;
    reg [31:0] B; 
    wire[31:0] X; 
    
    ColumnSolver dut(R, B, X); 
    
    initial begin 
    R = {8'd1, 8'd0, 8'd0, 8'd0, 
         8'd1, 8'd1, 8'd0, 8'd0,
         8'd1, 8'd1, 8'd1, 8'd0, 
         8'd1, 8'd1, 8'd1, 8'd1}; 
    
    B = {8'd1, 8'd2, 8'd3, 8'd4}; 
    
    #100; 
    
    $display ("Solution"); 
    $display ("%d, %d, %d, %d", X[7:0], X[15:8], X[23:16], X[31:24]); 
    end 
endmodule
