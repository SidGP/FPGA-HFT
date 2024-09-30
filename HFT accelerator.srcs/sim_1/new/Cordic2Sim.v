`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 10:16:26 AM
// Design Name: 
// Module Name: Cordic2Sim
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

module Cordic2Simulation();
    parameter [8:0] n= 8'd127;  
    
    reg Load;
    reg clk;
    
    reg [n:0] Xin;
    reg [n:0] Yin;
    reg [7:0] IterationNumber;
    reg Direction; 
    
    wire [n:0] Xout; 
    wire [n:0] Yout;  
    wire [7:0]IterationNumberOut; 
    wire UnLoad; 
    
    reg[7:0]i;
    
    Cordic2 dut(clk, Load, Xin,Yin, IterationNumber, Xout, Yout, UnLoad);

    always #5 clk = ~clk;

  initial begin 
        clk = 0; 
    for (i = 6'd0 ; i<=8'd65; i=i+1) begin 
        //1-identity
        Load <= 1; 
        case(i) 
        // Zero Vector 
            0 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd0 ; Direction = 1'b0; end
            1 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd1 ; Direction = 1'b0; end
            2 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd2 ; Direction = 1'b0; end
            3 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd3 ; Direction = 1'b0; end
            4 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd4 ; Direction = 1'b0; end
       
            5 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd0 ; Direction = 1'b1; end
            6 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd1 ; Direction = 1'b1; end
            7 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd2 ; Direction = 1'b1; end
            8 : begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd3 ; Direction = 1'b1; end
        
        //MAx vectors both
            9 : begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin ={16'd16383,16'd0,16'd0,16'd0} ; IterationNumber = 8'd0 ; Direction = 1'b0; end
            10: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin ={16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd1 ; Direction = 1'b0; end
            11: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin ={16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd2 ; Direction = 1'b0; end
            12: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin ={16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd3 ; Direction = 1'b0; end
        
            13: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd0 ; Direction = 1'b1; end
            14: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd1 ; Direction = 1'b1; end
            15: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd2 ; Direction = 1'b1; end
            16: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd3 ; Direction = 1'b1; end
        
        //Max negative Vectors both
            17: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd0 ; Direction = 1'b0; end
            18: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd1 ; Direction = 1'b0; end
            19: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd2 ; Direction = 1'b0; end
            20: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd3 ; Direction = 1'b0; end

            21: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd0 ; Direction = 1'b0; end
            22: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd1 ; Direction = 1'b0; end
            23: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd2 ; Direction = 1'b0; end
            24: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd3 ; Direction = 1'b0; end     
           
        // X-vector
            25: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b0; end
            26: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b0; end
            27: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b0; end
            28: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b0; end
        
            29: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b1; end
            30: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b1; end
            31: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b1; end
            32: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {16'd0,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b1; end
        
        //Y-vector
            33: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b0; end
            34: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b0; end
            35: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b0; end
            36: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b0; end
                
            37: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b1; end
            38: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b1; end
            39: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b1; end
            40: begin Xin = {16'd0,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b1; end
        
        //Small Values
            41: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b0; end
            42: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b0; end
            43: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b0; end
            44: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b0; end
                
            45: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b1; end
            46: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b1; end
            47: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b1; end
            48: begin Xin = {16'd1,16'd0,16'd0,16'd0}; Yin = {16'd1,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b1; end
        
        //Opposit Quad
            49: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b0; end
            50: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b0; end
            51: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b0; end
            52: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b0; end
        
            53: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b1; end
            54: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b1; end
            55: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b1; end
            56: begin Xin = {16'd16383,16'd0,16'd0,16'd0}; Yin = {-16'd16384,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b1; end
        
            57: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b0; end
            58: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b0; end
            59: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b0; end
            60: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b0; end        
                
            61: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd0; Direction = 1'b1; end
            62: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd1; Direction = 1'b1; end
            63: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd2; Direction = 1'b1; end
            64: begin Xin = {-16'd16384,16'd0,16'd0,16'd0}; Yin = {16'd16383,16'd0,16'd0,16'd0}; IterationNumber = 8'd3; Direction = 1'b1; end                  
        endcase
        #10
        Load <= 0; 
        #10      
        Load <=1;   
        end
    end
        
   always @(Load) begin
        $display ("Xout"); 
        $display ("%d %d %d %d", Xout[63:48], Xout[47:32], Xout[31:16], Xout[15:0]); 
        $display ("Yout"); 
        $display ("%d %d %d %d", Yout[63:48], Yout[47:32], Yout[31:16], Yout[15:0]); 
   end 
endmodule