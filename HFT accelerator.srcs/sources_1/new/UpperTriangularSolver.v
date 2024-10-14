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
    input [((Elements*Elements) *ElementBits)-1:0] Q,
    input [((Elements*Elements) *ElementBits)-1:0] R, 
    output[((Elements*Elements) *ElementBits)-1:0] V
    );
    
    wire [((Elements*Elements) * ElementBits) -1:0] TransposeQ; 
    wire [((Elements*Elements) * ElementBits) -1:0] TransposeV; 
    
//    Transpose (Q,TransposeQ); 
    
    ColumnSolver inst0(R, Q[127:96], TransposeV[127:96]); 
    ColumnSolver inst1(R, Q[95:64], TransposeV[95:96]); 
    ColumnSolver inst2(R, Q[63:32], TransposeV[63:32]); 
    ColumnSolver inst3(R, Q[31:0], TransposeV[31:0]); 
    
    Transpose (V, TransposeV); 

endmodule
