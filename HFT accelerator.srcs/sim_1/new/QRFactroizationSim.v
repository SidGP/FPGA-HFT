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
    reg clk; 
    reg Load; 
    wire UnLoad;
    reg [5:0] i; 
    reg [255:0] Matrix; 
    wire [255:0] MatrixR; 
    wire [255:0] MatrixQ; 
    
    //internal variables
    wire [511:0] MatrixIntermediate; 
    wire [2:0] Stage; 
    wire NextStage1; 
    wire NextStage2; 
    wire LoadCT1; 
    wire LoadCT2; 
    
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

    QRFactorization dut(clk, Load, Matrix, MatrixR, MatrixQ, UnLoad //);  
    ,Stage, MatrixIntermediate, NextStage1,NextStage2, LoadCT1, LoadCT2 ); 
//    ,X1in, Y1in, X2in, Y2in, X1out, Y1out, X2out, Y2out, 
//    R1, R2, R3, R4); 

    always #5 clk = ~clk;

  initial begin 

        clk = 0; 
        Load =1; 
        
    for (i = 6'b000000 ; i<=6'b010011; i=i+1) begin 
        //1-identity
        case(i)
        0: Matrix = {{15'd1, 15'd0, 15'd0, 15'd0},{15'd0, 15'd1, 15'd0, 15'd0},{15'd0, 15'd0, 15'd1, 15'd0},{15'd0, 15'd0, 15'd0, 15'd0}}; 
        //2-Diagonal
        1: Matrix = {{15'd4, 15'd0, 15'd0, 15'd0},{15'd0, 15'd3, 15'd0, 15'd0},{15'd0, 15'd0, 15'd2, 15'd0},{15'd0, 15'd0, 15'd0, 15'd1}}; 
        //3-Upper Triancle
        2: Matrix = {{15'd1, 15'd2, 15'd3, 15'd4},{15'd0, 15'd5, 15'd6, 15'd7},{15'd0, 15'd0, 15'd8, 15'd9},{15'd0, 15'd0, 15'd0, 15'd10}}; 
        //4-Lower Triangle
        3: Matrix = {{15'd1, 15'd0, 15'd0, 15'd0},{15'd2, 15'd3, 15'd0, 15'd0},{15'd4, 15'd5, 15'd6, 15'd0},{15'd7, 15'd8, 15'd9, 15'd10}}; 
        //5- Symmetric
        4: Matrix = {{15'd1, 15'd2, 15'd3, 15'd4},{15'd2, 15'd5, 15'd6, 15'd7},{15'd3, 15'd6, 15'd8, 15'd9},{15'd4, 15'd7, 15'd9, 15'd10}}; 
        //6-Random Full Rank
        5: Matrix = {{15'd4, 15'd3, 15'd7, 15'd1},{15'd1, 15'd9, 15'd5, 15'd8},{15'd6, 15'd2, 15'd3, 15'd4},{15'd5, 15'd6, 15'd1, 15'd2}}; 
        //7- Matrix with negative Values
        6: Matrix = {{-15'd1, -15'd2, -15'd3, -15'd4},{-15'd2, -15'd1, -15'd6, -15'd5},{-15'd3, -15'd6, -15'd4, -15'd1},{-15'd4, -15'd5, -15'd1, -15'd2}}; 
        //8-Repeated Rows
        7: Matrix = {{15'd1, 15'd2, 15'd3, 15'd4},{15'd1, 15'd2, 15'd3, 15'd4},{15'd5, 15'd6, 15'd7, 15'd8},{15'd9, 15'd10, 15'd11, 15'd12}};
        //9-Repeated Columns
        8: Matrix = {{15'd1, 15'd1, 15'd3, 15'd4},{15'd2, 15'd2, 15'd5, 15'd6},{15'd3, 15'd3, 15'd7, 15'd8},{15'd4, 15'd4, 15'd9, 15'd10}}; 
        //10-Sparse
        9: Matrix = {{15'd1, 15'd0, 15'd0, 15'd0},{15'd0, 15'd0, 15'd3, 15'd0},{15'd0, 15'd4, 15'd0, 15'd0},{15'd0, 15'd0, 15'd0, 15'd5}};
        //11-Orthoganal
        10: Matrix = {{15'd1, 15'd0, 15'd0, 15'd0},{15'd0, 15'd1, 15'd0, 15'd0},{15'd0, 15'd1, 15'd0, 15'd0},{15'd0, 15'd0, 15'd0, 15'd1}}; 
        //12-All equal values
        11: Matrix = {{15'd1, 15'd1, 15'd1, 15'd1},{15'd1, 15'd1, 15'd1, 15'd1},{15'd1, 15'd1, 15'd1, 15'd1},{15'd1, 15'd1, 15'd1, 15'd1}}; 
        //13- Small Values
        //14-Large Values
        12: Matrix = {{15'd1000, 15'd2000, 15'd3000, 15'd4000},{15'd5000, 15'd6000, 15'd7000, 15'd8000},{15'd9000, 15'd10000, 15'd11000, 15'd12000},{15'd13000, 15'd14000, 15'd15000, 15'd16000}};
        //15- Random negative and positive
        13: Matrix = {{15'd3, -15'd2, 15'd7, -15'd1},{-15'd5, 15'd4, -15'd6, 15'd2},{15'd8, -15'd9, 15'd5, -15'd3},{-15'd7, 15'd6, -15'd8, 15'd4}};
        //16- Hilbert Matrix 
        //17- Singular Matrix
        14: Matrix = {{15'd2, 15'd4, 15'd6, 15'd8},{15'd1, 15'd2, 15'd3, 15'd4},{15'd1, 15'd1, 15'd1, 15'd1},{15'd0, 15'd0, 15'd0, 15'd0}}; 
        //18-Permutation Matrix
        15: Matrix = {{15'd0, 15'd1, 15'd0, 15'd0},{15'd0, 15'd0, 15'd1, 15'd0},{15'd1, 15'd0, 15'd0, 15'd0},{15'd0, 15'd0, 15'd0, 15'd1}}; 
        //19- Random Decimal values 
        //20- Rank Deficient 
        16: Matrix = {{15'd1, 15'd2, 15'd3, 15'd4},{15'd2, 15'd4, 15'd6, 15'd8},{15'd3, 15'd6, 15'd9, 15'd12},{15'd0, 15'd0, 15'd0, 15'd0}};
        //21 - Toeplitz
        17: Matrix = {{15'd4, 15'd3, 15'd2, 15'd1},{15'd3, 15'd4, 15'd3, 15'd2},{15'd2, 15'd3, 15'd4, 15'd3},{15'd1, 15'd2, 15'd3, 15'd4}}; 
        //22- Vandermode
        18: Matrix = {{15'd1, 15'd1, 15'd1, 15'd1},{15'd1, 15'd2, 15'd4, 15'd8},{15'd1, 15'd3, 15'd9, 15'd27},{15'd1, 15'd4, 15'd16, 15'd64}};         
        //22- Circulant
        19: Matrix = {{15'd1, 15'd2, 15'd3, 15'd4},{15'd4, 15'd1, 15'd2, 15'd3},{15'd3, 15'd4, 15'd1, 15'd2},{15'd2, 15'd3, 15'd4, 15'd1}};  
        default: Matrix = {{15'd0, 15'd0, 15'd0, 15'd0}, {15'd0, 15'd0, 15'd0, 15'd0}, {15'd0, 15'd0, 15'd0, 15'd0}, {15'd0, 15'd0, 15'd0, 15'd0}}; 
        endcase
        
        #10
        Load=0; 
        wait (UnLoad ==1)
        #10
        Load=1; 
        
        end 
        end      
        
        always @(Load) begin 
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
