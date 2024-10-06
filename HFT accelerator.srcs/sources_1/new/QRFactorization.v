`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 09:55:53 AM
// Design Name: 
// Module Name: QRFactorization
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

// does QR factorization to give Q and R such that QR = Matrix. 
module QRFactorization(
    input clk, 
    input Load, 
    input [255:0] Matrix, 
    
    output reg [255:0] MatrixR,  
    output reg [255:0] MatrixQ, 
    output reg UnLoad, 
    
    
    output reg [511:0] MatrixIntermediate, 
    output reg [2:0] Stage, 
    output NextStage1, 
    output NextStage2, 
    output reg LoadCT1, 
    output reg LoadCT2, 
    
//    output [127:0] X1, 
//    output [127:0] X2, 
//    output [127:0] Y1, 
//    output [127:0] Y2,
    
    output [127:0] R1, 
    output [127:0] R2, 
    output [127:0] R3, 
    output [127:0] R4 
    );
    
  
//    reg [2:0] Stage; 
    reg [127:0]X1in; 
    reg [127:0]X2in;  
    reg [127:0]Y1in; 
    wire [127:0]Y2in;
    wire [127:0]X1out; 
    wire [127:0]X2out;  
    wire [127:0]Y1out; 
    wire [127:0]Y2out;

//    assign X1in = Stage[1] ? (Stage[0] ? R2 : R2) : (Stage[0] ? R1 : R1); 
//    assign Y1in = Stage[1] ? (Stage[0] ? R4 : R3) : (Stage[0] ? R3 : R2); 
//    assign X2in = Stage[0] ? R2: R3; 
//    assign Y2in = R4; 
    
//    assign R4 = Stage[1] ? (Stage[0] ? Y1out: ) : (Stage[0] ? Y2out : Y2out); 
//    assign R3 = Stage[1] ? (Stage[0] ? : Y1out): (Stage[0] ? Y1out: X2out); 
//    assign R2 = Stage[1] ? (Stage[0] ? X1out : 

// remaining variables. 
//    reg [512:0] MatrixIntermediate; 
//    wire NextStage1; 
//    wire NextStage2; 
//    reg LoadCT1; 
//    reg LoadCT2; 

// Instantaitng Cordics.   
    Cordic3 CT1(clk, LoadCT1, X1in, Y1in, X1out, Y1out, NextStage1);
    Cordic3 CT2(clk, LoadCT2, X2in, Y2in, X2out, Y2out, NextStage2);        
 
// Control Logic.     
    always @ (posedge clk) begin 
    
        // Load MatrixIntermediate, Set Stage. 
        if (Load) begin 
            MatrixIntermediate = {Matrix[255:192], 64'hFFFFFFFFFFFFFFFF, 
                                  Matrix[191:128], 64'hFFFFFFFFFFFFFFFF, 
                                  Matrix[127:64],  64'hFFFFFFFFFFFFFFFF, 
                                  Matrix[63:0],    64'hFFFFFFFFFFFFFFFF} ; 
            Stage = 3'b000; 
            LoadCT1 = 1; 
            LoadCT2 = 1; 
         end 
         
         //UnLoad 
         else if (Stage == 3'b100) begin 
            UnLoad =1; 
            MatrixR = {MatrixIntermediate[511:448], MatrixIntermediate[383:320], MatrixIntermediate[255:192], MatrixIntermediate[127:64]};
            MatrixQ = {MatrixIntermediate[447:384], MatrixIntermediate[319:256], MatrixIntermediate[191:128], MatrixIntermediate[63:0]}; 
         end  
         
         //Update to next Stage. 
         else if (NextStage1 && NextStage2) begin 
                case (Stage)
                3'b000: begin 
                        LoadCT1 = 1; LoadCT2 = 1; 
                        end 
                3'b001: begin 
                        LoadCT1 = 1; LoadCT2 = 1; end
                3'b010: begin 
                        LoadCT1 = 1; LoadCT2 = 0; end 
                3'b011: begin 
                        LoadCT1 = 1; LoadCT2 = 0; end 
                default: begin 
                        LoadCT1 = 0; LoadCT2 =0; end 
                endcase 
        end 
        
        else begin 
            LoadCT1 = 0; 
            LoadCT2 = 0; 
        end 
    end 
endmodule
