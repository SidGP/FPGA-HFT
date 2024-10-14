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
    Transpose (Q, TransposeQ); 

endmodule
