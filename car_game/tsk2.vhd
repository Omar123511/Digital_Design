----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2022 12:54:20 PM
-- Design Name: 
-- Module Name: tsk2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tsk2 is
generic(
        inputs : integer :=4);
    Port ( CLK : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR(inputs-3 downto 0);
           btnL : in STD_LOGIC;
           btnR : in STD_LOGIC;
           Hsync: out std_logic;
           Vsync: out std_logic;
           R: out std_logic_vector(inputs-1 downto 0);
           G: out std_logic_vector(inputs-1 downto 0);
           B: out std_logic_vector(inputs-1 downto 0)


);
end tsk2;

architecture Behavioral of tsk2 is

signal counterH: integer:= 0;
signal counterV: integer:= 0;
signal R_s: std_logic_vector(inputs-1 downto 0);
signal G_s: std_logic_vector(inputs-1 downto 0);
signal B_s: std_logic_vector(inputs-1 downto 0);
signal offsetH: integer:= 246;
signal offsetV: integer:= 0;

-------------------------------------------
signal ob1: integer:= -50;  --l1 fo2
signal ob2: integer:= -100;  --l2 fo2
signal ob3: integer:= -150;   --l3 fo2
signal ob4: integer:= -200;  --l2 ta7t
signal ob5: integer:= -230;    --l3 ta7t
signal ob6: integer:= -280;     --l1 ta7
-------------------------------------------


signal counter:integer:=0;
signal flagL:integer:=0;
signal flagR:integer:=0;
signal tmpL:std_logic:='0';
signal tmpR:std_logic:='0';

signal g_clk:std_logic;
signal g_counter:integer:=0;
signal tmp:std_logic:='0';
signal tmp2:std_logic_vector(11 downto 0);
signal tmpH:integer:=0;

signal c : integer:= 0;


signal gg:std_logic:='0';


begin
---------------------------------------------------------------------------
process (CLK, reset) 
begin 
if ( reset = '1' ) then 
g_counter <= 0;
elsif ( rising_edge (CLK)) then 
if ( g_counter = 1) then 
g_counter <= 0;
tmp <= not(tmp);
else
g_counter   <= g_counter+1;
end if;
g_clk <= tmp;
end if;
end process;  
---------------------------------------------------------------------------

---------------------------------------------------------------------------
process(g_clk, reset) is
    begin
     
        if (reset = '1') then
         counterH <= 0;
         counterV <= 0;
         offsetH <= 246;
         offsetV <= 0;
          ob1<=  -50;  --l1 fo2
          ob2<= -100;  --l2 fo2
          ob3<= -150;   --l3 fo2
          ob4<= -200;  --l2 ta7t
          ob5<= -230;    --l3 ta7t
          ob6<= -280;     --l1 ta7
          gg<='0';
          Hsync <= '0';
          Vsync <= '0';
---------------------------------------------------------------------------


---------------------------------------------------------------------------
elsif(rising_edge(g_clk)) then

        counterH <= counterH+1;
          
----------------------------------------------------------------------------------
--lanes
if(counterH>=211 and counterH<=214) or (counterH>=428 and counterH<=431)  then
            if(counterV<=479) then
                Hsync <= '1';
                Vsync <= '1';
                R_s <= "1111";
                G_s <= "1111";
                B_s <= "1111";
                
end if;
       else
R_s <= "0000";
G_s <= "0000";
B_s <= "0000";
end if;    
----------------------------------------------------------------------------------


----------------------------------------------------------------------------------
--car
if((counterH>=offsetH)) and ((counterH<=offsetH+150)) then
            if(counterV>=435 and counterV<=465) then
                    Hsync <= '1';
                    Vsync <= '1';
                    R_s <= "0000";
                    G_s <= "1111";
                    B_s <= "1111";
           
 end if;

end if;
----------------------------------------------------------------------------------





----obstacles
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
    --#1 
      if(counterH>=50 and counterH<=100) then
                 if(counterV >= ob1 and counterV<50+ob1) then

                    Hsync <= '1';
                    Vsync <= '1';
                    R_s <= "0000";
                    G_s <= "0000";
                    B_s <= "1111";
                    end if;
       end if;
           
           if(ob1>=385 and ob1<435) and (offsetH>=0 and offsetH<=183) then
                   gg<='1';
            end if;
      
---------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------
        --#2  
      if(counterH>=250 and counterH<=300) then
                 if(counterV >= ob2 and counterV<50+ob2) then

                    Hsync <= '1';
                    Vsync <= '1';
                    R_s <= "0000";
                    G_s <= "0000";
                    B_s <= "1111";
                    end if;
       end if;
           
           if(ob2>=385 and ob2<435) and (offsetH>=211 and offsetH<=422) then
                   gg<='1';
            end if;
      
---------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------
    --#3
     
      if(counterH>=450 and counterH<=500) then
                 if(counterV >= ob3 and counterV<50+ob3) then

                    Hsync <= '1';
                    Vsync <= '1';
                    R_s <= "0000";
                    G_s <= "0000";
                    B_s <= "1111";
                    end if;
       end if;
           
           if(ob3>=385 and ob3<435) and (offsetH>=422 and offsetH<=799) then
                   gg<='1';
            end if;
      
---------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------
    --2 
      if(counterH>=250 and counterH<=300) then
                 if(counterV >= ob4 and counterV<50+ob4) then

                    Hsync <= '1';
                    Vsync <= '1';
                    R_s <= "0000";
                    G_s <= "0000";
                    B_s <= "1111";
                    end if;
       end if;
           
           if(ob4>=385 and ob4<435) and (offsetH>=211 and offsetH<=422) then
                   gg<='1';
            end if;
      
