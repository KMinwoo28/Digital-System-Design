  module Ped_Warning1(Count_out, signal,human,light_out_time,signal_Pos,Ped_warn,buz);			// made by Dong
   input [4:0]Count_out;
   input signal;
   input human;
   input light_out_time;
   input [1:0]signal_Pos;
   output reg Ped_warn;
   output reg buz;
   always@(human or signal_Pos or light_out_time or Count_out or signal)
      begin
         if(light_out_time == 1)
            begin
               Ped_warn <= 0;
               buz <= 0;
            end
         else
            begin
               if(human == 1)
                  begin
                Ped_warn <= 0;
                buz <= 0;
                  end
               else 
                  begin
                     if(signal_Pos == 0)
                        begin
                           if(Count_out<9 && Count_out >3)
                              begin
                                 buz <= 1;
                                 Ped_warn <= 0;
                              end
                           else if (Count_out <3)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
									else	
										begin
											buz <= 0;
                                 Ped_warn <= 0;
										end
                        end
                     else if(signal_Pos == 1)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end

                     else if(signal_Pos == 2)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end                                       
                        
                     else //if(signal_Pos == 3)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end
                  end
            end
      end
endmodule

 module Ped_Warning2(Count_out,signal,human,light_out_time,signal_Pos,Ped_warn,buz);			// made by Dong
   input [4:0]Count_out;
   input signal;
   input human;
   input light_out_time;
   input [1:0]signal_Pos;
   output reg Ped_warn;
   output reg buz;
   always@(human or signal_Pos or light_out_time or Count_out or signal)
      begin
         if(light_out_time == 1)
            begin
               Ped_warn <= 0;
               buz <= 0;
            end
         else
            begin
               if(human == 1)
                  begin
                Ped_warn <= 0;
                buz <= 0;
                  end
               else 
                  begin
                     if(signal_Pos == 0)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end
                     else if(signal_Pos == 1)
                        begin
                           if(Count_out<9 && Count_out >3)
                              begin
                                 buz <= 1;
                                 Ped_warn <= 0;
                              end
                           else if (Count_out <3)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
									else	
										begin
											buz <= 0;
                                 Ped_warn <= 0;
										end
                        end

                     else if(signal_Pos == 2)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end                                       
                        
                     else //if(signal_Pos == 3)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end
                  end
            end
      end
endmodule

 module Ped_Warning3(Count_out,signal,human,light_out_time,signal_Pos,Ped_warn,buz);			// made by Dong
   input [4:0]Count_out;
   input signal;
   input human;
   input light_out_time;
   input [1:0]signal_Pos;
   output reg Ped_warn;
   output reg buz;
   always@(human or signal_Pos or light_out_time or Count_out or signal)
      begin
         if(light_out_time == 1)
            begin
               Ped_warn <= 0;
               buz <= 0;
            end
         else
            begin
               if(human == 1)
                  begin
                Ped_warn <= 0;
                buz <= 0;
                  end
               else 
                  begin
                     if(signal_Pos == 0)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end
                     else if(signal_Pos == 1)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end

                     else if(signal_Pos == 2)
                        begin
                         if(Count_out<9 && Count_out >3)
                              begin
                                 buz <= 1;
                                 Ped_warn <= 0;
                              end
                           else if (Count_out <3)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
									else	
										begin
											buz <= 0;
                                 Ped_warn <= 0;
										end
                        end                                       
                        
                     else //if(signal_Pos == 3)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end
                  end
            end
      end
endmodule

 module Ped_Warning4(Count_out,signal,human,light_out_time,signal_Pos,Ped_warn,buz);			// made by Dong
   input [4:0]Count_out;
   input signal;
   input human;
   input light_out_time;
   input [1:0]signal_Pos;
   output reg Ped_warn;
   output reg buz;
   always@(human or signal_Pos or light_out_time or Count_out or signal)
      begin
         if(light_out_time == 1)
            begin
               Ped_warn <= 0;
               buz <= 0;
            end
         else
            begin
               if(human == 1)
                  begin
                Ped_warn <= 0;
                buz <= 0;
                  end
               else 
                  begin
                     if(signal_Pos == 0)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end
                     else if(signal_Pos == 1)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end

                     else if(signal_Pos == 2)
                        begin
                           if(Count_out<9)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                           else
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
                        end                                       
                        
                     else //if(signal_Pos == 3)
                        begin
                          if(Count_out<9 && Count_out >3)
                              begin
                                 buz <= 1;
                                 Ped_warn <= 0;
                              end
                           else if (Count_out <3)
                              begin
                                 buz <= 0;
                                 Ped_warn <= signal;
                              end
									else	
										begin
											buz <= 0;
                                 Ped_warn <= 0;
										end
                        end
                  end
            end
      end
endmodule


