module Ped_Signal_downcounter(count_out, ped_signal_time, light_out_time, leading_zero);				// made by Min

input [4:0] count_out;
input light_out_time;
output reg [4:0] ped_signal_time;
output reg [1:0] leading_zero;

always @ (count_out or light_out_time)
	begin
		if(light_out_time ==1)
			begin
				ped_signal_time <= 0;
				leading_zero <= 2'b11;
			end
		else
			begin
				if(count_out < 27 & count_out>3)
					begin
						ped_signal_time <= count_out - 2'b11;
						leading_zero <= 2'b10;
					end
				else
					begin
						ped_signal_time <= 0;
						leading_zero <= 2'b11;
					end	

			end
	end
endmodule



