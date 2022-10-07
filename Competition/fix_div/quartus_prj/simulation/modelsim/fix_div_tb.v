// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "10/06/2022 10:08:55"
                                                                                
// Verilog Test Bench template for design : fix_div
// 
// Simulation tool : ModelSim (Verilog)
// 

`timescale 1 ps/ 1 ps
module fix_div_tb
#(parameter Q = 8,
  parameter N = 16)
();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg clk;
reg [N - 1:0] dividend;
reg [N - 1:0] divisor;
reg start;
// wires                                               
wire complete;
wire [N - 1:0]  quotient_out;

// assign statements (if any)                          
fix_div i1 (
// port map - connection between master ports and signals/registers   
	.clk(clk),
	.complete(complete),
	.dividend(dividend),
	.divisor(divisor),
	.quotient_out(quotient_out),
	.start(start)
);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
clk = 1'b0;
dividend = 16'd0;
divisor = 16'd0;
start = 1'b0;

#10	start = 1'b1;
#10	dividend = 16'b00001000_00000000;//8
		divisor = 16'b00000100_00000000;//4
                                                        
// --> end                                             
$display("Running testbench");                       
end                                                    
always                                                 
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin                          
#10 clk = ~ clk;                                            
// --> end                                             
end                                                    
endmodule

