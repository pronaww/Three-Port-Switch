--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : lab2_port_switch.vhf
-- /___/   /\     Timestamp : 08/08/2017 17:58:21
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family artix7 -flat -suppress -vhdl /home/btech/cs1160369/lab2_port_switch/lab2_port_switch.vhf -w /home/btech/cs1160369/lab2_port_switch/lab2_port_switch.sch
--Design Name: lab2_port_switch
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity dema_MUSER_lab2_port_switch is
   port ( dest  : in    std_logic_vector (1 downto 0); 
          din   : in    std_logic; 
          dout0 : out   std_logic; 
          dout1 : out   std_logic; 
          dout2 : out   std_logic);
end dema_MUSER_lab2_port_switch;

architecture BEHAVIORAL of dema_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND3B1
      port map (I0=>dest(0),
                I1=>dest(1),
                I2=>din,
                O=>dout2);
   
   XLXI_2 : AND3B1
      port map (I0=>dest(1),
                I1=>dest(0),
                I2=>din,
                O=>dout1);
   
   XLXI_4 : AND3B2
      port map (I0=>dest(0),
                I1=>dest(1),
                I2=>din,
                O=>dout0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity decoder_MUSER_lab2_port_switch is
   port ( src  : in    std_logic_vector (1 downto 0); 
          ack0 : out   std_logic; 
          ack1 : out   std_logic; 
          ack2 : out   std_logic);
end decoder_MUSER_lab2_port_switch;

architecture BEHAVIORAL of decoder_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
   component AND2B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B2 : component is "BLACK_BOX";
   
begin
   XLXI_5 : AND2B1
      port map (I0=>src(1),
                I1=>src(0),
                O=>ack1);
   
   XLXI_6 : AND2B1
      port map (I0=>src(0),
                I1=>src(1),
                O=>ack2);
   
   XLXI_7 : AND2B2
      port map (I0=>src(0),
                I1=>src(1),
                O=>ack0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity encoder_MUSER_lab2_port_switch is
   port ( req0 : in    std_logic; 
          req1 : in    std_logic; 
          req2 : in    std_logic; 
          src  : out   std_logic_vector (1 downto 0));
end encoder_MUSER_lab2_port_switch;

architecture BEHAVIORAL of encoder_MUSER_lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal req01223 : std_logic;
   signal XLXN_1   : std_logic;
   signal XLXN_6   : std_logic;
   signal XLXN_19  : std_logic;
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component NOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of NOR2 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : OR2
      port map (I0=>req2,
                I1=>XLXN_1,
                O=>src(1));
   
   XLXI_4 : NOR2
      port map (I0=>req0,
                I1=>req1,
                O=>XLXN_1);
   
   XLXI_5 : AND2
      port map (I0=>XLXN_19,
                I1=>XLXN_6,
                O=>src(0));
   
   XLXI_6 : OR2
      port map (I0=>req01223,
                I1=>req1,
                O=>XLXN_6);
   
   XLXI_7 : INV
      port map (I=>req0,
                O=>req01223);
   
   XLXI_8 : INV
      port map (I=>req2,
                O=>XLXN_19);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity lab2_port_switch is
   port ( dest0 : in    std_logic_vector (1 downto 0); 
          dest1 : in    std_logic_vector (1 downto 0); 
          dest2 : in    std_logic_vector (1 downto 0); 
          din0  : in    std_logic; 
          din1  : in    std_logic; 
          din2  : in    std_logic; 
          req0  : in    std_logic; 
          req1  : in    std_logic; 
          req2  : in    std_logic; 
          ack0  : out   std_logic; 
          ack1  : out   std_logic; 
          ack2  : out   std_logic; 
          dest  : out   std_logic_vector (1 downto 0); 
          dout0 : out   std_logic; 
          dout1 : out   std_logic; 
          dout2 : out   std_logic; 
          src   : out   std_logic_vector (1 downto 0));
end lab2_port_switch;

architecture BEHAVIORAL of lab2_port_switch is
   attribute BOX_TYPE   : string ;
   signal XLXN_2     : std_logic;
   signal XLXN_3     : std_logic;
   signal XLXN_4     : std_logic;
   signal XLXN_25    : std_logic;
   signal XLXN_27    : std_logic;
   signal XLXN_28    : std_logic;
   signal XLXN_39    : std_logic;
   signal XLXN_40    : std_logic;
   signal XLXN_41    : std_logic;
   signal XLXN_68    : std_logic;
   signal src_DUMMY  : std_logic_vector (1 downto 0);
   signal dest_DUMMY : std_logic_vector (1 downto 0);
   signal ack0_DUMMY : std_logic;
   signal ack1_DUMMY : std_logic;
   signal ack2_DUMMY : std_logic;
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component encoder_MUSER_lab2_port_switch
      port ( req0 : in    std_logic; 
             req1 : in    std_logic; 
             req2 : in    std_logic; 
             src  : out   std_logic_vector (1 downto 0));
   end component;
   
   component decoder_MUSER_lab2_port_switch
      port ( ack0 : out   std_logic; 
             ack1 : out   std_logic; 
             ack2 : out   std_logic; 
             src  : in    std_logic_vector (1 downto 0));
   end component;
   
   component dema_MUSER_lab2_port_switch
      port ( dest  : in    std_logic_vector (1 downto 0); 
             din   : in    std_logic; 
             dout0 : out   std_logic; 
             dout1 : out   std_logic; 
             dout2 : out   std_logic);
   end component;
   
begin
   ack0 <= ack0_DUMMY;
   ack1 <= ack1_DUMMY;
   ack2 <= ack2_DUMMY;
   dest(1 downto 0) <= dest_DUMMY(1 downto 0);
   src(1 downto 0) <= src_DUMMY(1 downto 0);
   XLXI_1 : OR3
      port map (I0=>XLXN_4,
                I1=>XLXN_3,
                I2=>XLXN_2,
                O=>XLXN_68);
   
   XLXI_2 : AND2
      port map (I0=>din0,
                I1=>ack0_DUMMY,
                O=>XLXN_2);
   
   XLXI_3 : AND2
      port map (I0=>din1,
                I1=>ack1_DUMMY,
                O=>XLXN_3);
   
   XLXI_4 : AND2
      port map (I0=>din2,
                I1=>ack2_DUMMY,
                O=>XLXN_4);
   
   XLXI_9 : encoder_MUSER_lab2_port_switch
      port map (req0=>req0,
                req1=>req1,
                req2=>req2,
                src(1 downto 0)=>src_DUMMY(1 downto 0));
   
   XLXI_10 : OR3
      port map (I0=>XLXN_28,
                I1=>XLXN_25,
                I2=>XLXN_27,
                O=>dest_DUMMY(0));
   
   XLXI_11 : AND2
      port map (I0=>ack0_DUMMY,
                I1=>dest0(0),
                O=>XLXN_27);
   
   XLXI_12 : AND2
      port map (I0=>ack1_DUMMY,
                I1=>dest1(0),
                O=>XLXN_25);
   
   XLXI_13 : AND2
      port map (I0=>ack2_DUMMY,
                I1=>dest2(0),
                O=>XLXN_28);
   
   XLXI_14 : OR3
      port map (I0=>XLXN_41,
                I1=>XLXN_39,
                I2=>XLXN_40,
                O=>dest_DUMMY(1));
   
   XLXI_15 : AND2
      port map (I0=>ack0_DUMMY,
                I1=>dest0(1),
                O=>XLXN_40);
   
   XLXI_16 : AND2
      port map (I0=>ack1_DUMMY,
                I1=>dest1(1),
                O=>XLXN_39);
   
   XLXI_17 : AND2
      port map (I0=>ack2_DUMMY,
                I1=>dest2(1),
                O=>XLXN_41);
   
   XLXI_18 : decoder_MUSER_lab2_port_switch
      port map (src(1 downto 0)=>src_DUMMY(1 downto 0),
                ack0=>ack0_DUMMY,
                ack1=>ack1_DUMMY,
                ack2=>ack2_DUMMY);
   
   XLXI_23 : dema_MUSER_lab2_port_switch
      port map (dest(1 downto 0)=>dest_DUMMY(1 downto 0),
                din=>XLXN_68,
                dout0=>dout0,
                dout1=>dout1,
                dout2=>dout2);
   
end BEHAVIORAL;


