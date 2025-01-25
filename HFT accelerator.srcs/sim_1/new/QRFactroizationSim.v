`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 01:13:24 PM
// Design Name: 
// Module Name: QRFactroizationSim
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


module QRFactroizationSim();
    //external vairbales 
    reg clk = 0; 
    reg Load; 
    wire UnLoad;
    reg [5:0] i; 
    reg [255:0] Matrix; 
    wire [255:0] MatrixR; 
    wire [255:0] MatrixQ; 
    
    //internal variables
//    wire [511:0] MatrixIntermediate; 
//    wire [2:0] Stage; 
//    wire NextStage1; 
//    wire NextStage2; 
//    wire LoadCT1; 
//    wire LoadCT2; 
    
//    wire [127:0] X1in; 
//    wire [127:0] X2in; 
//    wire [127:0] Y1in; 
//    wire [127:0] Y2in;
//    wire [127:0] X1out; 
//    wire [127:0] X2out; 
//    wire [127:0] Y1out; 
//    wire [127:0] Y2out;  
    
//    wire [127:0] R1; 
//    wire [127:0] R2; 
//    wire [127:0] R3; 
//    wire [127:0] R4; 

    QRFactorization dut(clk, Load, Matrix, MatrixR, MatrixQ, UnLoad);  //, Stage, MatrixIntermediate);  
//    ,Stage, MatrixIntermediate, NextStage1,NextStage2, LoadCT1, LoadCT2 //); 
//    ,X1in, Y1in, X2in, Y2in, X1out, Y1out, X2out, Y2out);  
//    R1, R2, R3, R4); 

    always #5 clk = ~clk;

  initial begin 
        Load =1; 
//        Matrix = {{16'd100, 16'd100, 16'd100, 16'd100}, {16'd0, 16'd100, 16'd100, 16'd100}, {16'd0, 16'd0, 16'd100, 16'd100}, {16'd0, 16'd0, 16'd0, 16'd100}}; 
        Matrix = {{16'd100, 16'd10, 16'd10, 16'd10}, {16'd10, 16'd100, 16'd10, 16'd10}, {16'd10, 16'd10, 16'd100, 16'd10}, {16'd10, 16'd10, 16'd10, 16'd100}}; 
        #20
        Load=0; 
        
        wait (UnLoad ==1)
        #10
        Load=1; 
        Matrix = {{16'd100, 16'd10, 16'd10, 16'd10}, {16'd10, 16'd100, 16'd10, 16'd10}, {16'd10, 16'd10, 16'd100, 16'd10}, {16'd10, 16'd10, 16'd10, 16'd100}}; 
        #20 
        Load = 0; 
  end      
        
        always @(posedge UnLoad) begin 
//        $display (Stage); 
        $display ("Matrix R:");
        $display ("%d %d %d %d", MatrixR[255:240], MatrixR[239:224], MatrixR[223:208], MatrixR[207:192]); 
        $display ("%d %d %d %d", MatrixR[191:176], MatrixR[175:160], MatrixR[159:144], MatrixR[143:128]); 
        $display ("%d %d %d %d", MatrixR[127:112], MatrixR[111:96], MatrixR[95:80], MatrixR[79:64]); 
        $display ("%d %d %d %d", MatrixR[63:48], MatrixR[47:32], MatrixR[31:16], MatrixR[15:0]); 
 
        $display ("Matrix Q:");
        $display ("%d %d %d %d", MatrixQ[255:240], MatrixQ[239:224], MatrixQ[223:208], MatrixQ[207:192]); 
        $display ("%d %d %d %d", MatrixQ[191:176], MatrixQ[175:160], MatrixQ[159:144], MatrixQ[143:128]); 
        $display ("%d %d %d %d", MatrixQ[127:112], MatrixQ[111:96], MatrixQ[95:80], MatrixQ[79:64]); 
        $display ("%d %d %d %d", MatrixQ[63:48], MatrixQ[47:32], MatrixQ[31:16], MatrixQ[15:0]); 
        
        end
        
endmodule
