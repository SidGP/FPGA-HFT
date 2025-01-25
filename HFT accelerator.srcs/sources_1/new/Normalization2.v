`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 01:57:27 AM
// Design Name: 
// Module Name: Normalization
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


module Normalization2 
// Parameters 
    #(BitsPerElement = 16, NumberOfRows = 4) 

// Inputs and Oututs
    (input [(BitsPerElement * (NumberOfRows *NumberOfRows))-1 :0] KInverse, 
    output [(BitsPerElement *NumberOfRows)-1 :0] W
//    output [(BitsPerElement -1) :0] Sum
    );
    
// Sum along the row    
    wire signed [15:0] Intermediate [3:0];
    
    wire signed [15:0] KI [15:0]; 
    assign {KI[15], KI[14], KI[13], KI[12]} = {KInverse[255:240], KInverse[239:224], KInverse[223:208], KInverse[207:192]}; 
    assign {KI[11], KI[10], KI[9], KI[8]} = {KInverse[191:176], KInverse[175:160], KInverse[159:144], KInverse[143:128]}; 
    assign {KI[7], KI[6], KI[5], KI[4]} = {KInverse[127:112], KInverse[111:96], KInverse[95:80], KInverse[79:64]}; 
    assign {KI[3], KI[2], KI[1], KI[0]} = {KInverse[63:48], KInverse[47:32], KInverse[31:16], KInverse[15:0]}; 
    
//    genvar i; genvar j; 
//    generate 
//        for (i = 1; i<=NumberOfRows; i = i+1) begin 
//            for (j =1; j<=NumberOfRows; j = j+1) begin
//                assign Intermediate [(BitsPerElement*i)-1 -:BitsPerElement] = Intermediate[(BitsPerElement*i)-1 -:BitsPerElement] + KInverse[(BitsPerElement*i*j)-1 -:BitsPerElement]; 
//             end 
//        end 
//   endgenerate
    assign Intermediate[3] = KI[15] + KI[14] + KI[13] + KI[12]; 
    assign Intermediate[2] = KI[11] + KI[10] + KI[9] + KI[8]; 
    assign Intermediate[1] = KI[7] + KI[6] + KI[5] + KI[4];  
    assign Intermediate[0] = KI[3] + KI[2] + KI[1] + KI[0]; 
        
//   Calculate the Sum; 
    wire signed [BitsPerElement-1 :0] Sum; 
//    generate 
//        for (i = 1; i<= NumberOfRows; i = i+1) begin 
//            assign Sum = Sum + Intermediate[(BitsPerElement*i)-1 -:BitsPerElement]; 
//        end 
//     endgenerate 
    assign Sum = Intermediate[3] + Intermediate[2] + Intermediate[1] + Intermediate[0]; 

//  Normalise intermediate by diving by sum of rows   
//    generate 
//        for (i=1; i<= NumberOfRows; i = i+1) begin 
//            assign W[(BitsPerElement*i)-1 -:BitsPerElement] = Intermediate[(BitsPerElement*i)-1 -:BitsPerElement]/Sum; 
//        end 
//    endgenerate 
    assign W[63:48] = (Intermediate[3]*100) /Sum; 
    assign W[47:32] = (Intermediate[2]*100)/Sum; 
    assign W[31:16] = (Intermediate[1]*100)/Sum; 
    assign W[15:0] = (Intermediate[0]*100)/Sum; 
            
endmodule