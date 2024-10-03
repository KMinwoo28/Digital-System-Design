module Emergency_situation(clk, SW, Em_Signal_Pos, Pos_select, Hold, em_led);					//designed by Min
input clk;
input [3:0] SW;
output reg [1:0] Em_Signal_Pos;
output reg Hold, Pos_select, em_led;

always @ (SW, clk)
	begin
		if(SW[0] == 1)
			begin
				if(SW[1] == 0 && SW[2] == 0 && SW[3] == 0)
					begin
						Em_Signal_Pos <= 0;
						Hold<= SW[0];
						Pos_select <= 1;
						em_led <= clk;
					end
				else
					begin
						Pos_select <= 0;
						em_led <= 0;
					end
			end
		else if (SW[1] == 1)
			begin
				if(SW[0] == 0 && SW[2] == 0 && SW[3] == 0)
					begin
						Em_Signal_Pos <= 1;
						Hold<= SW[1];
						Pos_select <= 1;
						em_led <= clk;
					end
				else
					begin
						Pos_select <= 0;
						em_led <= 0;
					end
			end
		else if (SW[2] == 1)
			begin
				if(SW[0] == 0 && SW[1] == 0 && SW[3] == 0)
					begin
						Em_Signal_Pos <= 2;
						Hold<= SW[2];
						Pos_select <= 1;
						em_led <= clk;
					end
				else
					begin
						Pos_select <= 0;
						em_led <= 0;
					end
			end
		else if (SW[3] == 1)
			begin
				if(SW[0] == 0 && SW[1] == 0 && SW[2] == 0)
					begin
						Em_Signal_Pos <= 3;
						Hold<= SW[3];
						Pos_select <= 1;
						em_led <= clk;
					end
				else
					begin
						Pos_select <= 0;
						em_led <= 0;
					end
			end
		else
			begin
				Pos_select <= 0;
				em_led <= 0;
			end
		end
	
	
	endmodule
	