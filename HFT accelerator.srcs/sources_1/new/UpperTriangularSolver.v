`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 06:59:43 AM
// Design Name: 
// Module Name: UpperTriangularSolver
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


module UpperTriangularSolver #(Elements=4, ElementBits =8)(
    input [127:0] R,
    input [127:0] Q, 
    output[127:0] KInverse
    );
    
//    wire [((Elements*Elements) * ElementBits) -1:0] TransposeQ; 
    wire [((Elements*Elements) * ElementBits) -1:0] TransposeKInverse; 
    
//    Transpose (Q,TransposeQ); 
    
    ColumnSolver inst0(R, Q[127:96], TransposeKInverse[127:96]); 
    ColumnSolver inst1(R, Q[95:64], TransposeKInverse[95:64]); 
    ColumnSolver inst2(R, Q[63:32], TransposeKInverse[63:32]); 
    ColumnSolver inst3(R, Q[31:0], TransposeKInverse[31:0]); 
    
    Transpose inst4(TransposeKInverse, KInverse); 

endmodule
