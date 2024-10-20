`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 01:54:26 AM
// Design Name: 
// Module Name: SolveForW
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


module SolveForW(
    input clk, 
    input Load, 
    input [127:0] K, 
    output [31:0] W, 
    output UnLoad
    );
    
    wire [127:0] Q; 
    wire [127:0] R; 
    wire [127:0] KInverse; 
 
    reg LoadQRFactorization; 
    wire UnLoadQRFactorization; 
    QRFactorization(clk, LoadQRFactorization, K, R, Q, UnLoadQRFactorization); 
    
    UpperTriangularSolver(Q, R, KInverse); 
    
    Normalization(KInverse, W); 
    
endmodule
