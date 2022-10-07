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
// Generated on "10/05/2022 21:08:41"
                                                                                
// Verilog Test Bench template for design : fix_adder
// 
// Simulation tool : ModelSim (Verilog)
// 

`timescale 1 ps/ 1 ps
module fix_adder_tb
#(parameter Q = 8,
  parameter N = 16)
();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg [N - 1:0] a;
reg [N - 1:0] b;
// wires                                               
wire [N - 1:0] c;

// assign statements (if any)                          
fix_adder i1 (
// port map - connection between master ports and signals/registers   
	.a(a),
	.b(b),
	.c(c)
);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
#10	a = 16'd0;
		b = 16'd0;
#10	a = 16'b00000011_01001100;
#10	b = 16'b00000100_00110011;		
// --> end                                             
$display("Running testbench");                       
end                                                    
always                                                 
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
begin                                                  
// code executes for every event on sensitivity list   
// insert code here --> begin                          
                                                       
@eachvec;                                              
// --> end                                             
end                                                    
endmodule

