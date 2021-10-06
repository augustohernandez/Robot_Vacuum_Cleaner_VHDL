-- Robot Finite State Machine (MOORE)

library ieee;
use ieee.std_logic_1164.all;

entity robot_fsm is
	port(reset, clock, front_barr, back_barr, start_stop, light_zone, angle_detect: in bit:='0';
		mov, dir_mov, turn, dir_turn, alarm: out bit:='0');
end robot_fsm;

architecture circuit_behavior of robot_fsm is
	type State is (S0, S1, S2, S3, S4, S5, S6, S7);
	signal PresentState: State;
		
begin
    
  -- The process doesn't run continuously! It will be started only after change (event) on any signal in its sensitivity list:

  process(clock, reset, angle_detect)
    
    variable condition1 : boolean := FALSE;
    variable condition2 : boolean := FALSE;
    
    begin
      if (reset='1') then PresentState  <= S0; -- async reset to S0
      
    elsif (clock'event and clock='1') then 
      
        case PresentState is 
          
        -- MULTIPLE when choices, but only ONE choice will be selected!!!
        
                -- States: S0 = INIT, S1 = FORWARD, S2 = BACKWARD, S3 = TURNING_RIGHT 45 DEGREES,   S4 = TURNING_LEFT 45 DEGREES,
                -- S5 = TURNING_RIGHT 90 DEGREES, S6 = TURNING_LEFT 90 DEGREES, S7 = BLOCKED
        
                when S0 => -- describe transitions (ouput: 0/0/0/0/0)
                  if (front_barr = '0' and start_stop = '1') then 
                    PresentState <= S1; -- next state: forward
                  elsif (front_barr = '1' and start_stop = '1') then
                    PresentState <= S2; -- next state: backward
                  else PresentState <= S0; -- hold
                  end if;
                 
                    
                when S1 => -- describe transitions (ouput: 1/1/0/0/0)
                  if (front_barr = '1' and start_stop = '1') then 
                    PresentState <= S2; -- next state: backward
                  elsif (start_stop = '0') then
                    PresentState <= S0; -- next state: init
                  else PresentState <= S1; -- hold
                  end if;
                  
                  
                when S2 => -- describe transitions (ouput: 1/0/0/0/0)
                  if (front_barr = '0' and start_stop = '1' and back_barr = '0' and light_zone = '1' and angle_detect = '1') then 
                    PresentState <= S3;  -- next state: turning_right 45 degrees
                  elsif (front_barr = '0' and start_stop = '1' and back_barr = '0' and light_zone = '0' and angle_detect = '1') then
                    PresentState <= S4; -- next state: turning_left 45 degrees
                  elsif (front_barr = '1' and start_stop = '1' and back_barr = '1' and light_zone = '1' and angle_detect = '1') then 
                    PresentState <= S5;  -- next state: turning_right 90 degrees
                  elsif (front_barr = '1' and start_stop = '1' and back_barr = '1' and light_zone = '0' and angle_detect = '1') then 
                    PresentState <= S6;  -- next state: turning_left 90 degrees
                  elsif (start_stop = '0') then
                    PresentState <= S0; -- next state: init 
                  else PresentState <= S2; -- hold 
                  end if;
                   
                  
                when S3 => -- describe transitions (ouput: 0/0/1/1/0)
                  if (angle_detect'last_value = '1' and angle_detect = '0') then 
                    PresentState <= S1; -- next state: forward
                  else PresentState <= S3; -- hold
                  end if;
                    
                  
                when S4 => -- describe transitions  (ouput: 0/0/1/0/0)
                  if (angle_detect'last_value = '1' and angle_detect = '0') then 
                    PresentState <= S1; -- next state: forward
                  else PresentState <= S4; -- hold
                  end if;
                    
                  
                when S5 => -- describe transitions  (ouput: 0/0/1/1/0)
                  if (angle_detect'last_value = '1' and angle_detect = '0') then
                    condition1 := TRUE;
                  else PresentState <= S5; -- hold
                  end if;
                  
                  if (angle_detect'last_value = '0' and angle_detect = '1' and condition1) then
                    condition1 := FALSE;
                    condition2 := TRUE;
						else PresentState <= S5; -- hold  
                  end if;
                  
                  if (front_barr = '1' and start_stop = '1' and condition2) then
						  condition2 := FALSE;
                    PresentState <= S7; -- next state: blocked
                  elsif (front_barr = '0' and start_stop = '1' and condition2) then 
						  PresentState <= S1; -- next state: forward
						else PresentState <= S5; -- hold 
                  end if;
                  
                               
                when S6 => -- describe transitions  (ouput: 0/0/1/0/0)
                   if (angle_detect'last_value = '1' and angle_detect = '0') then
                    condition1 := TRUE;
                    else PresentState <= S6; -- hold
                  end if;
                  
                  if (angle_detect'last_value = '0' and angle_detect = '1' and condition1) then
                    condition1 := FALSE;
                    condition2 := TRUE;
						else PresentState <= S6; -- hold 
                  end if;
                  
                  if (front_barr = '1' and start_stop = '1' and condition2) then
                    PresentState <= S7; -- next state: blocked
                  elsif (front_barr = '0' and start_stop = '1' and condition2) then
						  PresentState <= S1; -- next state: forward
						else PresentState <= S6; -- hold 
                  end if;
                  
                when S7 => -- describe transitions  (ouput: 0/0/0/0/1)
                  if (start_stop = '0') then 
                    PresentState <= S0; -- next state: init
                  else PresentState <= S7; -- hold
                  end if;
               
            end case;           
      end if;
  end process;
  
  process(PresentState)
  begin
  case PresentState is
    when S0 => mov <= '0'; dir_mov <= '0'; turn <= '0'; dir_turn <= '0'; alarm <= '0'; -- (ouput: 0/0/0/0/0)
    when S1 => mov <= '1'; dir_mov <= '1'; turn <= '0'; dir_turn <= '0'; alarm <= '0'; -- (ouput: 1/1/0/0/0)
    when S2 => mov <= '1'; dir_mov <= '0'; turn <= '0'; dir_turn <= '0'; alarm <= '0'; -- (ouput: 1/0/0/0/0)
    when S3 => mov <= '0'; dir_mov <= '0'; turn <= '1'; dir_turn <= '1'; alarm <= '0'; -- (ouput: 0/0/1/1/0)
    when S4 => mov <= '0'; dir_mov <= '0'; turn <= '1'; dir_turn <= '0'; alarm <= '0'; -- (ouput: 0/0/1/0/0)
    when S5 => mov <= '0'; dir_mov <= '0'; turn <= '1'; dir_turn <= '1'; alarm <= '0'; -- (ouput: 0/0/1/1/0)
    when S6 => mov <= '0'; dir_mov <= '0'; turn <= '1'; dir_turn <= '0'; alarm <= '0'; -- (ouput: 0/0/1/0/0)
    when S7 => mov <= '0'; dir_mov <= '0'; turn <= '0'; dir_turn <= '0'; alarm <= '1'; -- (ouput: 0/0/0/0/1)
  end case;
  end process;

    
end circuit_behavior; 




