`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:20 08/24/2011 
// Design Name: 
// Module Name:    twosComp 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module qtwosComp
#(parameter Q = 8
  parameter N = 16)
(
    input	wire	[N - 2 : 0]		a,
    output 	wire	[2 * N - 1 : 0]	b
);

reg	[2 * N - 1 : 0]	data	;
reg	[2 * N - 1 : 0]	flip	;
reg	[2 * N - 1 : 0]	out		;
	
//Parameterized values

	
assign b = out;

always@(a)
	data <= a;//if you dont put the value into a 32b register, when you flip the bits it wont work right


always@(data)
	flip <= ~a;


always@(flip)
	out <= flip + 1;


endmodule
