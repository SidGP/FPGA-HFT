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


module Normalization (
    input [127:0] KInverse, 
    output [31:0] W, 
    output [7:0] Sum
    );
    
    wire [31:0] Intermediate; 
    assign Intermediate[31:24] = KInverse[127:120] + KInverse[119:112] + KInverse[111:104] + KInverse[103:96]; 
    assign Intermediate[23:16] = KInverse[95:88] + KInverse[87:80] + KInverse[79:72] + KInverse[71:64]; 
    assign Intermediate[15:8] = KInverse[63:56] + KInverse[55:48] + KInverse[47:40] + KInverse[39:32]; 
    assign Intermediate[7:0] = KInverse[31:24] + KInverse[23:16] + KInverse[15:8] + KInverse[7:0]; 
    
//    wire [7:0] Sum; 
    assign Sum = Intermediate[31:24] + Intermediate[23:16] + Intermediate[15:8] + Intermediate[7:0]; 
    
    assign W[31:24] = Intermediate[31:24]; 
    assign W[23:16] = Intermediate[23:16]; 
    assign W[15:8] = Intermediate[15:8]; 
    assign W[7:0] = Intermediate[7:0]; 
        
endmodule
