`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 10:05:33 AM
// Design Name: 
// Module Name: Cordic3Sim
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



module CordicTopSimulation();
    reg Load; 
    reg clk; 
//    reg enable;

    reg [127:0] Xin;  
    reg [127:0] Yin; 

    wire [127:0] Xout; 
    wire [127:0] Yout; 
    wire UnLoad; 
    
    
//    wire [127:0] XintermediateIn; 
//    wire [127:0] YintermediateIn; 
//    wire [7:0] Counter; 
//    wire UnLoadInternal; 
//    wire LoadInternal; 
    
    wire [127:0] XintermediateOut; 
    wire [127:0] YintermediateOut; 
    
    wire [7:0] Counter; 
//    wire [7:0] CounterOut; 
    
//    reg[7:0]i;
        
    Cordic3 dut(clk, Load, Xin, Yin, Xout, Yout, UnLoad, XintermediateOut, YintermediateOut, Counter);
    
        always #5 clk = ~clk;
    
      initial begin 
            clk = 0; 
            
//        for (i = 8'd0 ; i<=8'd65; i=i+1) begin 
            //1-identity
            Load <= 1;
//            case(i)  
//            0 : begin Xin = {16'd1, 16'd0, 16'd0, 16'd0}; Yin = {16'd1, 16'd0, 16'd0, 16'd0}; end
//            1 : begin Xin = {16'd16383, 16'd0, 16'd0, 16'd0}; Yin = {16'd16383, 16'd0, 16'd0, 16'd0}; end
//            2 : begin Xin = {-16'd16383, 16'd0, 16'd0, 16'd0}; Yin = {-16'd16383, 16'd0, 16'd0, 16'd0};end     
//            3: begin Xin = {16'd16383, 16'd0, 16'd0, 16'd0}; Yin = {16'd8192, 16'd0, 16'd0, 16'd0}; end
//            4: begin Xin = {-16'd8192, 16'd0, 16'd0, 16'd0}; Yin = {16'd16383, 16'd0, 16'd0, 16'd0};end
//            5: begin Xin = {16'd16383, 16'd0, 16'd0, 16'd0}; Yin = {16'd1, 16'd0, 16'd0, 16'd0}; end
//            6: begin Xin = {16'd10000, 16'd5000, 16'd0, 16'd0}; Yin = {16'd5000, 16'd2500, 16'd0, 16'd0};end
//            7: begin Xin = {-16'd10000, -16'd5000, 16'd0, 16'd0}; Yin = {-16'd5000, -16'd2500, 16'd0, 16'd0};end   
//        endcase
        Xin = {16'd0, 16'd0, 16'd0, 16'd707, 16'd64828, 16'd0, 16'd0, 16'd70}; 
        Yin = {16'd0, 16'd499, 16'd499, 16'd65036, 16'd65036, 16'd49, 16'd99, 16'd50};
        
        #10
        Load = 0;  
//        end
    end
        
   always @(Xout) begin
         $display ("Counter"); 
         $display ("%d", Counter); 
         $display ("Xout"); 
         $display ("%d %d %d %d", Xout[63:48], Xout[47:32], Xout[31:16], Xout[15:0]); 
         $display ("Yout"); 
         $display ("%d %d %d %d", Yout[63:48], Yout[47:32], Yout[31:16], Yout[15:0]); 
    end 
    
endmodule
