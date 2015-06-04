`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////
// Company: UCLA Henry Samueli School of Engineering and Applied Science
// Engineers: Victor Lai and Dennis Gahm
// Student IDs: 404274720 and 704016107
// 
// Create Date: 05/27/2015 08:31:53 PM
// Design Name: 
// Module Name: csm51a_proj3
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


module csm51a_proj3(x1, x0, clock, clear, z1,z0,pSout0, pSout1);
    input x1,x0,clock,clear;
    output z1,z0,pSout0, pSout1;
    //output pSout0, pSout1;    
    reg z1;
    reg z0;
	
    wire[1:0] pS;
    wire[1:0] jk0_in;
    //reg jk00_in;
    wire[1:0] jk1_in;
    jkff jk0(pS[0], jk0_in, clock, clear);
    jkff jk1(pS[1], jk1_in, clock, clear);
    
    //combinational logic
    assign jk0_in[1] = x0 & ~pS[1];
    assign jk0_in[0] = x0 & (pS[1] | x1);
    //assign jk0_in2 = {x0 & ~pS[1], x0 & (pS[1] | x1)};
    assign jk1_in[1] = x0 & (pS[0] | x1);
    //assign jk1_in[1] = x1;
    assign jk1_in[0] = x0 & (x1 | ~pS[0]);
    //assign z0 = pS[1] & ~pS[0] & x1;
    //assign z1 = x0 & pS[1] & (~pS[0] | x1);
    always @(posedge clock)
    begin
        if (clear != 1) begin
            z0 = pS[1] & ~pS[0] & x1;
            z1 = x0 & pS[1] & (~pS[0] | x1);
        end
    end
    always @(clear) begin
        if (clear == 1 & (pS[0] == 0 | pS[0] == 1)) begin
            z0=1;z1=0;
        end
    end
    
    assign pSout0 = pS[0];
    assign pSout1 = pS[1];
endmodule

