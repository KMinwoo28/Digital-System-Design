module d_flip_flop_async_Reset(clk,reset,d,q);
input clk, reset, d;
output q;
reg q;

always @(posedge clk or posedge reset)
	begin
		if(reset)
			begin
				q <= 1'b0;
			end
		else
			begin
				q <= d;
			end
	end
	
endmodule