`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 07:08:33 AM
// Design Name: 
// Module Name: TransposeSim
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


module TransposeSim();
    parameter Elements =4; 
    parameter ElementBits = 8; 
    
    reg [((Elements*Elements) *ElementBits) -1 :0] MatrixIn; 
    wire [((Elements*Elements) *ElementBits) -1 :0] MatrixOut;
    reg [((Elements*Elements) *ElementBits) -1 :0] Matrix;
    
    Transpose#(.Elements(Elements), .ElementsBits(ElementBits)) dut (MatrixIn, MatrixOut); 
    
    initial begin 
        MatrixIn = { 8'd1, 8'd5, 8'd9, 8'd13, 
                     8'd2, 8'd6, 8'd10, 8'd14, 
                     8'd3, 8'd7, 8'd11, 8'd15, 
                     8'd4, 8'd8, 8'd12, 8'd16}; 
        
        #20             
        Matrix = MatrixOut; 
                     
        $display ("InputMatrix"); 
        $display ("%d, %d, %d, %d", MatrixIn[127:120], MatrixIn[119:112], MatrixIn[111:104], MatrixIn[103:96]); 
        $display ("%d, %d, %d, %d", MatrixIn[95:88], MatrixIn[87:80], MatrixIn[79:72], MatrixIn[71:64]);
        $display ("%d, %d, %d, %d", MatrixIn[63:56], MatrixIn[55:48], MatrixIn[47:40], MatrixIn[39:32]);
        $display ("%d, %d, %d, %d", MatrixIn[31:24], MatrixIn[23:16], MatrixIn[15:8], MatrixIn[7:0]);

        $display ("OutputMatrix"); 
        $display ("%d, %d, %d, %d", Matrix[127:120], Matrix[119:112], Matrix[111:104], Matrix[103:96]); 
        $display ("%d, %d, %d, %d", Matrix[95:88], Matrix[87:80], Matrix[79:72], Matrix[71:64]);
        $display ("%d, %d, %d, %d", Matrix[63:56], Matrix[55:48], Matrix[47:40], Matrix[39:32]);
        $display ("%d, %d, %d, %d", Matrix[31:24], Matrix[23:16], Matrix[15:8], Matrix[7:0]);       
    end 
                 
endmodule
