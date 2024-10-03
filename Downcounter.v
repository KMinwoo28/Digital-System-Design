module Downcounter(clk, reset, light_out_time, count_out, carry_out);								
parameter Mod = 27;
parameter BITS = 5;

input clk, reset, light_out_time;
output reg [BITS-1:0] count_out;
output reg [1:0] carry_out;

always @(posedge clk, posedge reset)			// named reset, but it actually works as hold.
 begin
	if(reset)
		begin
			count_out <= count_out;
			carry_out <= carry_out;
		end
	else if(light_out_time == 1)
		begin
			count_out <= 0;
			carry_out <= 0;
		end
	else
		begin
			if(count_out>1)
				begin
					count_out <= count_out - 1'b1;
				end
		else if(count_out == 1)
			begin
				count_out <= Mod -1'b1;
				carry_out <= carry_out + 1'b1;
			end
		else	//initializing
			begin
				count_out <= Mod - 1'b1;
				carry_out <= 2'b00;
			end
		end
	end
endmodule
