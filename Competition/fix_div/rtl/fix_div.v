`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:14 08/24/2011 
// Design Name: 
// Module Name:    divider 
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
 
module fix_div
#(parameter Q = 8,
  parameter N = 16)

(
	input		wire	[N - 1 : 0] dividend		,
	input		wire	[N - 1 : 0] divisor		,
	input		wire					start			,
	input		wire					clk			,
	
	output 	wire	[N - 1 : 0] quotient_out,
	output 	wire					complete
);
 
reg [N - 1 : 0] 					quotient			;
reg [N - 1 : 0] 					dividend_copy	;
reg [2 * (N - 1) - 1 : 0] 		divider_copy	;

reg [5 : 0] bit	; 
reg 			done	;

initial done = 1;

assign quotient_out = quotient;
assign complete = done;

always@(posedge clk) 
	if(done && start) 
		begin

			done <= 1'b0;
			bit <= N+Q-2;
			quotient <= 0;
			dividend_copy <= {1'b0, dividend[N - 2 : 0]};
	
			divider_copy[2 * (N - 1) - 1] <= 0;
			divider_copy[2 * (N - 1) - 2 : N - 2] <= divisor[N-2:0];
			divider_copy[N - 3 : 0] <= 0;
	
			//set sign bit
			if((dividend[N - 1] == 1 && divisor[N - 1] == 0) || (dividend[N - 1] == 0 && divisor[N - 1] == 1))
				quotient[N - 1] <= 1;
			else
				quotient[N - 1] <= 0;
		end 
		
	else if(!done) 
		begin
			//compare divisor/dividend
			if(dividend_copy >= divider_copy) 
				begin
					//subtract
					dividend_copy <= dividend_copy - divider_copy;
					//set quotient
					quotient[bit] <= 1'b1;
				end
	
			//reduce divisor
			divider_copy <= divider_copy >> 1;
	
			//stop condition
			if(bit == 0)
				done <= 1'b1;
				
			//reduce bit counter
			bit <= bit - 1;	
		end

endmodule