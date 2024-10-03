module counter(clk, rst, count_out, carry_out);								// total logic elements : 5(4 bits), 7(5 bits)
parameter Mod = 24;
parameter BITS = 5;

input clk, rst;
output reg[BITS-1:0] count_out;
output reg carry_out;

always @(posedge clk, posedge rst)
 begin
	if(rst)
		begin
			count_out <=0;
			carry_out <=0;
		end
	else if(count_out<Mod- 1)
		begin
			count_out <= count_out + 1'b1;
			carry_out <=0;
		end
	else
		begin
			count_out <=0;
			carry_out <=1;
		end
	end
endmodule