---------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------
     --3
      if(counterH>=450 and counterH<=500) then
                 if(counterV >= ob5 and counterV<50+ob5) then

                    Hsync <= '1';
                    Vsync <= '1';
                    R_s <= "0000";
                    G_s <= "0000";
                    B_s <= "1111";
                    end if;
       end if;
           
           if(ob5>=385 and ob5<435) and (offsetH>=422 and offsetH<=799) then
                   gg<='1';
            end if;
      
---------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------
     --1
      if(counterH>=50 and counterH<=100) then
                 if(counterV >= ob6 and counterV<50+ob6) then

                    Hsync <= '1';
                    Vsync <= '1';
                    R_s <= "0000";
                    G_s <= "0000";
                    B_s <= "1111";
                    end if;
       end if;
           
           if(ob6>=385 and ob6<435) and (offsetH>=0 and offsetH<=183) then
                   gg<='1';
            end if;
      
---------------------------------------------------------------------------------------





--            if (sw="10")then
--                if(counterH >= offsetH and counterH<150+offsetH) or (counterH >= offsetH-640 and counterH<150+offsetH-640) then   
--                    if(counterV<150) then
                    
--                    R_s <= "1111";
--                    G_s <= "0000";
--                    B_s <= "0000";
--                    end if;
--                   else
--                   R_s <= "0000";
--                   G_s <= "0000";
--                   B_s <= "0000";
--                  end if;
--                  end if;
                  
--            if(sw="01") then
--                if(counterH<150) then
--                 if(counterV >= offsetV and counterV<150+offsetV) or (counterV >= offsetV-480 and counterV<150+offsetV-480) then

--                    R_s <= "1111";
--                    G_s <= "0000";
--                    B_s <= "0000";

--                    end if;
--                   else
--                   R_s <= "0000";
--                   G_s <= "0000";
--                   B_s <= "0000";
--                  end if;
--end if;



-------------------------------------------------------------------------------------------------------------

 if(counterV>=480) and (counterV<=489) then
                                     Vsync <= '1';
                                     R_s <= "0000";
                                        G_s <= "0000";
                                        B_s <= "0000";
                                     end if;
                               if(counterV>=489) and (counterV<=492) then
                                         Vsync <= '0'; 
                                         R_s <= "0000";
                                        G_s <= "0000";
                                        B_s <= "0000";
                                          end if;
                               if(counterV>=492) and (counterV<=524) then
                                         Vsync <= '1';
                                         R_s <= "0000";
                                        G_s <= "0000";
                                        B_s <= "0000";
                                         end if;
                                if(counterH>=640) and (counterH<=655) then
                                      Hsync <= '1';
                                      R_s <= "0000";
                                     G_s <= "0000";
                                     B_s <= "0000";
                                      end if;
                                if(counterH>=656) and (counterH<=752) then
                                      Hsync <= '0';
                                      R_s <= "0000";
                                     G_s <= "0000";
                                     B_s <= "0000";
                                      end if; 
                                if(counterH>=753) and (counterH<=799) then
                                      Hsync <= '1';
                                      R_s <= "0000";
                                      G_s <= "0000";
                                      B_s <= "0000";
                                      end if;
                                 if (counterH=800)then
                                     counterH<=0;
                                     counterV<=counterV+1; 
                                     end if;
                                  if(counterV=525) then counterV <= 0; 
                                  
                              if(gg ='0') then 
                              if (ob1>=480)then
                                ob1<=-50;
                                else
                              ob1 <= ob1+1;
                              end if;
                              if (ob2>=480)then
                                  ob2<=-100;
                                   else
                              ob2 <= ob2+2;
                              end if;
                              if (ob3>=480)then
                                    ob3<=-150;
                                     else
                              ob3 <= ob3+3;
                              end if;
                              if (ob4>=480)then
                                   ob4<=-200;
                                   else
                              ob4 <= ob4+3;
                              end if;
                              if (ob5>=480)then
                                 ob5<=-250;
                                  else
                              ob5 <= ob5+1;
                              end if;
                              if (ob6>=480)then
                                   ob6<=-300;
                                      else
                              ob6 <= ob6+2;
                            end if;
                              offsetV <= offsetV +1;
                              
                                    if(btnL = '1') then
                                        flagL<=flagL+1;
                                        end if;
                                    if (flagL>=10) then
                                        if(offsetH-232 < 0) then 
                                            offsetH <= offsetH;
                                            flagL<=0;
                                            else
                                            offsetH <= offsetH-232;
                                            flagL<=0;
                                            end if;
                                      end if;
                                                
                                        if(btnR = '1') then
                                            flagR<=flagR+1;
                                            end if;
                                          if(flagR>=8)then  
                                            if(offsetH+232 > 639) then 
                                            offsetH <= offsetH;
                                            flagR<=0;
                                             else
                                            offsetH <= offsetH+232;
                                            flagR<=0;
                                            end if;
                                            end if;
                                  else
                                   ob1 <= ob1;
                                   ob2 <= ob2;
                                   ob3 <= ob3;
                                   ob4 <= ob4;
                                   ob5 <= ob5;
                                   ob6 <= ob6;

                                   offsetV <= offsetV;       
                                   offsetH <= offsetH;

                                      
                                        end if;
                                        
                                                            
                                                            
                                                            
                                                                end if;
                                  if(offsetH = 640) then offsetH <= 0; end if;
                                  if(offsetV = 480) then 
                                    offsetV <= 0; 
                                        end if;


        end if;


end process;

R <= R_s;
G <= G_s;
B <= B_s;
end Behavioral;
