`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////
// Company: UCLA Henry Samueli School of Engineering and Applied Science
// Engineers: Victor Lai and Dennis Gahm
// Student IDs: 404274720 and 704016107
// 
// Create Date: 05/28/2015 01:39:02 PM
// Design Name: 
// Module Name: csm51a_proj3_tb.v
// Project Name: Verilog Lab #3
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
/////////////////////////////////////////////////////////////////////////////


module Top;
    reg x1,x0,clock,clear;
    wire z1, z0,pSout0,pSout1;
    csm51a_proj3 p1(x1, x0, clock, clear, z1,z0,pSout0, pSout1);
    
    initial begin
        clock = 0;
        clear = 0;
        #15 clear = 1; x1=0;x0=0;
        #20 clear = 0;
        #10 x1=0;x0=1;
    end
    
    always begin
        #10 clock = ~clock;
    end
endmodule
