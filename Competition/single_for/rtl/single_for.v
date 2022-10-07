module single_for
(
	input		wire		[0:0]		sys_clk	,
	input		wire		[0:0]		sys_rst	,
	
	input		wire		[0:0]		add_en	,
	input		wire		[3:0]		num		,
	input		wire		[7:0]		data		,

	output	reg		[7:0]		sum		,
	output	wire		[0:0]		add_end
);

reg	[0:0]		add_flag	;
reg	[0:0]		add_flag1;
reg	[3:0]		cnt		;

always@(posedge sys_clk or negedge sys_rst)
	if(sys_rst == 1'b0)
		add_flag <= 1'b0;
	else if(add_en == 1'b1)
		add_flag <= 1'b1;
	else if(cnt == num)
		add_flag <= 1'b0;		
	
always@(posedge sys_clk or negedge sys_rst)
	if(sys_rst == 1'b0)
		add_flag1 <= 1'b0;
	else
		add_flag1 <= add_flag;
		
assign add_end = (~ add_flag) && add_flag1;
		
always@(posedge sys_clk or negedge sys_rst)
	if(sys_rst == 1'b0)
		cnt <= 1'b0;
	else if(add_flag == 1'b1)
		cnt <= cnt + 1'b1;
	else if(cnt == num)
		cnt <= 1'b0;
	else	
		cnt <= 1'b0;

always@(posedge sys_clk or negedge sys_rst)
	if(sys_rst == 1'b0)
		sum <= 8'd0;
	else if(add_flag == 1'b1)
		sum <= sum + data;
	else if(add_end == 1'b1)
		sum <= 8'd0;
		
endmodule
		
		
		
		
		
		