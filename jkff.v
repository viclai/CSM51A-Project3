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
    reg data_reg;
    //reg data_out;
    //reg out;
    //wire out;
    
    //assign data_out = data_reg[1];
    assign data_out = data_reg;
    //assign data_out = out;
    
    always @(posedge clear or posedge clock)
    begin
        if (clear == 1) begin
            data_reg <= 1'b0;
            //data_out <= 1'b0;
            end
        else
            begin
            //data_out <= data_reg;
                //out = data_reg[0];
                //data_out <= data_reg;
                if (data_reg == 0)
                    begin
                        if (data_in[1] == 1)
                        begin
                            //data_reg[1] = data_reg[0];
                            //data_out <= 0;
                            //out = 0;
                            data_reg <= 1;
                        end
                    end
                else
                    begin
                        if (data_in[0] == 1) begin
                            //data_reg[1] = data_reg[0];
                            //data_out <= 1;
                            //out = 1;
                            data_reg <= 0;
                            end
                    end
            end 
    end

endmodule
