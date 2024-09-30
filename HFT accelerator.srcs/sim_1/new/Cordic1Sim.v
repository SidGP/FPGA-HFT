`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 09:03:04 AM
// Design Name: 
// Module Name: Cordic1Sim
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


module Cordic1Simulation();
    parameter n =15; 
    
    reg Load;
    reg clk;
    reg [n:0] Xin;
    reg [n:0] Yin;
    reg [7:0] IterationNumber;
    reg Direction; 
    
    wire signed [n:0] Xout; 
    wire signed [n:0] Yout;  
    wire [7:0]IterationNumberOut; 
    wire UnLoad; 
    
    reg[7:0]i; 
    
    Cordic1 dut(clk, Load, Xin,Yin, IterationNumber, Direction, Xout, Yout, UnLoad);

    initial begin clk = 0; Load = 1; end
    always #5 clk = ~clk;
    
    initial begin 
    for (i = 8'd0 ; i<=8'd65; i=i+1) begin 
        //1-identity
        case(i) 
        // Zero Vector 
            0 : begin Xin = 0; Yin = 0; IterationNumber = 8'd0 ; Direction = 1'b0; end
            1 : begin Xin = 0; Yin = 0; IterationNumber = 8'd1 ; Direction = 1'b0; end
            2 : begin Xin = 0; Yin = 0; IterationNumber = 8'd2 ; Direction = 1'b0; end
            3 : begin Xin = 0; Yin = 0; IterationNumber = 8'd3 ; Direction = 1'b0; end
            4 : begin Xin = 0; Yin = 0; IterationNumber = 8'd4 ; Direction = 1'b0; end
        
            5 : begin Xin = 0; Yin = 0; IterationNumber = 8'd0 ; Direction = 1'b1; end
            6 : begin Xin = 0; Yin = 0; IterationNumber = 8'd1 ; Direction = 1'b1; end
            7 : begin Xin = 0; Yin = 0; IterationNumber = 8'd2 ; Direction = 1'b1; end
            8 : begin Xin = 0; Yin = 0; IterationNumber = 8'd3 ; Direction = 1'b1;  end
        
        //MAx vectors both
            9 : begin Xin = 16383; Yin = 16383; IterationNumber = 8'd0 ; Direction = 1'b0;end
            10: begin Xin = 16383; Yin = 16383; IterationNumber = 8'd1 ; Direction = 1'b0; end
            11: begin Xin = 16383; Yin = 16383; IterationNumber = 8'd2 ; Direction = 1'b0; end
            12: begin Xin = 16383; Yin = 16383; IterationNumber = 8'd3 ; Direction = 1'b0; end
        
            13: begin Xin = 16383; Yin = 16383; IterationNumber = 8'd0 ; Direction = 1'b1; end
            14: begin Xin = 16383; Yin = 16383; IterationNumber = 8'd1 ; Direction = 1'b1; end
            15: begin Xin = 16383; Yin = 16383; IterationNumber = 8'd2 ; Direction = 1'b1; end
            16: begin Xin = 16383; Yin = 16383; IterationNumber = 8'd3 ; Direction = 1'b1;end
        
//        Max negative Vectors both - need to correct expectation values. 
            17: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd0 ; Direction = 1'b0; end
            18: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd1 ; Direction = 1'b0; end
            19: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd2 ; Direction = 1'b0; end
            20: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd3 ; Direction = 1'b0; end
            21: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd0 ; Direction = 1'b0; end
            22: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd1 ; Direction = 1'b0; end
            23: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd2 ; Direction = 1'b0; end
            24: begin Xin = -16384; Yin = -16384; IterationNumber = 8'd3 ; Direction = 1'b0; end     
           
        // X-vector
            25: begin Xin = 16383; Yin = 0; IterationNumber = 8'd0; Direction = 1'b0; end
            26: begin Xin = 16383; Yin = 0; IterationNumber = 8'd1; Direction = 1'b0; end
            27: begin Xin = 16383; Yin = 0; IterationNumber = 8'd2; Direction = 1'b0; end
            28: begin Xin = 16383; Yin = 0; IterationNumber = 8'd3; Direction = 1'b0; end
        
            29: begin Xin = 16383; Yin = 0; IterationNumber = 8'd0; Direction = 1'b1; end
            30: begin Xin = 16383; Yin = 0; IterationNumber = 8'd1; Direction = 1'b1; end
            31: begin Xin = 16383; Yin = 0; IterationNumber = 8'd2; Direction = 1'b1; end
            32: begin Xin = 16383; Yin = 0; IterationNumber = 8'd3; Direction = 1'b1; end
        
        //Y-vector
            33: begin Xin = 0; Yin = 16383; IterationNumber = 8'd0; Direction = 1'b0; end
            34: begin Xin = 0; Yin = 16383; IterationNumber = 8'd1; Direction = 1'b0; end
            35: begin Xin = 0; Yin = 16383; IterationNumber = 8'd2; Direction = 1'b0; end
            36: begin Xin = 0; Yin = 16383; IterationNumber = 8'd3; Direction = 1'b0; end
                
            37: begin Xin = 0; Yin = 16383; IterationNumber = 8'd0; Direction = 1'b1; end
            38: begin Xin = 0; Yin = 16383; IterationNumber = 8'd1; Direction = 1'b1; end
            39: begin Xin = 0; Yin = 16383; IterationNumber = 8'd2; Direction = 1'b1; end
            40: begin Xin = 0; Yin = 16383; IterationNumber = 8'd3; Direction = 1'b1; end
        
        //Small Values
            41: begin Xin = 1; Yin = 1; IterationNumber = 8'd0; Direction = 1'b0; end
            42: begin Xin = 1; Yin = 1; IterationNumber = 8'd1; Direction = 1'b0; end
            43: begin Xin = 1; Yin = 1; IterationNumber = 8'd2; Direction = 1'b0; end
            44: begin Xin = 1; Yin = 1; IterationNumber = 8'd3; Direction = 1'b0; end
                
            45: begin Xin = 1; Yin = 1; IterationNumber = 8'd0; Direction = 1'b1; end
            46: begin Xin = 1; Yin = 1; IterationNumber = 8'd1; Direction = 1'b1; end
            47: begin Xin = 1; Yin = 1; IterationNumber = 8'd2; Direction = 1'b1; end
            48: begin Xin = 1; Yin = 1; IterationNumber = 8'd3; Direction = 1'b1; end
        
        //Opposit Quad
            49: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd0; Direction = 1'b0; end
            50: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd1; Direction = 1'b0; end
            51: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd2; Direction = 1'b0; end
            52: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd3; Direction = 1'b0; end
        
            53: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd0; Direction = 1'b1; end
            54: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd1; Direction = 1'b1; end
            55: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd2; Direction = 1'b1; end
            56: begin Xin = 16383; Yin = -16384; IterationNumber = 8'd3; Direction = 1'b1; end
        
            57: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd0; Direction = 1'b0; end
            58: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd1; Direction = 1'b0; end
            59: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd2; Direction = 1'b0; end
            60: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd3; Direction = 1'b0; end        
                
            61: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd0; Direction = 1'b1; end
            62: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd1; Direction = 1'b1; end
            63: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd2; Direction = 1'b1; end
            64: begin Xin = -16384; Yin = 16383; IterationNumber = 8'd3; Direction = 1'b1; end                  
        endcase
        #10
        Load = 0; 
        wait (UnLoad ==1);  
        #10 
        Load =1;   
        end
    end
        
   always @(Load) begin
        $display ("Xout, Yout"); 
        $display ("%d %d", Xout, Yout); 
   end 
endmodule
