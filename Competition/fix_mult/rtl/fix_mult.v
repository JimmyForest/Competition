`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:14 08/24/2011 
// Design Name: 
// Module Name:    q15_mult 
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
module fix_mult
#(parameter Q = 8,
  parameter N = 16)
(
    input	wire	[N - 1 : 0]	a,
    input	wire	[N - 1 : 0]	b,

    output 	wire	[N - 1 : 0] 	c
);
	 
wire	[2 * N - 1 : 0]	a_ext;
wire	[2 * N - 1 : 0]	b_ext;
wire	[2 * N - 1 : 0]	r_ext;

reg	[2 * N - 1 : 0] 	a_mult;
reg	[2 * N - 1 : 0] 	b_mult;
reg	[2 * N - 1 : 0] 	result;
reg	[N - 1 : 0] 		retVal;

//Parameterized values


qtwosComp #(Q,N) comp_a (a[14 : 0], a_ext);

qtwosComp #(Q,N) comp_b (b[14 : 0], b_ext);

qtwosComp #(Q,N) comp_r (result[N - 2 + Q : Q], r_ext);

assign c = retVal;

always@(a_ext, b_ext)
	begin
		if(a[N - 1] == 1)
			a_mult <= a_ext;
		else
			a_mult <= a;
			
		if(b[N - 1] == 1)
			b_mult <= b_ext;
		else
			b_mult <= b;		
	end

always@(a_mult, b_mult)
	result <= a_mult * b_mult;


always@(result, r_ext)	
	//sign
	if((a[N - 1] == 1 && b[N - 1] == 0) || (a[N - 1] == 0 && b[N - 1] == 1)) 
		begin
			retVal[N - 1] <= 1;
			retVal[N - 2 : 0] <= r_ext[N - 2 : 0];
		end
	else 
		begin
			retVal[N - 1] <= 0;
			retVal[N - 2 : 0] <= result[N - 2 + Q : Q];
		end

endmodule