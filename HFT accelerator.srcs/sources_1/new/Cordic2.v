`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 09:03:36 AM
// Design Name: 
// Module Name: Cordic2
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


module Cordic2(
    input clk, 
    input Load, 
    input [127:0] Xin, 
    input [127:0] Yin, 
    input [7:0] IterationNumber, 
    
    output [127:0] Xout, 
    output [127:0] Yout, 
    output UnLoad
    );
    
    wire Direction; 
    assign Direction = Yin[0]; 
    
    wire U1, U2, U3, U4, U5, U6, U7, U8; 
    assign UnLoad = (U1 & U2 & U3 & U4 & U5 & U6 & U7 & U8); 
    
    Cordic1 C1(clk, Load, Xin[15:0], Yin[15:0], IterationNumber, Direction, Xout[15:0], Yout[15:0], U1);
    Cordic1 C2(clk, Load, Xin[31:16], Yin[31:16], IterationNumber, Direction, Xout[31:16], Yout[31:16], U2);
    Cordic1 C3(clk, Load, Xin[47:32], Yin[47:32], IterationNumber, Direction, Xout[47:32], Yout[47:32], U3);
    Cordic1 C4(clk, Load, Xin[63:48], Yin[63:48], IterationNumber, Direction, Xout[63:48], Yout[63:48], U4);
    Cordic1 C5(clk, Load, Xin[79:64], Yin[79:64], IterationNumber, Direction, Xout[79:64], Yout[79:64], U5);
    Cordic1 C6(clk, Load, Xin[95:80], Yin[95:80], IterationNumber, Direction, Xout[95:80], Yout[95:80], U6);
    Cordic1 C7(clk, Load, Xin[111:96], Yin[111:96], IterationNumber, Direction, Xout[111:96], Yout[111:96], U7);
    Cordic1 C8(clk, Load, Xin[127:112], Yin[127:112], IterationNumber, Direction, Xout[127:112], Yout[127:112], U8);

     
endmodule
