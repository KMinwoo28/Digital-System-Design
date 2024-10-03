module hh_mm_Digital_Clock(reset, CLK_min_freq, light_out_time,seven_seg_1stMin, seven_seg_2ndMin, seven_seg_1sthour, seven_seg_2ndhour);
																						// made by Min
input CLK_min_freq, reset;										

output [6:0] seven_seg_1stMin;
output [6:0] seven_seg_2ndMin;
output [6:0] seven_seg_1sthour; 
output [6:0] seven_seg_2ndhour;
output light_out_time;             
                                                            
wire [3:0] min1st;
wire [2:0] min2nd;
wire [4:0] hour;
		
wire ten_min_CLK; 		
wire hour_CLK;	

wire [7:0] bcdMin;
wire [7:0] bcdHour;						


counter #(10, 4) r4(.clk(CLK_min_freq), .rst(reset), .count_out(min1st), .carry_out(ten_min_CLK));
counter #(6, 3) r5(.clk(ten_min_CLK), .rst(reset), .count_out(min2nd), .carry_out(hour_CLK));
counter #(24, 5) r6(.clk(hour_CLK), .rst(reset), .count_out(hour));

select_light_out s1(hour, light_out_time);


bin_to_bcd r8({1'b0,hour}, bcdHour);																			

bcd_to_7segment_decoder B3(min1st, 1'b0, seven_seg_1stMin);
bcd_to_7segment_decoder B4({1'b0, min2nd}, 1'b0, seven_seg_2ndMin);

bcd_to_7segment_decoder B5(bcdHour[3:0], 1'b0, seven_seg_1sthour);
bcd_to_7segment_decoder B6(bcdHour[7:4], 1'b1, seven_seg_2ndhour);						



endmodule


module select_light_out(hour, light_out_time);
input [4:0]hour;
output reg light_out_time;
always @ (hour)
	begin
		if(hour>4)
			begin
				light_out_time <= 0;
			end
		else
			begin
				light_out_time <= 1;
			end
	end
endmodule	


