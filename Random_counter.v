module Random_counter(clk_half_Hz,CLK_50MHz,reset, velocity);										// designed by Min & Wang

input clk_half_Hz;
input CLK_50MHz;
input reset;
reg [3:0] random_number;
output [5:0] velocity;

// Making fast Hz 4 times.
parameter MOD_fast0 = 3;
parameter BITS_fast0 = $clog2(MOD_fast0);

parameter MOD_fast1 = 5;
parameter BITS_fast1 = $clog2(MOD_fast1);

parameter MOD_fast2 = 7;
parameter BITS_fast2 = $clog2(MOD_fast2);

parameter MOD_fast3 = 11;
parameter BITS_fast3 = $clog2(MOD_fast3);

// 7Hz
parameter MOD = 3571428;
parameter BITS = $clog2(MOD);

wire fast_Hz0, fast_Hz1, fast_Hz2, fast_Hz3;
wire Hz_for_counter;
wire [1:0] Hz_3counter;

reg selected_fast_Hz;
wire [3:0] Fast_Count_out;

Hertz_maker #(MOD, BITS) c1(CLK_50MHz, reset, Hz_for_counter);
counter #(4,2) c2(.clk(Hz_for_counter), .rst(reset), .count_out(Hz_3counter));

Hertz_maker #(MOD_fast0, BITS_fast0) r0(CLK_50MHz, reset, fast_Hz0);												
Hertz_maker #(MOD_fast1, BITS_fast1) r1(CLK_50MHz, reset, fast_Hz1);															
Hertz_maker #(MOD_fast2, BITS_fast2) r2(CLK_50MHz, reset, fast_Hz2);												
Hertz_maker #(MOD_fast3, BITS_fast3) r3(CLK_50MHz, reset, fast_Hz3);												

always @ (Hz_3counter,fast_Hz0, fast_Hz1, fast_Hz2, fast_Hz3)
	begin
		case(Hz_3counter)
			0: selected_fast_Hz <= fast_Hz0;
			1: selected_fast_Hz <= fast_Hz1;
			2: selected_fast_Hz <= fast_Hz2;
			3: selected_fast_Hz <= fast_Hz3;
		endcase
end


// counts 0 to 15 really fast.
counter #(16,4)r9(.clk(selected_fast_Hz), .rst(reset), .count_out(Fast_Count_out));

always @ (posedge clk_half_Hz)
   begin
       if(clk_half_Hz)
          begin
             random_number <= Fast_Count_out;
          end
       else
          begin
             
          end   
   end
	
assign velocity = random_number +  5'b10100; 
	
	
endmodule
