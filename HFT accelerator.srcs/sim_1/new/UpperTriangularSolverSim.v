`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2024 01:46:21 AM
// Design Name: 
// Module Name: UpperTriangularSolverSim
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



module UpperTriangularSolverSim();
    
    reg [127:0] R;
    reg [127:0] Q; 
    wire [127:0] KInverse; 
    
    UpperTriangularSolver dut(R, Q, KInverse); 
    
    initial begin 
    R = {8'd1, 8'd0, 8'd0, 8'd0, 
         8'd1, 8'd1, 8'd0, 8'd0,
         8'd1, 8'd1, 8'd1, 8'd0, 
         8'd1, 8'd1, 8'd1, 8'd1}; 
    
    Q[127:96] = {8'd1, 8'd2, 8'd3, 8'd4};  
    Q[96:64] =  {8'd0, 8'd0, 8'd0, 8'd0}; 
    Q[63:32] =  {8'd0, 8'd0, 8'd0, 8'd0};  
    Q[31:0] =  {8'd0, 8'd0, 8'd0, 8'd0};   

    
    #100; 
    
    $display ("Solution"); 
    $display ("%d, %d, %d, %d", KInverse[7:0], KInverse[15:8], KInverse[23:16], KInverse[31:24]); 
    $display ("%d, %d, %d, %d", KInverse[39:32], KInverse[47:40], KInverse[55:48], KInverse[63:56]); 
    $display ("%d, %d, %d, %d", KInverse[71:64], KInverse[79:72], KInverse[87:80], KInverse[95:88]); 
    $display ("%d, %d, %d, %d", KInverse[103:96], KInverse[111:104], KInverse[119:112], KInverse[127:120]); 
    end 
endmodule
