`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 06:21:14 AM
// Design Name: 
// Module Name: Transpose
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


module Transpose #(Elements=4, ElementBits=8) (
    input [((Elements*Elements) *ElementBits) -1 :0] Matrix, 
//    output [ElementBits-1:0] MatrixUnflattened [Elements-1:0] [Elements-1:0], 
//    output [ElementBits-1:0] TransposeMatrixUnflattened [Elements-1:0] [Elements-1:0],
    output[((Elements*Elements) *ElementBits) -1 :0] TransposeMatrix
    );
    
    wire [ElementBits-1:0] MatrixUnflattened [0:Elements-1] [0:Elements-1]; 
    wire [ElementBits-1:0] TransposeMatrixUnflattened [0:Elements-1] [0:Elements-1]; 
    
    genvar a,b; 
    generate 
        for (a=0; a< Elements; a= a+1) begin 
            for (b=0; b<Elements; b=b+1) begin
                assign MatrixUnflattened[a][b] = Matrix[ElementBits*((Elements*a)+b) +: ElementBits]; 
            end 
         end
    endgenerate

    genvar c,d; 
    generate 
        for (c=0; c< Elements; c= c+1) begin 
            for (d=0; d<Elements; d=d+1) begin
                assign TransposeMatrixUnflattened[d][c] = MatrixUnflattened[c][d]; 
            end 
         end
    endgenerate    
    
    genvar e,f; 
    generate 
        for (e=0; e<Elements; e = e+1) begin 
            for (f=0; f<Elements; f = f+1) begin 
                assign TransposeMatrix[ElementBits*((Elements*e)+f) +: ElementBits] = TransposeMatrixUnflattened[e][f]; 
            end 
        end 
    endgenerate 
    
endmodule
