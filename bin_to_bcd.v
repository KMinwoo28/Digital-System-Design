module bin_to_bcd(binary, OutHour);		

input [5:0] binary;
output reg [7:0] OutHour;

always @(binary)
	begin
		if (binary >=10 & binary<=19)
			begin
				OutHour <= binary + 4'b0110;
			end
		
		else if (binary >=20 & binary <=29)
			begin
				OutHour <= binary + 4'b1100;
			end
		else if (binary >=30 & binary <=39)
			begin
				OutHour <= binary + 5'b10010;
			end
		else
			begin
				OutHour <= binary;
			end
	end

endmodule
