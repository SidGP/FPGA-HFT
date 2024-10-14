`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 07:07:58 AM
// Design Name: 
// Module Name: ColumnSolver
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


module ColumnSolver (
    input [127:0] R, 
    input [31:0] B, 
    output [31:0] X
    ); 
    
    assign X[31:24] = B[31:24] / R[127:120] ; 
    assign X[23:16] = (B[23:16] - (X[31:24]*R[95:88])) / R[87:80]; 
    assign X[15:8] = (B[15:8] - ((X[23:16]*R[55:48])+(X[31:24]*R[63:56]))) / R[47:40]; 
    assign X[7:0] = (B[7:0] - ((X[15:8]*R[15:8])+(X[23:16]*R[23:16])+(X[31:24]*R[31:24]))) / R[7:0]; 
     
endmodule
