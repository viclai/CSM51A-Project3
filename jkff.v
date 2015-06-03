`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////
// Company: UCLA Henry Samueli School of Engineering and Applied Science
// Engineers: Victor Lai and Dennis Gahm
// Student IDs: 404274720 and 704016107 
// 
// Create Date: 05/28/2015 12:29:46 PM
// Design Name: 
// Module Name: jkff
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


module jkff(data_out, data_in, clock, clear);
    output data_out;
    input[1:0] data_in;
    input clock, clear;
    reg[1:0] data_reg; //[1] is output/ps, [0] is next state/stored
    
    assign data_out = data_reg[0];
    
    always @(posedge clear or posedge clock)
    begin
        if (clear == 1)
            data_reg <= 0;
        else
            begin
                //data_out <= data_reg;
                if (data_reg[0] == 0)
                    begin
                        if (data_in[1] == 1)
                        begin
                            data_reg[1] = data_reg[0];
                            data_reg[0] = 1;
                        end
                    end
                else
                    begin
                        if (data_in[0] == 1)
                            data_reg[1] = data_reg[0];
                            data_reg[0] = 0;
                    end
            end 
    end

endmodule
