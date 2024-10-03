module Ped_Signal(CLK_1Hz, Ped_signal_time, Signal_pos, Light_out_time, Led_cnt);				//made by Wang
input CLK_1Hz;
input [4:0]Ped_signal_time;
input [1:0]Signal_pos;
input Light_out_time;
output reg[3:0]Led_cnt;

always @ (CLK_1Hz or Ped_signal_time or Signal_pos or Light_out_time or Led_cnt)
   begin 
      if(Light_out_time == 1)
         begin
            Led_cnt <= 0;
         end
      else   
         begin
            case(Signal_pos)
               2'b00:
                  if(Ped_signal_time > 13)
                     begin 
                        Led_cnt <= 4'b1000;
                     end
                  else if(Ped_signal_time>0 & Ped_signal_time <=13)
                     begin
                        Led_cnt[3] <= CLK_1Hz;
                        Led_cnt[2:0] <= 3'b000;
                     end
						else
							begin
								Led_cnt <= 0;
							end
               2'b01:
                  if(Ped_signal_time > 13)
                     begin 
                        Led_cnt <= 4'b0100;
                     end
                  else if(Ped_signal_time>0 & Ped_signal_time <=13)
                     begin
                        Led_cnt[2] <= CLK_1Hz;
                        Led_cnt[1:0] <= 2'b00;
                        Led_cnt[3] <= 0;
                     end
						else
							begin
								Led_cnt <= 0;
							end
               2'b10:
                  if(Ped_signal_time > 13)
                     begin 
                        Led_cnt <= 4'b0010;
                     end
                  else if(Ped_signal_time>0 & Ped_signal_time <=13)
                     begin
                        Led_cnt[1] <= CLK_1Hz;
                        Led_cnt[3:2] <= 2'b00;
                        Led_cnt[0] <= 0;
                     end
						else
							begin
								Led_cnt <= 0;
							end
               2'b11:
                  if(Ped_signal_time > 13)
                     begin 
                        Led_cnt <= 4'b0001;
                     end
                  else if(Ped_signal_time>0 & Ped_signal_time <=13)
                     begin
                        Led_cnt[0] <= CLK_1Hz;
                        Led_cnt[3:1] <= 3'b000;
                     end
						else
							begin
								Led_cnt <= 0;
							end
               endcase
            end
         end
      endmodule
