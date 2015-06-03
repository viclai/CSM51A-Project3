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
    
    /*parameter[1:0] init = 2'b00;
    parameter[1:0] fiveC = 2'b01;
    parameter[1:0] tenC = 2'b11;
    parameter[1:0] fifteenC = 2'b10;
    
    parameter[1:0] EMPTY = 2'b00;
    parameter[1:0] NICKEL = 2'b01;
    parameter[1:0] DIME = 2'b11;*/
    
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
    assign jk1_in[0] = x0 & (x1 | ~pS[0]);
    assign z0 = pS[1] & ~pS[0] & x1;
    assign z1 = x0 & pS[1] & (~pS[0] | x1);
    
        assign pSout0 = pS[0];
        assign pSout1 = pS[1];
    
    /*always @(posedge clear or posedge clock)
    begin
        case (pS)
            init: begin
                case ({x1,x0})
                    EMPTY: 
                endcase
            end
        endcase
        
    end*/
    
endmodule

