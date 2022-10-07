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
// Generated on "10/05/2022 10:57:52"
                                                                                
// Verilog Test Bench template for design : single_for
// 
// Simulation tool : ModelSim (Verilog)
// 

`timescale 1 ps/ 1 ps
module single_for_tb();
// constants                                           

// test vector input registers
reg [0:0] add_en;
reg [7:0] data;
reg [3:0] num;
reg [0:0] sys_clk;
reg [0:0] sys_rst;
// wires                                               
wire [0:0]  add_end;
wire [7:0]  sum;

// assign statements (if any)                          
single_for i1 (
// port map - connection between master ports and signals/registers   
	.add_en(add_en),
	.add_end(add_end),
	.data(data),
	.num(num),
	.sum(sum),
	.sys_clk(sys_clk),
	.sys_rst(sys_rst)
);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
sys_clk = 1'b0;
sys_rst = 1'b0;
add_en = 1'b0;
data = 1'b0;
num = 1'b0;
#10	add_en = 1'b1;
		num = 4'd10;
		sys_rst = 1'b1;
#10	add_en = 1'b0;
#10	data = 8'd2;
#10	data = 8'd3;
#10	data = 8'd4;
#10	data = 8'd5;
#10	data = 8'd6;
#10	data = 8'd7;
#10	data = 8'd8;
#10	data = 8'd9;
#10	data = 8'd0;
#10	data = 8'd1;
#10	data = 8'd10;
#10	data = 8'd10;
                                                      
// --> end                                             
$display("Running testbench");                       
end                                                    
always                                                 
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin                          
#5 sys_clk = ~ sys_clk;                                           
// --> end                                             
end                                                    
endmodule

