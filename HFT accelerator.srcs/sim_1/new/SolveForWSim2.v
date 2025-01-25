`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2024 04:15:43 AM
// Design Name: 
// Module Name: SolveForWSim
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


module SolveForWSim2();
    
    reg clk; 
    reg Load; 
    reg [255:0] K; 
    wire [63:0] W; 
//    wire UnLoad; 
    
    wire [255:0] Q; 
    wire [255:0] R; 
    wire [255:0] KI; 
    wire UnLoadQRFactorization; 
    
    initial begin 
        clk = 0; 
        forever #5 clk = ~clk; 
    end 
    
    SolveForW dut(clk, Load, K, W, Q, R, UnLoad, KI); 
    
    reg [7:0] testcase = 1; 
    initial begin 
        K = 0; 
        Load = 1; 
        #20 
        Load = 0; 
        testcase = 1;  
    end 
    
    reg [31:0] start_time; 
    always @(posedge UnLoad) begin 
        #10
        case(testcase) 
        1: K = {16'd1000, 16'd0, 16'd0, 16'd0, 
                16'd0, 16'd1000, 16'd0, 16'd0, 
                16'd0, 16'd0, 16'd1000, 16'd0, 
                16'd0, 16'd0, 16'd0, 16'd1000};
        2: K = {16'd1000, 16'd100, 16'd100, 16'd100, 
                16'd100, 16'd1000, 16'd100, 16'd100, 
                16'd100, 16'd100, 16'd1000, 16'd100, 
                16'd100, 16'd100, 16'd100, 16'd1000}; 
                
        3: K = {16'd8000, 16'd200, 16'd100, 16'd100, 
                16'd200, 16'd7000, 16'd300, 16'd200, 
                16'd100, 16'd300, 16'd6000, 16'd500, 
                16'd100, 16'd200, 16'd500, 16'd5000};                 
                             
        4: K = {16'd1000, -16'd300, 16'd500, -16'd400, 
                -16'd300, 16'd1000, -16'd200, 16'd500, 
                16'd500, -16'd200, 16'd1000, -16'd300, 
                -16'd400, 16'd500, -16'd300, 16'd1000}; 
             
        5: K = {16'd9000, 16'd3000, 16'd2000, 16'd1000, 
             16'd3000, 16'd11000, 16'd3000, 16'd2000, 
             16'd2000, 16'd3000, 16'd12000, 16'd3000, 
             16'd1000, 16'd2000, 16'd3000, 16'd10000}; 
             
        6: K = {16'd9000, -16'd4000, 16'd3000, -16'd1000, 
                -16'd4000, 16'd8000, -16'd2000, 16'd3000, 
                16'd3000, -16'd2000, 16'd10000, -16'd4000, 
                -16'd1000, 16'd3000, -16'd4000, 16'd9000}; 
             
        7: K = {16'd1000, 16'd900, 16'd900, 16'd900, 
                16'd900, 16'd1000, 16'd900, 16'd900, 
                16'd900, 16'd900, 16'd1000, 16'd900, 
                16'd900, 16'd900, 16'd900, 16'd1000}; 
                
        8: K = {16'd1000, 16'd0, 16'd0, 16'd500, 
                16'd0, 16'd1000, 16'd400, 16'd0, 
                16'd0, 16'd400, 16'd1000, 16'd0, 
                16'd500, 16'd0, 16'd0, 16'd1000};   
                 
        9: K = {16'd1000, 16'd200, 16'd0, 16'd0, 
                16'd200, 16'd1000, 16'd0, 16'd0, 
                16'd0, 16'd0, 16'd2000, 16'd300, 
                16'd0, 16'd0, 16'd300, 16'd2000}; 
                  
        10: K = {16'd4000, 16'd2000, 16'd1000, 16'd0, 
                16'd2000, 16'd6000, 16'd2000, 16'd1000, 
                16'd1000, 16'd2000, 16'd5000, 16'd2000, 
                16'd0, 16'd1000, 16'd2000, 16'd4000};   
                  
        11: K = {16'd2500, 16'd400, 16'd200, 16'd100, 
                16'd400, 16'd2000, 16'd300, 16'd200, 
                16'd200, 16'd300, 16'd1500, 16'd500, 
                16'd100, 16'd200, 16'd500, 16'd1000};  
                 
        12: K = {16'd8000, -16'd100, 16'd100, 16'd200, 
                -16'd100, 16'd7000, -16'd200, -16'd300, 
                16'd100, -16'd200, 16'd6000, 16'd500, 
                16'd200, -16'd300, 16'd500, 16'd5000}; 
                  
        13: K = {16'd1000, 16'd700, 16'd500, 16'd300, 
                16'd700, 16'd1000, 16'd700, 16'd500, 
                16'd500, 16'd700, 16'd1000, 16'd700, 
                16'd300, 16'd500, 16'd700, 16'd1000};
                
        14: K = {16'd6000, -16'd1000, 16'd0, 16'd1000, 
                -16'd1000, 16'd5000, -16'd1000, 16'd0, 
                16'd0, -16'd1000, 16'd4000, -16'd1000, 
                16'd1000, 16'd0, -16'd1000, 16'd3000};  
                
        15: K = {16'd800, 16'd400, 16'd100, 16'd50, 
                16'd400, 16'd700, 16'd300, 16'd100, 
                16'd100, 16'd200, 16'd600, 16'd200, 
                16'd50, 16'd100, 16'd200, 16'd500}; 
  
        endcase 
        testcase = testcase + 1; 
        Load = 1; 
        #20 
        Load = 0;  
        start_time = $time;  
    end 
    
    
    wire  signed [15:0] R1; assign R1 = R[15:0]; 
    wire  signed [15:0] R2; assign R2 = R[31:16];
    wire  signed [15:0] R3; assign R3 = R[47:32];
    wire  signed [15:0] R4; assign R4 = R[63:48];
    wire  signed [15:0] R5; assign R5 = R[79:64];
    wire  signed [15:0] R6; assign R6 = R[95:80];
    wire  signed [15:0] R7; assign R7 = R[111:96];
    wire  signed [15:0] R8; assign R8 = R[127:112];
    wire  signed [15:0] R9; assign R9 = R[143:128];
    wire  signed [15:0] R10; assign R10 = R[159:144];
    wire  signed [15:0] R11; assign R11 = R[175:160];
    wire  signed [15:0] R12; assign R12 = R[191:176];
    wire  signed [15:0] R13; assign R13 = R[207:192];
    wire  signed [15:0] R14; assign R14 = R[223:208];
    wire  signed [15:0] R15; assign R15 = R[239:224];
    wire  signed [15:0] R16; assign R16 = R[255:240];

    wire  signed [15:0] Q1; assign Q1 = Q[15:0]; 
    wire  signed [15:0] Q2; assign Q2 = Q[31:16];
    wire  signed [15:0] Q3; assign Q3 = Q[47:32];
    wire  signed [15:0] Q4; assign Q4 = Q[63:48];
    wire  signed [15:0] Q5; assign Q5 = Q[79:64];
    wire  signed [15:0] Q6; assign Q6 = Q[95:80];
    wire  signed [15:0] Q7; assign Q7 = Q[111:96];
    wire  signed [15:0] Q8; assign Q8 = Q[127:112];
    wire  signed [15:0] Q9; assign Q9 = Q[143:128];
    wire  signed [15:0] Q10; assign Q10 = Q[159:144];
    wire  signed [15:0] Q11; assign Q11 = Q[175:160];
    wire  signed [15:0] Q12; assign Q12 = Q[191:176];
    wire  signed [15:0] Q13; assign Q13 = Q[207:192];
    wire  signed [15:0] Q14; assign Q14 = Q[223:208];
    wire  signed [15:0] Q15; assign Q15 = Q[239:224]; 
    wire  signed [15:0] Q16; assign Q16 = Q[255:240];

    wire signed [15:0] KI1; assign KI1 = KI[15:0]; 
    wire signed [15:0] KI2; assign KI2 = KI[31:16];
    wire signed [15:0] KI3; assign KI3 = KI[47:32];
    wire signed [15:0] KI4; assign KI4 = KI[63:48];
    wire signed [15:0] KI5; assign KI5 = KI[79:64];
    wire signed [15:0] KI6; assign KI6 = KI[95:80];
    wire signed [15:0] KI7; assign KI7 = KI[111:96];
    wire signed [15:0] KI8; assign KI8 = KI[127:112];
    wire signed [15:0] KI9; assign KI9 = KI[143:128];
    wire signed [15:0] KI10; assign KI10 = KI[159:144];
    wire signed [15:0] KI11; assign KI11 = KI[175:160];
    wire signed [15:0] KI12; assign KI12 = KI[191:176];
    wire signed [15:0] KI13; assign KI13 = KI[207:192];
    wire signed [15:0] KI14; assign KI14 = KI[223:208];
    wire signed [15:0] KI15; assign KI15 = KI[239:224]; 
    wire signed [15:0] KI16; assign KI16 = KI[255:240];
    
    wire signed [15:0] K1; assign K1 = K[15:0]; 
    wire signed [15:0] K2; assign K2 = K[31:16];
    wire signed [15:0] K3; assign K3 = K[47:32];
    wire signed [15:0] K4; assign K4 = K[63:48];
    wire signed [15:0] K5; assign K5 = K[79:64];
    wire signed [15:0] K6; assign K6 = K[95:80];
    wire signed [15:0] K7; assign K7 = K[111:96];
    wire signed [15:0] K8; assign K8 = K[127:112];
    wire signed [15:0] K9; assign K9 = K[143:128];
    wire signed [15:0] K10; assign K10 = K[159:144];
    wire signed [15:0] K11; assign K11 = K[175:160];
    wire signed [15:0] K12; assign K12 = K[191:176];
    wire signed [15:0] K13; assign K13 = K[207:192];
    wire signed [15:0] K14; assign K14 = K[223:208];
    wire signed [15:0] K15; assign K15 = K[239:224]; 
    wire signed [15:0] K16; assign K16 = K[255:240];  
    
    wire signed [15:0] W1; assign W1 = W[15:0]; 
    wire signed [31:16] W2; assign W2 = W[31:16]; 
    wire signed [47:32] W3; assign W3 = W[47:32]; 
    wire signed [63:48] W4; assign W4 = W[63:48]; 
    
             
    always @(posedge UnLoad) begin
        $display ("%d", testcase-1 );
        $display ("%d", ($time - start_time)/10); 
//        $display ("%d %d %d %d",K1, K2, K3, K4); 
//        $display ("%d %d %d %d",K5, K6, K7, K8); 
//        $display ("%d %d %d %d",K9, K10, K11, K12 ); 
//        $display ("%d %d %d %d",K13, K14, K15, K16); 
//        $display (""); 
                 
//        $display ("Matrix R:");
//        $display (" %d %d %d %d", R1, R2, R3, R4); 
//        $display (" %d %d %d %d", R5, R6, R7, R8); 
//        $display (" %d %d %d %d", R9, R10, R11, R12); 
//        $display (" %d %d %d %d", R13, R14, R15, R16); 
 
//        $display ("Matrix Q:");
//        $display ("%d %d %d %d", Q1, Q5, Q9, Q13); 
//        $display ("%d %d %d %d", Q2, Q6, Q10, Q14); 
//        $display ("%d %d %d %d", Q3, Q7, Q11, Q15); 
//        $display ("%d %d %d %d", Q4, Q8, Q12, Q16); 

//        $display ("Matrix KInverse:");
//        $display ("%d %d %d %d",KI1, KI2, KI3, KI4); 
//        $display ("%d %d %d %d",KI5, KI6, KI7, KI8); 
//        $display ("%d %d %d %d",KI9, KI10, KI11, KI12 ); 
//        $display ("%d %d %d %d",KI13, KI14, KI15, KI16); 
//        $display (""); 
        
        $display ("Portfolio Weight"); 
        $display ("%d, %d, %d, %d" , W1, W2, W3, W4);
        $display (""); 
        $display ("_________________________________________");  
    end 
    
endmodule
