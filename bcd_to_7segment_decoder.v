module bcd_to_7segment_decoder(bcd_in, leading_zero, display_to_7seg);
input [3:0] bcd_in;
input leading_zero;
output reg [7:0] display_to_7seg;

parameter LIGHT_OUT = 7'b111_1111;
parameter ZERO = 7'b100_0000;
parameter ONE = 7'b111_1001;
parameter TWO = 7'b010_0100;
parameter THREE = 7'b011_0000;
parameter FOUR = 7'b001_1001;
parameter FIVE = 7'b001_0010;
parameter SIX = 7'b000_0010;
parameter SEVEN = 7'b101_1000;
parameter EIGHT = 7'b000_0000;
parameter NINE = 7'b001_0000;

always @(bcd_in, leading_zero)
 begin
	if(!leading_zero)	// for 1's segment
		begin
			case (bcd_in)
			0: display_to_7seg = ZERO;
			1: display_to_7seg = ONE;
			2: display_to_7seg = TWO;
			3: display_to_7seg = THREE;
			4: display_to_7seg = FOUR;
			5: display_to_7seg = FIVE;
			6: display_to_7seg = SIX;
			7: display_to_7seg = SEVEN;
			8: display_to_7seg = EIGHT;
			9: display_to_7seg = NINE;
			default : display_to_7seg = LIGHT_OUT;
			endcase
		end
	else					// for 2's segment
		begin
			case (bcd_in)
			0: display_to_7seg = LIGHT_OUT;
			1: display_to_7seg = ONE;
			2: display_to_7seg = TWO;
			3: display_to_7seg = THREE;
			4: display_to_7seg = FOUR;
			5: display_to_7seg = FIVE;
			6: display_to_7seg = SIX;
			7: display_to_7seg = SEVEN;
			8: display_to_7seg = EIGHT;
			9: display_to_7seg = NINE;
			default : display_to_7seg = LIGHT_OUT;
			endcase
		end
 end
endmodule
