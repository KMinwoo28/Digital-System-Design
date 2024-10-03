module Traffic_simulation(CLK_50MHz, SW, key, 
								  Car_led, Ped_led, em_led, Ped_warn, Car_warn, ped_buz,car_buz, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

input CLK_50MHz;
input [17:0] SW;

input [3:0] key;
output [11:0] Car_led;
output [3:0] Ped_led;
output em_led;
output [3:0] Ped_warn;
output [3:0] Car_warn;
output ped_buz;
output car_buz;
output [6:0] HEX7;
output [6:0] HEX6;
output [6:0] HEX5;
output [6:0] HEX4;
output [6:0] HEX3;
output [6:0] HEX2;
output [6:0] HEX1; 
output [6:0] HEX0;


// 1Hz
parameter MOD = 25000000;
parameter BITS = $clog2(MOD);
// 4Hz
parameter MOD_4Hz = 6250000;
parameter BITS_4Hz = $clog2(MOD_4Hz);


// 1/60Hz. Actually made to speed up for 60 times.(1 minute in board is actually 1 second.) It is used for hh_mm_Digital_Clock.
parameter min_MOD = 25000000; //1500000000;
parameter min_BITS = $clog2(min_MOD);
// fast_min_MOD will be used for debuging. Makes time much faster. 90Hz. Controlled by SW[0].
parameter fast_min_MOD = 277777;
parameter fast_min_BITS = $clog2(fast_min_MOD);

// 0.5Hz. for random_counter.
parameter MOD_half = 100000000;
parameter BITS_half = $clog2(MOD_half); 

wire CLK_1Hz, CLK_4Hz;

wire CLK_min_freq1, CLK_min_freq2; 	// 1 is slower min_clk, 2 is faster min_clk.
wire CLK_digital_clock;	// choose one from above.

// Indicates Traffic signal time.
wire [4:0] Count_out;

// for random_counter.
wire CLK_half_Hz;					// 0.5Hz but duty cycle is not 50%.

wire [1:0] Signal_Pos;
wire [1:0] selected_Signal_Pos;

wire [4:0] Ped_signal_time;
wire [7:0] bin_Ped_signal_time;

wire light_out_time;

wire [1:0] leading_zero;	

wire [3:0] ped_buz_position;
wire [3:0] car_buz_position;

wire [5:0] velocity;
wire [5:0] Out_velocity;
wire [7:0] bin_velocity;
wire [3:0] vel_visibility;
wire velocity_visiblity;

wire [1:0] Em_Signal_Pos;
wire Pos_select;
wire Hold;
parameter reset = 0; // Does nothing.
wire selected_hold;

// make 1Hz with using counter and d-flipflop.
Hertz_maker #(MOD, BITS) r1(CLK_50MHz, reset, CLK_1Hz);
// make 4Hz
Hertz_maker #(MOD_4Hz, BITS_4Hz) r2(CLK_50MHz, reset, CLK_4Hz);

// make 1/60Hz and 30Hz.
Hertz_maker #(min_MOD,min_BITS) r4(CLK_50MHz, reset, CLK_min_freq1);
Hertz_maker #(fast_min_MOD,fast_min_BITS) r5(CLK_50MHz, reset, CLK_min_freq2);

// And Choose one. Switch 0 will make a choice.
assign CLK_digital_clock = SW[0] ? CLK_min_freq2 : CLK_min_freq1;
// Input CLK_digital_clock into following module.
hh_mm_Digital_Clock h1(reset, CLK_digital_clock, light_out_time, HEX0, HEX1, HEX2, HEX3);

// make 0.5Hz, but not using d-flipflop.
counter #(MOD_half,BITS_half) r6(.clk(CLK_50MHz), .rst(reset), .carry_out(CLK_half_Hz));
Random_counter rc1(CLK_half_Hz, CLK_50MHz,reset, velocity);
// velocity will have value between 20~35.

// print velocity.
bin_to_bcd b1(Out_velocity, bin_velocity);
bcd_to_7segment_decoder b2(bin_velocity[7:4], 1'b1, HEX7);
bcd_to_7segment_decoder b3(bin_velocity[3:0], 1'b0, HEX6);


Emergency_situation Es(CLK_4Hz, {SW[5], SW[9], SW[13], SW[17]}, Em_Signal_Pos, Pos_select, Hold, em_led);
assign selected_Signal_Pos = Pos_select ? Em_Signal_Pos : Signal_Pos;
assign selected_hold = Pos_select ? Hold : reset;


// make traffic signal time(One cycle = 26 seconds.) and Signal Position.
Downcounter d5(CLK_1Hz, selected_hold , light_out_time, Count_out, Signal_Pos);

// make pedestrian signal time. Affected by Count_out & light_out_time.
Ped_Signal_downcounter p1(Count_out, Ped_signal_time, light_out_time, leading_zero);


// Prints pedestrian's passable time.
bin_to_bcd b4({1'b0,Ped_signal_time}, bin_Ped_signal_time);
bcd_to_7segment_decoder b5(bin_Ped_signal_time[7:4], leading_zero[1], HEX5);
bcd_to_7segment_decoder b6(bin_Ped_signal_time[3:0], leading_zero[0], HEX4);						


Car_Signal c1(CLK_1Hz, Count_out, selected_Signal_Pos , light_out_time, Car_led);
Ped_Signal p2(~CLK_1Hz, Ped_signal_time, selected_Signal_Pos, light_out_time, Ped_led);


Ped_Warning4 pw1(Count_out, CLK_4Hz, key[0],light_out_time,selected_Signal_Pos,Ped_warn[0],ped_buz_position[0]);
Ped_Warning3 pw2(Count_out, CLK_4Hz, key[1],light_out_time,selected_Signal_Pos,Ped_warn[1],ped_buz_position[1]);
Ped_Warning2 pw3(Count_out, CLK_4Hz, key[2],light_out_time,selected_Signal_Pos,Ped_warn[2],ped_buz_position[2]);
Ped_Warning1 pw4(Count_out, CLK_4Hz, key[3],light_out_time,selected_Signal_Pos,Ped_warn[3],ped_buz_position[3]);
assign ped_buz = selected_Signal_Pos[1] ? (selected_Signal_Pos[0] ? ped_buz_position[0] : ped_buz_position[1]) : (selected_Signal_Pos[0] ? ped_buz_position[2] : ped_buz_position[3]);

Car_simulation1 Cs1(SW[15], selected_Signal_Pos, velocity, CLK_4Hz, light_out_time, vel_visibility[0], car_buz_position[0], Car_warn[0]);
Car_simulation2 Cs2(SW[11], selected_Signal_Pos, velocity, CLK_4Hz, light_out_time, vel_visibility[1], car_buz_position[1], Car_warn[1]);
Car_simulation3 Cs3(SW[7], selected_Signal_Pos, velocity, CLK_4Hz, light_out_time, vel_visibility[2], car_buz_position[2], Car_warn[2]);
Car_simulation4 Cs4(SW[3], selected_Signal_Pos, velocity, CLK_4Hz, light_out_time, vel_visibility[3], car_buz_position[3], Car_warn[3]);							
assign car_buz = selected_Signal_Pos[1] ? (selected_Signal_Pos[0] ? car_buz_position[3] : car_buz_position[2]) : (selected_Signal_Pos[0] ? car_buz_position[1] : car_buz_position[0]);
assign velocity_visiblity = selected_Signal_Pos[1] ? (selected_Signal_Pos[0] ? vel_visibility[3] : vel_visibility[2]) : (selected_Signal_Pos[0] ? vel_visibility[1] : vel_visibility[0]);
assign Out_velocity = velocity_visiblity ? velocity : 1'b0;

endmodule







