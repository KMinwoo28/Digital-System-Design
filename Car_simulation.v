module Car_simulation1(Switch, Signal_Pos, In_velocity, CLK_4Hz, light_out_time, 
								vel_visibility, buz_position, Warn_led);		// designed by Min

input Switch, light_out_time, CLK_4Hz;
input [1:0] Signal_Pos;
input [5:0] In_velocity;
output reg vel_visibility;
output reg buz_position, Warn_led;
// buz_position is signal for overspeed car, Warn_led is signal for car that runs on red light.
// These will be flickering with 4Hz frequency.

always @ (Switch, light_out_time, Signal_Pos, In_velocity, CLK_4Hz)
	begin
		if(light_out_time==0)
			begin
				if(Signal_Pos == 0)
					begin
						if(Switch)
							begin
								vel_visibility <=1;
							if(In_velocity>=31)
								begin
									buz_position <= CLK_4Hz;
									Warn_led <=0;
								end
							else
								begin
									buz_position <= 0;
									Warn_led <=0;
								end
							end
						else	//switch = 0
							begin
								vel_visibility <= 0;
								buz_position <=0;
								Warn_led <=0;
							end
					end
				else //signal_Pos is not 0.
					begin
						vel_visibility <= 0;
						buz_position <=0;
						
						if(Switch)
							begin
								Warn_led <= CLK_4Hz;
							end
						else	//switch = 0
							begin
								Warn_led <= 0;
							end
				end
			end
			else		// light_out_time  = 1.
				begin
					Warn_led <= 0;
					vel_visibility <= 0;
					buz_position <= 0;
				end
end

			
endmodule

module Car_simulation2(Switch, Signal_Pos, In_velocity, CLK_4Hz, light_out_time, 
								vel_visibility, buz_position, Warn_led);		

input Switch, light_out_time, CLK_4Hz;
input [1:0] Signal_Pos;
input [5:0] In_velocity;
output reg vel_visibility;
output reg buz_position, Warn_led;


always @ (Switch, light_out_time, Signal_Pos, In_velocity, CLK_4Hz)
	begin
		if(light_out_time==0)
			begin
				if(Signal_Pos == 1)
					begin
						if(Switch)
							begin
								vel_visibility <=1;
							if(In_velocity>=31)
								begin
									buz_position <= CLK_4Hz;
									Warn_led <=0;
								end
							else
								begin
									buz_position <= 0;
									Warn_led <=0;
								end
							end
						else	//switch = 0
							begin
								vel_visibility <= 0;
								buz_position <=0;
								Warn_led <=0;
							end
					end
				else //signal_Pos is not 0.
					begin
						vel_visibility <= 0;
						buz_position <=0;
						
						if(Switch)
							begin
								Warn_led <= CLK_4Hz;
							end
						else	//switch = 0
							begin
								Warn_led <= 0;
							end
				end
			end
			else		// light_out_time  = 1.
				begin
					Warn_led <= 0;
					vel_visibility <= 0;
					buz_position <= 0;
				end
end

			
endmodule

module Car_simulation3(Switch, Signal_Pos, In_velocity, CLK_4Hz, light_out_time, 
								vel_visibility, buz_position, Warn_led);		

input Switch, light_out_time, CLK_4Hz;
input [1:0] Signal_Pos;
input [5:0] In_velocity;
output reg vel_visibility;
output reg buz_position, Warn_led;


always @ (Switch, light_out_time, Signal_Pos, In_velocity, CLK_4Hz)
	begin
		if(light_out_time==0)
			begin
				if(Signal_Pos == 2)
					begin
						if(Switch)
							begin
								vel_visibility <=1;
							if(In_velocity>=31)
								begin
									buz_position <= CLK_4Hz;
									Warn_led <=0;
								end
							else
								begin
									buz_position <= 0;
									Warn_led <=0;
								end
							end
						else	//switch = 0
							begin
								vel_visibility <= 0;
								buz_position <=0;
								Warn_led <=0;
							end
					end
				else //signal_Pos is not 0.
					begin
						vel_visibility <= 0;
						buz_position <=0;
						
						if(Switch)
							begin
								Warn_led <= CLK_4Hz;
							end
						else	//switch = 0
							begin
								Warn_led <= 0;
							end
				end
			end
			else		// light_out_time  = 1.
				begin
					Warn_led <= 0;
					vel_visibility <= 0;
					buz_position <= 0;
				end
end

			
endmodule

module Car_simulation4(Switch, Signal_Pos, In_velocity, CLK_4Hz, light_out_time, 
								vel_visibility, buz_position, Warn_led);		

input Switch, light_out_time, CLK_4Hz;
input [1:0] Signal_Pos;
input [5:0] In_velocity;
output reg vel_visibility;
output reg buz_position, Warn_led;


always @ (Switch, light_out_time, Signal_Pos, In_velocity, CLK_4Hz)
	begin
		if(light_out_time==0)
			begin
				if(Signal_Pos == 3)
					begin
						if(Switch)
							begin
								vel_visibility <=1;
							if(In_velocity>=31)
								begin
									buz_position <= CLK_4Hz;
									Warn_led <=0;
								end
							else
								begin
									buz_position <= 0;
									Warn_led <=0;
								end
							end
						else	//switch = 0
							begin
								vel_visibility <= 0;
								buz_position <=0;
								Warn_led <=0;
							end
					end
				else //signal_Pos is not 0.
					begin
						vel_visibility <= 0;
						buz_position <=0;
						
						if(Switch)
							begin
								Warn_led <= CLK_4Hz;
							end
						else	//switch = 0
							begin
								Warn_led <= 0;
							end
				end
			end
			else		// light_out_time  = 1.
				begin
					Warn_led <= 0;
					vel_visibility <= 0;
					buz_position <= 0;
				end
end

			
endmodule
