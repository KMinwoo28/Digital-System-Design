module Car_Signal(CLK_1Hz, Count_out, Signal_Pos, light_out_time, led_cnt );		// made by Dong
input CLK_1Hz;
input [4:0] Count_out;
input [1:0] Signal_Pos;
input light_out_time;
output reg [11:0] led_cnt;
always @ (CLK_1Hz or Count_out or Signal_Pos or light_out_time)
	begin
		if(light_out_time)
			begin
				led_cnt[0] <= 0;
				led_cnt[1] <= CLK_1Hz;
				led_cnt[2] <= 0;
				led_cnt[3] <= 0;
				led_cnt[4] <= CLK_1Hz;
				led_cnt[5] <= 0;
				led_cnt[6] <= 0;
				led_cnt[7] <= CLK_1Hz;
				led_cnt[8] <= 0;
				led_cnt[9] <= 0;
				led_cnt[10] <= CLK_1Hz;
				led_cnt[11] <= 0;
			end
		else
			begin
				case(Signal_Pos) 
					2'b00:
						if(Count_out > 3)
							begin
								led_cnt <= 12'b001_100_100_100;
							end
						else														//if(Count_out <= 2)
							begin
								led_cnt <= 12'b010_100_100_100;
							end
					2'b01:
						if(Count_out > 3)
							begin
								led_cnt <= 12'b100_001_100_100;
							end
						else														//if(Count_out <= 2)
							begin
								led_cnt <= 12'b100_010_100_100;
							end
					2'b10:
						if(Count_out > 3)
							begin
								led_cnt <= 12'b100_100_001_100;
							end
						else														//if(Count_out <= 2)
							begin
								led_cnt <= 12'b100_100_010_100;
							end
					2'b11:															//if(Signal_Pos == 3)
						if(Count_out > 3)
							begin
								led_cnt <= 12'b100_100_100_001;
							end
						else														//if(Count_out <= 2)
							begin
								led_cnt <= 12'b100_100_100_010;
							end
					endcase
			end
		end
	endmodule
					
				