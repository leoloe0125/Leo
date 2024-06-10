-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/11/2023 11:57:57"

-- 
-- Device: Altera EP4CGX22CF19C6 Package FBGA324
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	RF8_16bits IS
    PORT (
	wr_data : IN std_logic_vector(15 DOWNTO 0);
	wr_addr : IN std_logic_vector(2 DOWNTO 0);
	rs_addr : IN std_logic_vector(2 DOWNTO 0);
	rt_addr : IN std_logic_vector(2 DOWNTO 0);
	clk : IN std_logic;
	rst : IN std_logic;
	en : IN std_logic;
	rs : BUFFER std_logic_vector(15 DOWNTO 0);
	rt : BUFFER std_logic_vector(15 DOWNTO 0)
	);
END RF8_16bits;

-- Design Ports Information
-- rs[0]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[1]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[2]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[3]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[4]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[5]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[6]	=>  Location: PIN_R18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[7]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[8]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[9]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[10]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[11]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[12]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[13]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[14]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs[15]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[0]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[1]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[2]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[3]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[4]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[5]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[6]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[7]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[8]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[9]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[10]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[11]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[12]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[13]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[14]	=>  Location: PIN_U18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt[15]	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs_addr[0]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs_addr[1]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rs_addr[2]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt_addr[0]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt_addr[1]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rt_addr[2]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[0]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_addr[2]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_addr[0]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- en	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_addr[1]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[1]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[3]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[4]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[5]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[6]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[7]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[8]	=>  Location: PIN_T16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[9]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[10]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[11]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[12]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[13]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[14]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wr_data[15]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RF8_16bits IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_wr_data : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_wr_addr : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rs_addr : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rt_addr : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_en : std_logic;
SIGNAL ww_rs : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rt : std_logic_vector(15 DOWNTO 0);
SIGNAL \rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rs[0]~output_o\ : std_logic;
SIGNAL \rs[1]~output_o\ : std_logic;
SIGNAL \rs[2]~output_o\ : std_logic;
SIGNAL \rs[3]~output_o\ : std_logic;
SIGNAL \rs[4]~output_o\ : std_logic;
SIGNAL \rs[5]~output_o\ : std_logic;
SIGNAL \rs[6]~output_o\ : std_logic;
SIGNAL \rs[7]~output_o\ : std_logic;
SIGNAL \rs[8]~output_o\ : std_logic;
SIGNAL \rs[9]~output_o\ : std_logic;
SIGNAL \rs[10]~output_o\ : std_logic;
SIGNAL \rs[11]~output_o\ : std_logic;
SIGNAL \rs[12]~output_o\ : std_logic;
SIGNAL \rs[13]~output_o\ : std_logic;
SIGNAL \rs[14]~output_o\ : std_logic;
SIGNAL \rs[15]~output_o\ : std_logic;
SIGNAL \rt[0]~output_o\ : std_logic;
SIGNAL \rt[1]~output_o\ : std_logic;
SIGNAL \rt[2]~output_o\ : std_logic;
SIGNAL \rt[3]~output_o\ : std_logic;
SIGNAL \rt[4]~output_o\ : std_logic;
SIGNAL \rt[5]~output_o\ : std_logic;
SIGNAL \rt[6]~output_o\ : std_logic;
SIGNAL \rt[7]~output_o\ : std_logic;
SIGNAL \rt[8]~output_o\ : std_logic;
SIGNAL \rt[9]~output_o\ : std_logic;
SIGNAL \rt[10]~output_o\ : std_logic;
SIGNAL \rt[11]~output_o\ : std_logic;
SIGNAL \rt[12]~output_o\ : std_logic;
SIGNAL \rt[13]~output_o\ : std_logic;
SIGNAL \rt[14]~output_o\ : std_logic;
SIGNAL \rt[15]~output_o\ : std_logic;
SIGNAL \rs_addr[2]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \wr_data[0]~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \en~input_o\ : std_logic;
SIGNAL \wr_addr[0]~input_o\ : std_logic;
SIGNAL \wr_addr[2]~input_o\ : std_logic;
SIGNAL \wr_addr[1]~input_o\ : std_logic;
SIGNAL \D0|Dout[3]~7_combout\ : std_logic;
SIGNAL \rs_addr[1]~input_o\ : std_logic;
SIGNAL \D0|Dout[2]~4_combout\ : std_logic;
SIGNAL \rs_addr[0]~input_o\ : std_logic;
SIGNAL \D0|Dout[1]~5_combout\ : std_logic;
SIGNAL \D0|Dout[0]~6_combout\ : std_logic;
SIGNAL \Rs|Mux15~2_combout\ : std_logic;
SIGNAL \Rs|Mux15~3_combout\ : std_logic;
SIGNAL \D0|Dout[6]~1_combout\ : std_logic;
SIGNAL \D0|Dout[4]~2_combout\ : std_logic;
SIGNAL \Rs|Mux15~0_combout\ : std_logic;
SIGNAL \D0|Dout[5]~0_combout\ : std_logic;
SIGNAL \D0|Dout[7]~3_combout\ : std_logic;
SIGNAL \Rs|Mux15~1_combout\ : std_logic;
SIGNAL \Rs|Mux15~4_combout\ : std_logic;
SIGNAL \wr_data[1]~input_o\ : std_logic;
SIGNAL \Rs|Mux14~0_combout\ : std_logic;
SIGNAL \Rs|Mux14~1_combout\ : std_logic;
SIGNAL \Rs|Mux14~2_combout\ : std_logic;
SIGNAL \Rs|Mux14~3_combout\ : std_logic;
SIGNAL \Rs|Mux14~4_combout\ : std_logic;
SIGNAL \wr_data[2]~input_o\ : std_logic;
SIGNAL \Rs|Mux13~0_combout\ : std_logic;
SIGNAL \Rs|Mux13~1_combout\ : std_logic;
SIGNAL \Rs|Mux13~2_combout\ : std_logic;
SIGNAL \Rs|Mux13~3_combout\ : std_logic;
SIGNAL \Rs|Mux13~4_combout\ : std_logic;
SIGNAL \wr_data[3]~input_o\ : std_logic;
SIGNAL \Rs|Mux12~0_combout\ : std_logic;
SIGNAL \Rs|Mux12~1_combout\ : std_logic;
SIGNAL \Rs|Mux12~2_combout\ : std_logic;
SIGNAL \Rs|Mux12~3_combout\ : std_logic;
SIGNAL \Rs|Mux12~4_combout\ : std_logic;
SIGNAL \wr_data[4]~input_o\ : std_logic;
SIGNAL \Rs|Mux11~0_combout\ : std_logic;
SIGNAL \Rs|Mux11~1_combout\ : std_logic;
SIGNAL \Rs|Mux11~2_combout\ : std_logic;
SIGNAL \Rs|Mux11~3_combout\ : std_logic;
SIGNAL \Rs|Mux11~4_combout\ : std_logic;
SIGNAL \wr_data[5]~input_o\ : std_logic;
SIGNAL \Rs|Mux10~2_combout\ : std_logic;
SIGNAL \Rs|Mux10~3_combout\ : std_logic;
SIGNAL \Rs|Mux10~0_combout\ : std_logic;
SIGNAL \Rs|Mux10~1_combout\ : std_logic;
SIGNAL \Rs|Mux10~4_combout\ : std_logic;
SIGNAL \wr_data[6]~input_o\ : std_logic;
SIGNAL \Rs|Mux9~2_combout\ : std_logic;
SIGNAL \Rs|Mux9~3_combout\ : std_logic;
SIGNAL \Rs|Mux9~0_combout\ : std_logic;
SIGNAL \Rs|Mux9~1_combout\ : std_logic;
SIGNAL \Rs|Mux9~4_combout\ : std_logic;
SIGNAL \wr_data[7]~input_o\ : std_logic;
SIGNAL \Rs|Mux8~2_combout\ : std_logic;
SIGNAL \Rs|Mux8~3_combout\ : std_logic;
SIGNAL \Rs|Mux8~0_combout\ : std_logic;
SIGNAL \Rs|Mux8~1_combout\ : std_logic;
SIGNAL \Rs|Mux8~4_combout\ : std_logic;
SIGNAL \wr_data[8]~input_o\ : std_logic;
SIGNAL \Rs|Mux7~2_combout\ : std_logic;
SIGNAL \Rs|Mux7~3_combout\ : std_logic;
SIGNAL \Rs|Mux7~0_combout\ : std_logic;
SIGNAL \Rs|Mux7~1_combout\ : std_logic;
SIGNAL \Rs|Mux7~4_combout\ : std_logic;
SIGNAL \wr_data[9]~input_o\ : std_logic;
SIGNAL \Rs|Mux6~2_combout\ : std_logic;
SIGNAL \Rs|Mux6~3_combout\ : std_logic;
SIGNAL \Rs|Mux6~0_combout\ : std_logic;
SIGNAL \Rs|Mux6~1_combout\ : std_logic;
SIGNAL \Rs|Mux6~4_combout\ : std_logic;
SIGNAL \wr_data[10]~input_o\ : std_logic;
SIGNAL \Rs|Mux5~0_combout\ : std_logic;
SIGNAL \Rs|Mux5~1_combout\ : std_logic;
SIGNAL \Rs|Mux5~2_combout\ : std_logic;
SIGNAL \Rs|Mux5~3_combout\ : std_logic;
SIGNAL \Rs|Mux5~4_combout\ : std_logic;
SIGNAL \wr_data[11]~input_o\ : std_logic;
SIGNAL \Rs|Mux4~2_combout\ : std_logic;
SIGNAL \Rs|Mux4~3_combout\ : std_logic;
SIGNAL \Rs|Mux4~0_combout\ : std_logic;
SIGNAL \Rs|Mux4~1_combout\ : std_logic;
SIGNAL \Rs|Mux4~4_combout\ : std_logic;
SIGNAL \wr_data[12]~input_o\ : std_logic;
SIGNAL \Rs|Mux3~2_combout\ : std_logic;
SIGNAL \Rs|Mux3~3_combout\ : std_logic;
SIGNAL \Rs|Mux3~0_combout\ : std_logic;
SIGNAL \Rs|Mux3~1_combout\ : std_logic;
SIGNAL \Rs|Mux3~4_combout\ : std_logic;
SIGNAL \wr_data[13]~input_o\ : std_logic;
SIGNAL \Rs|Mux2~2_combout\ : std_logic;
SIGNAL \Rs|Mux2~3_combout\ : std_logic;
SIGNAL \Rs|Mux2~0_combout\ : std_logic;
SIGNAL \Rs|Mux2~1_combout\ : std_logic;
SIGNAL \Rs|Mux2~4_combout\ : std_logic;
SIGNAL \wr_data[14]~input_o\ : std_logic;
SIGNAL \Rs|Mux1~2_combout\ : std_logic;
SIGNAL \Rs|Mux1~3_combout\ : std_logic;
SIGNAL \Rs|Mux1~0_combout\ : std_logic;
SIGNAL \Rs|Mux1~1_combout\ : std_logic;
SIGNAL \Rs|Mux1~4_combout\ : std_logic;
SIGNAL \wr_data[15]~input_o\ : std_logic;
SIGNAL \Rs|Mux0~2_combout\ : std_logic;
SIGNAL \Rs|Mux0~3_combout\ : std_logic;
SIGNAL \Rs|Mux0~0_combout\ : std_logic;
SIGNAL \Rs|Mux0~1_combout\ : std_logic;
SIGNAL \Rs|Mux0~4_combout\ : std_logic;
SIGNAL \rt_addr[1]~input_o\ : std_logic;
SIGNAL \rt_addr[0]~input_o\ : std_logic;
SIGNAL \Rt|Mux15~2_combout\ : std_logic;
SIGNAL \Rt|Mux15~3_combout\ : std_logic;
SIGNAL \Rt|Mux15~0_combout\ : std_logic;
SIGNAL \Rt|Mux15~1_combout\ : std_logic;
SIGNAL \rt_addr[2]~input_o\ : std_logic;
SIGNAL \Rt|Mux15~4_combout\ : std_logic;
SIGNAL \Rt|Mux14~0_combout\ : std_logic;
SIGNAL \Rt|Mux14~1_combout\ : std_logic;
SIGNAL \Rt|Mux14~2_combout\ : std_logic;
SIGNAL \Rt|Mux14~3_combout\ : std_logic;
SIGNAL \Rt|Mux14~4_combout\ : std_logic;
SIGNAL \Rt|Mux13~2_combout\ : std_logic;
SIGNAL \Rt|Mux13~3_combout\ : std_logic;
SIGNAL \Rt|Mux13~0_combout\ : std_logic;
SIGNAL \Rt|Mux13~1_combout\ : std_logic;
SIGNAL \Rt|Mux13~4_combout\ : std_logic;
SIGNAL \Rt|Mux12~2_combout\ : std_logic;
SIGNAL \Rt|Mux12~3_combout\ : std_logic;
SIGNAL \Rt|Mux12~0_combout\ : std_logic;
SIGNAL \Rt|Mux12~1_combout\ : std_logic;
SIGNAL \Rt|Mux12~4_combout\ : std_logic;
SIGNAL \Rt|Mux11~0_combout\ : std_logic;
SIGNAL \Rt|Mux11~1_combout\ : std_logic;
SIGNAL \Rt|Mux11~2_combout\ : std_logic;
SIGNAL \Rt|Mux11~3_combout\ : std_logic;
SIGNAL \Rt|Mux11~4_combout\ : std_logic;
SIGNAL \Rt|Mux10~2_combout\ : std_logic;
SIGNAL \Rt|Mux10~3_combout\ : std_logic;
SIGNAL \Rt|Mux10~0_combout\ : std_logic;
SIGNAL \Rt|Mux10~1_combout\ : std_logic;
SIGNAL \Rt|Mux10~4_combout\ : std_logic;
SIGNAL \Rt|Mux9~2_combout\ : std_logic;
SIGNAL \Rt|Mux9~3_combout\ : std_logic;
SIGNAL \Rt|Mux9~0_combout\ : std_logic;
SIGNAL \Rt|Mux9~1_combout\ : std_logic;
SIGNAL \Rt|Mux9~4_combout\ : std_logic;
SIGNAL \Rt|Mux8~0_combout\ : std_logic;
SIGNAL \Rt|Mux8~1_combout\ : std_logic;
SIGNAL \Rt|Mux8~2_combout\ : std_logic;
SIGNAL \Rt|Mux8~3_combout\ : std_logic;
SIGNAL \Rt|Mux8~4_combout\ : std_logic;
SIGNAL \Rt|Mux7~2_combout\ : std_logic;
SIGNAL \Rt|Mux7~3_combout\ : std_logic;
SIGNAL \Rt|Mux7~0_combout\ : std_logic;
SIGNAL \Rt|Mux7~1_combout\ : std_logic;
SIGNAL \Rt|Mux7~4_combout\ : std_logic;
SIGNAL \Rt|Mux6~2_combout\ : std_logic;
SIGNAL \Rt|Mux6~3_combout\ : std_logic;
SIGNAL \Rt|Mux6~0_combout\ : std_logic;
SIGNAL \Rt|Mux6~1_combout\ : std_logic;
SIGNAL \Rt|Mux6~4_combout\ : std_logic;
SIGNAL \Rt|Mux5~0_combout\ : std_logic;
SIGNAL \Rt|Mux5~1_combout\ : std_logic;
SIGNAL \Rt|Mux5~2_combout\ : std_logic;
SIGNAL \Rt|Mux5~3_combout\ : std_logic;
SIGNAL \Rt|Mux5~4_combout\ : std_logic;
SIGNAL \Rt|Mux4~2_combout\ : std_logic;
SIGNAL \Rt|Mux4~3_combout\ : std_logic;
SIGNAL \Rt|Mux4~0_combout\ : std_logic;
SIGNAL \Rt|Mux4~1_combout\ : std_logic;
SIGNAL \Rt|Mux4~4_combout\ : std_logic;
SIGNAL \Rt|Mux3~0_combout\ : std_logic;
SIGNAL \Rt|Mux3~1_combout\ : std_logic;
SIGNAL \Rt|Mux3~2_combout\ : std_logic;
SIGNAL \Rt|Mux3~3_combout\ : std_logic;
SIGNAL \Rt|Mux3~4_combout\ : std_logic;
SIGNAL \Rt|Mux2~2_combout\ : std_logic;
SIGNAL \Rt|Mux2~3_combout\ : std_logic;
SIGNAL \Rt|Mux2~0_combout\ : std_logic;
SIGNAL \Rt|Mux2~1_combout\ : std_logic;
SIGNAL \Rt|Mux2~4_combout\ : std_logic;
SIGNAL \Rt|Mux1~0_combout\ : std_logic;
SIGNAL \Rt|Mux1~1_combout\ : std_logic;
SIGNAL \Rt|Mux1~2_combout\ : std_logic;
SIGNAL \Rt|Mux1~3_combout\ : std_logic;
SIGNAL \Rt|Mux1~4_combout\ : std_logic;
SIGNAL \Rt|Mux0~0_combout\ : std_logic;
SIGNAL \Rt|Mux0~1_combout\ : std_logic;
SIGNAL \Rt|Mux0~2_combout\ : std_logic;
SIGNAL \Rt|Mux0~3_combout\ : std_logic;
SIGNAL \Rt|Mux0~4_combout\ : std_logic;
SIGNAL \R4|Dout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \R5|Dout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \R6|Dout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \R7|Dout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \R0|Dout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \R1|Dout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \R2|Dout\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \R3|Dout\ : std_logic_vector(15 DOWNTO 0);

BEGIN

ww_wr_data <= wr_data;
ww_wr_addr <= wr_addr;
ww_rs_addr <= rs_addr;
ww_rt_addr <= rt_addr;
ww_clk <= clk;
ww_rst <= rst;
ww_en <= en;
rs <= ww_rs;
rt <= ww_rt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X52_Y18_N2
\rs[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux15~4_combout\,
	devoe => ww_devoe,
	o => \rs[0]~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\rs[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux14~4_combout\,
	devoe => ww_devoe,
	o => \rs[1]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\rs[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux13~4_combout\,
	devoe => ww_devoe,
	o => \rs[2]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\rs[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux12~4_combout\,
	devoe => ww_devoe,
	o => \rs[3]~output_o\);

-- Location: IOOBUF_X50_Y0_N2
\rs[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux11~4_combout\,
	devoe => ww_devoe,
	o => \rs[4]~output_o\);

-- Location: IOOBUF_X46_Y0_N2
\rs[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux10~4_combout\,
	devoe => ww_devoe,
	o => \rs[5]~output_o\);

-- Location: IOOBUF_X52_Y12_N2
\rs[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux9~4_combout\,
	devoe => ww_devoe,
	o => \rs[6]~output_o\);

-- Location: IOOBUF_X52_Y12_N9
\rs[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux8~4_combout\,
	devoe => ww_devoe,
	o => \rs[7]~output_o\);

-- Location: IOOBUF_X48_Y0_N2
\rs[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux7~4_combout\,
	devoe => ww_devoe,
	o => \rs[8]~output_o\);

-- Location: IOOBUF_X50_Y0_N9
\rs[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux6~4_combout\,
	devoe => ww_devoe,
	o => \rs[9]~output_o\);

-- Location: IOOBUF_X34_Y41_N9
\rs[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux5~4_combout\,
	devoe => ww_devoe,
	o => \rs[10]~output_o\);

-- Location: IOOBUF_X52_Y15_N2
\rs[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux4~4_combout\,
	devoe => ww_devoe,
	o => \rs[11]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\rs[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux3~4_combout\,
	devoe => ww_devoe,
	o => \rs[12]~output_o\);

-- Location: IOOBUF_X41_Y0_N23
\rs[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux2~4_combout\,
	devoe => ww_devoe,
	o => \rs[13]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\rs[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux1~4_combout\,
	devoe => ww_devoe,
	o => \rs[14]~output_o\);

-- Location: IOOBUF_X23_Y0_N2
\rs[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rs|Mux0~4_combout\,
	devoe => ww_devoe,
	o => \rs[15]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\rt[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux15~4_combout\,
	devoe => ww_devoe,
	o => \rt[0]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\rt[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux14~4_combout\,
	devoe => ww_devoe,
	o => \rt[1]~output_o\);

-- Location: IOOBUF_X25_Y0_N9
\rt[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux13~4_combout\,
	devoe => ww_devoe,
	o => \rt[2]~output_o\);

-- Location: IOOBUF_X52_Y16_N2
\rt[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux12~4_combout\,
	devoe => ww_devoe,
	o => \rt[3]~output_o\);

-- Location: IOOBUF_X46_Y0_N16
\rt[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux11~4_combout\,
	devoe => ww_devoe,
	o => \rt[4]~output_o\);

-- Location: IOOBUF_X34_Y41_N2
\rt[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux10~4_combout\,
	devoe => ww_devoe,
	o => \rt[5]~output_o\);

-- Location: IOOBUF_X52_Y19_N2
\rt[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux9~4_combout\,
	devoe => ww_devoe,
	o => \rt[6]~output_o\);

-- Location: IOOBUF_X52_Y16_N9
\rt[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux8~4_combout\,
	devoe => ww_devoe,
	o => \rt[7]~output_o\);

-- Location: IOOBUF_X52_Y11_N9
\rt[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux7~4_combout\,
	devoe => ww_devoe,
	o => \rt[8]~output_o\);

-- Location: IOOBUF_X48_Y0_N9
\rt[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux6~4_combout\,
	devoe => ww_devoe,
	o => \rt[9]~output_o\);

-- Location: IOOBUF_X31_Y0_N23
\rt[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux5~4_combout\,
	devoe => ww_devoe,
	o => \rt[10]~output_o\);

-- Location: IOOBUF_X52_Y18_N9
\rt[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux4~4_combout\,
	devoe => ww_devoe,
	o => \rt[11]~output_o\);

-- Location: IOOBUF_X52_Y15_N9
\rt[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux3~4_combout\,
	devoe => ww_devoe,
	o => \rt[12]~output_o\);

-- Location: IOOBUF_X52_Y19_N9
\rt[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux2~4_combout\,
	devoe => ww_devoe,
	o => \rt[13]~output_o\);

-- Location: IOOBUF_X46_Y0_N23
\rt[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux1~4_combout\,
	devoe => ww_devoe,
	o => \rt[14]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\rt[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Rt|Mux0~4_combout\,
	devoe => ww_devoe,
	o => \rt[15]~output_o\);

-- Location: IOIBUF_X31_Y0_N15
\rs_addr[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs_addr(2),
	o => \rs_addr[2]~input_o\);

-- Location: IOIBUF_X27_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X52_Y10_N8
\wr_data[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(0),
	o => \wr_data[0]~input_o\);

-- Location: IOIBUF_X27_Y0_N22
\rst~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: CLKCTRL_G19
\rst~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst~inputclkctrl_outclk\);

-- Location: IOIBUF_X16_Y0_N8
\en~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_en,
	o => \en~input_o\);

-- Location: IOIBUF_X23_Y0_N8
\wr_addr[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_addr(0),
	o => \wr_addr[0]~input_o\);

-- Location: IOIBUF_X31_Y41_N22
\wr_addr[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_addr(2),
	o => \wr_addr[2]~input_o\);

-- Location: IOIBUF_X25_Y0_N1
\wr_addr[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_addr(1),
	o => \wr_addr[1]~input_o\);

-- Location: LCCOMB_X32_Y7_N18
\D0|Dout[3]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[3]~7_combout\ = (\en~input_o\ & (\wr_addr[0]~input_o\ & (!\wr_addr[2]~input_o\ & \wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[3]~7_combout\);

-- Location: FF_X35_Y8_N27
\R3|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(0));

-- Location: IOIBUF_X27_Y0_N1
\rs_addr[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs_addr(1),
	o => \rs_addr[1]~input_o\);

-- Location: LCCOMB_X32_Y7_N28
\D0|Dout[2]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[2]~4_combout\ = (\en~input_o\ & (!\wr_addr[0]~input_o\ & (!\wr_addr[2]~input_o\ & \wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[2]~4_combout\);

-- Location: FF_X35_Y8_N1
\R2|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(0));

-- Location: IOIBUF_X27_Y0_N8
\rs_addr[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rs_addr(0),
	o => \rs_addr[0]~input_o\);

-- Location: LCCOMB_X32_Y7_N6
\D0|Dout[1]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[1]~5_combout\ = (\en~input_o\ & (\wr_addr[0]~input_o\ & (!\wr_addr[2]~input_o\ & !\wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[1]~5_combout\);

-- Location: FF_X36_Y8_N9
\R1|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(0));

-- Location: LCCOMB_X32_Y7_N16
\D0|Dout[0]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[0]~6_combout\ = (\en~input_o\ & (!\wr_addr[0]~input_o\ & (!\wr_addr[2]~input_o\ & !\wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[0]~6_combout\);

-- Location: FF_X36_Y8_N19
\R0|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(0));

-- Location: LCCOMB_X36_Y8_N8
\Rs|Mux15~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux15~2_combout\ = (\rs_addr[1]~input_o\ & (\rs_addr[0]~input_o\)) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & (\R1|Dout\(0))) # (!\rs_addr[0]~input_o\ & ((\R0|Dout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(0),
	datad => \R0|Dout\(0),
	combout => \Rs|Mux15~2_combout\);

-- Location: LCCOMB_X35_Y8_N0
\Rs|Mux15~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux15~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux15~2_combout\ & (\R3|Dout\(0))) # (!\Rs|Mux15~2_combout\ & ((\R2|Dout\(0)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux15~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|Dout\(0),
	datab => \rs_addr[1]~input_o\,
	datac => \R2|Dout\(0),
	datad => \Rs|Mux15~2_combout\,
	combout => \Rs|Mux15~3_combout\);

-- Location: LCCOMB_X32_Y7_N14
\D0|Dout[6]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[6]~1_combout\ = (\en~input_o\ & (!\wr_addr[0]~input_o\ & (\wr_addr[2]~input_o\ & \wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[6]~1_combout\);

-- Location: FF_X34_Y7_N1
\R6|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(0));

-- Location: LCCOMB_X32_Y7_N24
\D0|Dout[4]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[4]~2_combout\ = (\en~input_o\ & (!\wr_addr[0]~input_o\ & (\wr_addr[2]~input_o\ & !\wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[4]~2_combout\);

-- Location: FF_X34_Y7_N11
\R4|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(0));

-- Location: LCCOMB_X34_Y7_N0
\Rs|Mux15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux15~0_combout\ = (\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\) # ((\R6|Dout\(0))))) # (!\rs_addr[1]~input_o\ & (!\rs_addr[0]~input_o\ & ((\R4|Dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(0),
	datad => \R4|Dout\(0),
	combout => \Rs|Mux15~0_combout\);

-- Location: LCCOMB_X32_Y7_N12
\D0|Dout[5]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[5]~0_combout\ = (\en~input_o\ & (\wr_addr[0]~input_o\ & (\wr_addr[2]~input_o\ & !\wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[5]~0_combout\);

-- Location: FF_X34_Y8_N1
\R5|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(0));

-- Location: LCCOMB_X32_Y7_N10
\D0|Dout[7]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D0|Dout[7]~3_combout\ = (\en~input_o\ & (\wr_addr[0]~input_o\ & (\wr_addr[2]~input_o\ & \wr_addr[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \en~input_o\,
	datab => \wr_addr[0]~input_o\,
	datac => \wr_addr[2]~input_o\,
	datad => \wr_addr[1]~input_o\,
	combout => \D0|Dout[7]~3_combout\);

-- Location: FF_X34_Y8_N11
\R7|Dout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[0]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(0));

-- Location: LCCOMB_X34_Y8_N0
\Rs|Mux15~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux15~1_combout\ = (\rs_addr[0]~input_o\ & ((\Rs|Mux15~0_combout\ & ((\R7|Dout\(0)))) # (!\Rs|Mux15~0_combout\ & (\R5|Dout\(0))))) # (!\rs_addr[0]~input_o\ & (\Rs|Mux15~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \Rs|Mux15~0_combout\,
	datac => \R5|Dout\(0),
	datad => \R7|Dout\(0),
	combout => \Rs|Mux15~1_combout\);

-- Location: LCCOMB_X34_Y8_N28
\Rs|Mux15~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux15~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux15~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux15~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datab => \Rs|Mux15~3_combout\,
	datac => \Rs|Mux15~1_combout\,
	combout => \Rs|Mux15~4_combout\);

-- Location: IOIBUF_X34_Y0_N1
\wr_data[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(1),
	o => \wr_data[1]~input_o\);

-- Location: FF_X34_Y7_N7
\R4|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(1));

-- Location: FF_X34_Y7_N13
\R6|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(1));

-- Location: LCCOMB_X34_Y7_N12
\Rs|Mux14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux14~0_combout\ = (\rs_addr[0]~input_o\ & (((\rs_addr[1]~input_o\)))) # (!\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\ & ((\R6|Dout\(1)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|Dout\(1),
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(1),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux14~0_combout\);

-- Location: FF_X34_Y8_N15
\R5|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(1));

-- Location: FF_X34_Y8_N9
\R7|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(1));

-- Location: LCCOMB_X34_Y8_N14
\Rs|Mux14~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux14~1_combout\ = (\rs_addr[0]~input_o\ & ((\Rs|Mux14~0_combout\ & ((\R7|Dout\(1)))) # (!\Rs|Mux14~0_combout\ & (\R5|Dout\(1))))) # (!\rs_addr[0]~input_o\ & (\Rs|Mux14~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \Rs|Mux14~0_combout\,
	datac => \R5|Dout\(1),
	datad => \R7|Dout\(1),
	combout => \Rs|Mux14~1_combout\);

-- Location: FF_X35_Y8_N23
\R3|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(1));

-- Location: FF_X35_Y8_N5
\R2|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(1));

-- Location: FF_X36_Y8_N5
\R1|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(1));

-- Location: FF_X36_Y8_N7
\R0|Dout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[1]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(1));

-- Location: LCCOMB_X36_Y8_N4
\Rs|Mux14~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux14~2_combout\ = (\rs_addr[1]~input_o\ & (\rs_addr[0]~input_o\)) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & (\R1|Dout\(1))) # (!\rs_addr[0]~input_o\ & ((\R0|Dout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(1),
	datad => \R0|Dout\(1),
	combout => \Rs|Mux14~2_combout\);

-- Location: LCCOMB_X35_Y8_N4
\Rs|Mux14~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux14~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux14~2_combout\ & (\R3|Dout\(1))) # (!\Rs|Mux14~2_combout\ & ((\R2|Dout\(1)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux14~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|Dout\(1),
	datab => \rs_addr[1]~input_o\,
	datac => \R2|Dout\(1),
	datad => \Rs|Mux14~2_combout\,
	combout => \Rs|Mux14~3_combout\);

-- Location: LCCOMB_X34_Y8_N26
\Rs|Mux14~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux14~4_combout\ = (\rs_addr[2]~input_o\ & (\Rs|Mux14~1_combout\)) # (!\rs_addr[2]~input_o\ & ((\Rs|Mux14~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datac => \Rs|Mux14~1_combout\,
	datad => \Rs|Mux14~3_combout\,
	combout => \Rs|Mux14~4_combout\);

-- Location: IOIBUF_X31_Y0_N8
\wr_data[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(2),
	o => \wr_data[2]~input_o\);

-- Location: FF_X34_Y7_N25
\R6|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(2));

-- Location: FF_X34_Y7_N3
\R4|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(2));

-- Location: LCCOMB_X34_Y7_N24
\Rs|Mux13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux13~0_combout\ = (\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\) # ((\R6|Dout\(2))))) # (!\rs_addr[1]~input_o\ & (!\rs_addr[0]~input_o\ & ((\R4|Dout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(2),
	datad => \R4|Dout\(2),
	combout => \Rs|Mux13~0_combout\);

-- Location: FF_X34_Y8_N13
\R5|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(2));

-- Location: FF_X34_Y8_N31
\R7|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(2));

-- Location: LCCOMB_X34_Y8_N12
\Rs|Mux13~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux13~1_combout\ = (\rs_addr[0]~input_o\ & ((\Rs|Mux13~0_combout\ & ((\R7|Dout\(2)))) # (!\Rs|Mux13~0_combout\ & (\R5|Dout\(2))))) # (!\rs_addr[0]~input_o\ & (\Rs|Mux13~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \Rs|Mux13~0_combout\,
	datac => \R5|Dout\(2),
	datad => \R7|Dout\(2),
	combout => \Rs|Mux13~1_combout\);

-- Location: FF_X36_Y8_N17
\R1|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(2));

-- Location: FF_X36_Y8_N11
\R0|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(2));

-- Location: LCCOMB_X36_Y8_N16
\Rs|Mux13~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux13~2_combout\ = (\rs_addr[1]~input_o\ & (\rs_addr[0]~input_o\)) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & (\R1|Dout\(2))) # (!\rs_addr[0]~input_o\ & ((\R0|Dout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(2),
	datad => \R0|Dout\(2),
	combout => \Rs|Mux13~2_combout\);

-- Location: FF_X35_Y8_N17
\R2|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(2));

-- Location: FF_X35_Y8_N19
\R3|Dout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[2]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(2));

-- Location: LCCOMB_X35_Y8_N16
\Rs|Mux13~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux13~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux13~2_combout\ & ((\R3|Dout\(2)))) # (!\Rs|Mux13~2_combout\ & (\R2|Dout\(2))))) # (!\rs_addr[1]~input_o\ & (\Rs|Mux13~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \Rs|Mux13~2_combout\,
	datac => \R2|Dout\(2),
	datad => \R3|Dout\(2),
	combout => \Rs|Mux13~3_combout\);

-- Location: LCCOMB_X34_Y8_N16
\Rs|Mux13~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux13~4_combout\ = (\rs_addr[2]~input_o\ & (\Rs|Mux13~1_combout\)) # (!\rs_addr[2]~input_o\ & ((\Rs|Mux13~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datac => \Rs|Mux13~1_combout\,
	datad => \Rs|Mux13~3_combout\,
	combout => \Rs|Mux13~4_combout\);

-- Location: IOIBUF_X31_Y0_N1
\wr_data[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(3),
	o => \wr_data[3]~input_o\);

-- Location: FF_X34_Y8_N21
\R7|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(3));

-- Location: FF_X34_Y8_N19
\R5|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(3));

-- Location: FF_X34_Y7_N23
\R4|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(3));

-- Location: FF_X34_Y7_N5
\R6|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(3));

-- Location: LCCOMB_X34_Y7_N4
\Rs|Mux12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux12~0_combout\ = (\rs_addr[0]~input_o\ & (((\rs_addr[1]~input_o\)))) # (!\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\ & ((\R6|Dout\(3)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|Dout\(3),
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(3),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux12~0_combout\);

-- Location: LCCOMB_X34_Y8_N18
\Rs|Mux12~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux12~1_combout\ = (\rs_addr[0]~input_o\ & ((\Rs|Mux12~0_combout\ & (\R7|Dout\(3))) # (!\Rs|Mux12~0_combout\ & ((\R5|Dout\(3)))))) # (!\rs_addr[0]~input_o\ & (((\Rs|Mux12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \R7|Dout\(3),
	datac => \R5|Dout\(3),
	datad => \Rs|Mux12~0_combout\,
	combout => \Rs|Mux12~1_combout\);

-- Location: FF_X35_Y8_N31
\R3|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(3));

-- Location: FF_X35_Y8_N29
\R2|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(3));

-- Location: FF_X36_Y8_N31
\R0|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(3));

-- Location: FF_X36_Y8_N21
\R1|Dout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[3]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(3));

-- Location: LCCOMB_X36_Y8_N20
\Rs|Mux12~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux12~2_combout\ = (\rs_addr[0]~input_o\ & (((\R1|Dout\(3)) # (\rs_addr[1]~input_o\)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(3) & ((!\rs_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R0|Dout\(3),
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(3),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux12~2_combout\);

-- Location: LCCOMB_X35_Y8_N28
\Rs|Mux12~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux12~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux12~2_combout\ & (\R3|Dout\(3))) # (!\Rs|Mux12~2_combout\ & ((\R2|Dout\(3)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R3|Dout\(3),
	datac => \R2|Dout\(3),
	datad => \Rs|Mux12~2_combout\,
	combout => \Rs|Mux12~3_combout\);

-- Location: LCCOMB_X34_Y8_N22
\Rs|Mux12~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux12~4_combout\ = (\rs_addr[2]~input_o\ & (\Rs|Mux12~1_combout\)) # (!\rs_addr[2]~input_o\ & ((\Rs|Mux12~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datac => \Rs|Mux12~1_combout\,
	datad => \Rs|Mux12~3_combout\,
	combout => \Rs|Mux12~4_combout\);

-- Location: IOIBUF_X52_Y10_N1
\wr_data[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(4),
	o => \wr_data[4]~input_o\);

-- Location: FF_X34_Y7_N27
\R4|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(4));

-- Location: FF_X34_Y7_N17
\R6|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(4));

-- Location: LCCOMB_X34_Y7_N16
\Rs|Mux11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux11~0_combout\ = (\rs_addr[0]~input_o\ & (((\rs_addr[1]~input_o\)))) # (!\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\ & ((\R6|Dout\(4)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|Dout\(4),
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(4),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux11~0_combout\);

-- Location: FF_X35_Y7_N9
\R5|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(4));

-- Location: FF_X35_Y7_N19
\R7|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(4));

-- Location: LCCOMB_X35_Y7_N8
\Rs|Mux11~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux11~1_combout\ = (\Rs|Mux11~0_combout\ & (((\R7|Dout\(4))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux11~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux11~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(4),
	datad => \R7|Dout\(4),
	combout => \Rs|Mux11~1_combout\);

-- Location: FF_X35_Y8_N3
\R3|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(4));

-- Location: FF_X35_Y8_N9
\R2|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(4));

-- Location: FF_X36_Y8_N27
\R0|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(4));

-- Location: FF_X36_Y8_N25
\R1|Dout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[4]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(4));

-- Location: LCCOMB_X36_Y8_N24
\Rs|Mux11~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux11~2_combout\ = (\rs_addr[0]~input_o\ & (((\R1|Dout\(4)) # (\rs_addr[1]~input_o\)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(4) & ((!\rs_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R0|Dout\(4),
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(4),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux11~2_combout\);

-- Location: LCCOMB_X35_Y8_N8
\Rs|Mux11~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux11~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux11~2_combout\ & (\R3|Dout\(4))) # (!\Rs|Mux11~2_combout\ & ((\R2|Dout\(4)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux11~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R3|Dout\(4),
	datac => \R2|Dout\(4),
	datad => \Rs|Mux11~2_combout\,
	combout => \Rs|Mux11~3_combout\);

-- Location: LCCOMB_X35_Y8_N12
\Rs|Mux11~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux11~4_combout\ = (\rs_addr[2]~input_o\ & (\Rs|Mux11~1_combout\)) # (!\rs_addr[2]~input_o\ & ((\Rs|Mux11~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux11~1_combout\,
	datab => \rs_addr[2]~input_o\,
	datad => \Rs|Mux11~3_combout\,
	combout => \Rs|Mux11~4_combout\);

-- Location: IOIBUF_X34_Y0_N8
\wr_data[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(5),
	o => \wr_data[5]~input_o\);

-- Location: FF_X35_Y8_N25
\R3|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(5));

-- Location: FF_X35_Y8_N7
\R2|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(5));

-- Location: FF_X36_Y8_N23
\R0|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(5));

-- Location: FF_X36_Y8_N13
\R1|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(5));

-- Location: LCCOMB_X36_Y8_N12
\Rs|Mux10~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux10~2_combout\ = (\rs_addr[0]~input_o\ & (((\R1|Dout\(5)) # (\rs_addr[1]~input_o\)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(5) & ((!\rs_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R0|Dout\(5),
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(5),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux10~2_combout\);

-- Location: LCCOMB_X35_Y8_N6
\Rs|Mux10~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux10~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux10~2_combout\ & (\R3|Dout\(5))) # (!\Rs|Mux10~2_combout\ & ((\R2|Dout\(5)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux10~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R3|Dout\(5),
	datac => \R2|Dout\(5),
	datad => \Rs|Mux10~2_combout\,
	combout => \Rs|Mux10~3_combout\);

-- Location: FF_X35_Y7_N15
\R7|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(5));

-- Location: FF_X35_Y7_N5
\R5|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(5));

-- Location: FF_X34_Y7_N31
\R4|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(5));

-- Location: FF_X34_Y7_N21
\R6|Dout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[5]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(5));

-- Location: LCCOMB_X34_Y7_N20
\Rs|Mux10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux10~0_combout\ = (\rs_addr[0]~input_o\ & (((\rs_addr[1]~input_o\)))) # (!\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\ & ((\R6|Dout\(5)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|Dout\(5),
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(5),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux10~0_combout\);

-- Location: LCCOMB_X35_Y7_N4
\Rs|Mux10~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux10~1_combout\ = (\rs_addr[0]~input_o\ & ((\Rs|Mux10~0_combout\ & (\R7|Dout\(5))) # (!\Rs|Mux10~0_combout\ & ((\R5|Dout\(5)))))) # (!\rs_addr[0]~input_o\ & (((\Rs|Mux10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \R7|Dout\(5),
	datac => \R5|Dout\(5),
	datad => \Rs|Mux10~0_combout\,
	combout => \Rs|Mux10~1_combout\);

-- Location: LCCOMB_X35_Y7_N24
\Rs|Mux10~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux10~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux10~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux10~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux10~3_combout\,
	datab => \Rs|Mux10~1_combout\,
	datac => \rs_addr[2]~input_o\,
	combout => \Rs|Mux10~4_combout\);

-- Location: IOIBUF_X52_Y13_N1
\wr_data[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(6),
	o => \wr_data[6]~input_o\);

-- Location: FF_X36_Y8_N1
\R1|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(6));

-- Location: FF_X36_Y8_N3
\R0|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(6));

-- Location: LCCOMB_X36_Y8_N0
\Rs|Mux9~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux9~2_combout\ = (\rs_addr[1]~input_o\ & (\rs_addr[0]~input_o\)) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & (\R1|Dout\(6))) # (!\rs_addr[0]~input_o\ & ((\R0|Dout\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(6),
	datad => \R0|Dout\(6),
	combout => \Rs|Mux9~2_combout\);

-- Location: FF_X37_Y8_N1
\R2|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(6));

-- Location: FF_X37_Y8_N27
\R3|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(6));

-- Location: LCCOMB_X37_Y8_N0
\Rs|Mux9~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux9~3_combout\ = (\Rs|Mux9~2_combout\ & (((\R3|Dout\(6))) # (!\rs_addr[1]~input_o\))) # (!\Rs|Mux9~2_combout\ & (\rs_addr[1]~input_o\ & (\R2|Dout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux9~2_combout\,
	datab => \rs_addr[1]~input_o\,
	datac => \R2|Dout\(6),
	datad => \R3|Dout\(6),
	combout => \Rs|Mux9~3_combout\);

-- Location: FF_X34_Y7_N9
\R6|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(6));

-- Location: FF_X34_Y7_N19
\R4|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(6));

-- Location: LCCOMB_X34_Y7_N8
\Rs|Mux9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux9~0_combout\ = (\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\) # ((\R6|Dout\(6))))) # (!\rs_addr[1]~input_o\ & (!\rs_addr[0]~input_o\ & ((\R4|Dout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(6),
	datad => \R4|Dout\(6),
	combout => \Rs|Mux9~0_combout\);

-- Location: FF_X35_Y7_N27
\R5|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(6));

-- Location: FF_X35_Y7_N21
\R7|Dout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[6]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(6));

-- Location: LCCOMB_X35_Y7_N26
\Rs|Mux9~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux9~1_combout\ = (\Rs|Mux9~0_combout\ & (((\R7|Dout\(6))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux9~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux9~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(6),
	datad => \R7|Dout\(6),
	combout => \Rs|Mux9~1_combout\);

-- Location: LCCOMB_X37_Y8_N4
\Rs|Mux9~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux9~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux9~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux9~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datab => \Rs|Mux9~3_combout\,
	datac => \Rs|Mux9~1_combout\,
	combout => \Rs|Mux9~4_combout\);

-- Location: IOIBUF_X52_Y9_N8
\wr_data[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(7),
	o => \wr_data[7]~input_o\);

-- Location: FF_X37_Y8_N25
\R3|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(7));

-- Location: FF_X36_Y8_N29
\R1|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(7));

-- Location: FF_X36_Y8_N15
\R0|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(7));

-- Location: LCCOMB_X36_Y8_N28
\Rs|Mux8~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux8~2_combout\ = (\rs_addr[1]~input_o\ & (\rs_addr[0]~input_o\)) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & (\R1|Dout\(7))) # (!\rs_addr[0]~input_o\ & ((\R0|Dout\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R1|Dout\(7),
	datad => \R0|Dout\(7),
	combout => \Rs|Mux8~2_combout\);

-- Location: FF_X37_Y8_N15
\R2|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(7));

-- Location: LCCOMB_X37_Y8_N14
\Rs|Mux8~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux8~3_combout\ = (\Rs|Mux8~2_combout\ & ((\R3|Dout\(7)) # ((!\rs_addr[1]~input_o\)))) # (!\Rs|Mux8~2_combout\ & (((\R2|Dout\(7) & \rs_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|Dout\(7),
	datab => \Rs|Mux8~2_combout\,
	datac => \R2|Dout\(7),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux8~3_combout\);

-- Location: FF_X34_Y7_N15
\R4|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(7));

-- Location: FF_X34_Y7_N29
\R6|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(7));

-- Location: LCCOMB_X34_Y7_N28
\Rs|Mux8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux8~0_combout\ = (\rs_addr[1]~input_o\ & (((\R6|Dout\(7)) # (\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(7) & ((!\rs_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R4|Dout\(7),
	datac => \R6|Dout\(7),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux8~0_combout\);

-- Location: FF_X35_Y7_N31
\R5|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(7));

-- Location: FF_X35_Y7_N1
\R7|Dout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[7]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(7));

-- Location: LCCOMB_X35_Y7_N30
\Rs|Mux8~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux8~1_combout\ = (\rs_addr[0]~input_o\ & ((\Rs|Mux8~0_combout\ & ((\R7|Dout\(7)))) # (!\Rs|Mux8~0_combout\ & (\R5|Dout\(7))))) # (!\rs_addr[0]~input_o\ & (\Rs|Mux8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \Rs|Mux8~0_combout\,
	datac => \R5|Dout\(7),
	datad => \R7|Dout\(7),
	combout => \Rs|Mux8~1_combout\);

-- Location: LCCOMB_X37_Y8_N2
\Rs|Mux8~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux8~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux8~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux8~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux8~3_combout\,
	datab => \Rs|Mux8~1_combout\,
	datad => \rs_addr[2]~input_o\,
	combout => \Rs|Mux8~4_combout\);

-- Location: IOIBUF_X46_Y0_N8
\wr_data[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(8),
	o => \wr_data[8]~input_o\);

-- Location: FF_X37_Y8_N23
\R3|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(8));

-- Location: FF_X37_Y8_N13
\R2|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(8));

-- Location: FF_X36_Y7_N17
\R1|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(8));

-- Location: FF_X36_Y7_N11
\R0|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(8));

-- Location: LCCOMB_X36_Y7_N16
\Rs|Mux7~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux7~2_combout\ = (\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\) # ((\R1|Dout\(8))))) # (!\rs_addr[0]~input_o\ & (!\rs_addr[1]~input_o\ & ((\R0|Dout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \rs_addr[1]~input_o\,
	datac => \R1|Dout\(8),
	datad => \R0|Dout\(8),
	combout => \Rs|Mux7~2_combout\);

-- Location: LCCOMB_X37_Y8_N12
\Rs|Mux7~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux7~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux7~2_combout\ & (\R3|Dout\(8))) # (!\Rs|Mux7~2_combout\ & ((\R2|Dout\(8)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|Dout\(8),
	datab => \rs_addr[1]~input_o\,
	datac => \R2|Dout\(8),
	datad => \Rs|Mux7~2_combout\,
	combout => \Rs|Mux7~3_combout\);

-- Location: FF_X39_Y7_N1
\R6|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(8));

-- Location: FF_X39_Y7_N11
\R4|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(8));

-- Location: LCCOMB_X39_Y7_N0
\Rs|Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux7~0_combout\ = (\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\) # ((\R6|Dout\(8))))) # (!\rs_addr[1]~input_o\ & (!\rs_addr[0]~input_o\ & ((\R4|Dout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \rs_addr[0]~input_o\,
	datac => \R6|Dout\(8),
	datad => \R4|Dout\(8),
	combout => \Rs|Mux7~0_combout\);

-- Location: FF_X35_Y7_N11
\R5|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(8));

-- Location: FF_X35_Y7_N13
\R7|Dout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[8]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(8));

-- Location: LCCOMB_X35_Y7_N10
\Rs|Mux7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux7~1_combout\ = (\Rs|Mux7~0_combout\ & (((\R7|Dout\(8))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux7~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux7~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(8),
	datad => \R7|Dout\(8),
	combout => \Rs|Mux7~1_combout\);

-- Location: LCCOMB_X37_Y8_N8
\Rs|Mux7~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux7~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux7~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux7~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datab => \Rs|Mux7~3_combout\,
	datac => \Rs|Mux7~1_combout\,
	combout => \Rs|Mux7~4_combout\);

-- Location: IOIBUF_X52_Y11_N1
\wr_data[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(9),
	o => \wr_data[9]~input_o\);

-- Location: FF_X36_Y7_N23
\R0|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(9));

-- Location: FF_X36_Y7_N5
\R1|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(9));

-- Location: LCCOMB_X36_Y7_N4
\Rs|Mux6~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux6~2_combout\ = (\rs_addr[1]~input_o\ & (((\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & ((\R1|Dout\(9)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R0|Dout\(9),
	datab => \rs_addr[1]~input_o\,
	datac => \R1|Dout\(9),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux6~2_combout\);

-- Location: FF_X37_Y8_N11
\R2|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(9));

-- Location: FF_X37_Y8_N29
\R3|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(9));

-- Location: LCCOMB_X37_Y8_N10
\Rs|Mux6~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux6~3_combout\ = (\Rs|Mux6~2_combout\ & (((\R3|Dout\(9))) # (!\rs_addr[1]~input_o\))) # (!\Rs|Mux6~2_combout\ & (\rs_addr[1]~input_o\ & (\R2|Dout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux6~2_combout\,
	datab => \rs_addr[1]~input_o\,
	datac => \R2|Dout\(9),
	datad => \R3|Dout\(9),
	combout => \Rs|Mux6~3_combout\);

-- Location: FF_X39_Y7_N15
\R4|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(9));

-- Location: FF_X39_Y7_N13
\R6|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(9));

-- Location: LCCOMB_X39_Y7_N12
\Rs|Mux6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux6~0_combout\ = (\rs_addr[1]~input_o\ & (((\R6|Dout\(9)) # (\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(9) & ((!\rs_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R4|Dout\(9),
	datac => \R6|Dout\(9),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux6~0_combout\);

-- Location: FF_X38_Y7_N9
\R5|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(9));

-- Location: FF_X38_Y7_N19
\R7|Dout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[9]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(9));

-- Location: LCCOMB_X38_Y7_N8
\Rs|Mux6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux6~1_combout\ = (\Rs|Mux6~0_combout\ & (((\R7|Dout\(9))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux6~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux6~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(9),
	datad => \R7|Dout\(9),
	combout => \Rs|Mux6~1_combout\);

-- Location: LCCOMB_X37_Y8_N30
\Rs|Mux6~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux6~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux6~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux6~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rs|Mux6~3_combout\,
	datac => \Rs|Mux6~1_combout\,
	datad => \rs_addr[2]~input_o\,
	combout => \Rs|Mux6~4_combout\);

-- Location: IOIBUF_X38_Y0_N8
\wr_data[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(10),
	o => \wr_data[10]~input_o\);

-- Location: FF_X39_Y7_N27
\R4|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(10));

-- Location: FF_X39_Y7_N17
\R6|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(10));

-- Location: LCCOMB_X39_Y7_N16
\Rs|Mux5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux5~0_combout\ = (\rs_addr[1]~input_o\ & (((\R6|Dout\(10)) # (\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(10) & ((!\rs_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|Dout\(10),
	datab => \rs_addr[1]~input_o\,
	datac => \R6|Dout\(10),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux5~0_combout\);

-- Location: FF_X35_Y7_N23
\R5|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(10));

-- Location: FF_X35_Y7_N17
\R7|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(10));

-- Location: LCCOMB_X35_Y7_N22
\Rs|Mux5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux5~1_combout\ = (\Rs|Mux5~0_combout\ & (((\R7|Dout\(10))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux5~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux5~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(10),
	datad => \R7|Dout\(10),
	combout => \Rs|Mux5~1_combout\);

-- Location: FF_X37_Y7_N27
\R3|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(10));

-- Location: FF_X37_Y7_N25
\R2|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(10));

-- Location: FF_X36_Y7_N3
\R0|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(10));

-- Location: FF_X36_Y7_N9
\R1|Dout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[10]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(10));

-- Location: LCCOMB_X36_Y7_N8
\Rs|Mux5~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux5~2_combout\ = (\rs_addr[1]~input_o\ & (((\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & ((\R1|Dout\(10)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R0|Dout\(10),
	datac => \R1|Dout\(10),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux5~2_combout\);

-- Location: LCCOMB_X37_Y7_N24
\Rs|Mux5~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux5~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux5~2_combout\ & (\R3|Dout\(10))) # (!\Rs|Mux5~2_combout\ & ((\R2|Dout\(10)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R3|Dout\(10),
	datab => \rs_addr[1]~input_o\,
	datac => \R2|Dout\(10),
	datad => \Rs|Mux5~2_combout\,
	combout => \Rs|Mux5~3_combout\);

-- Location: LCCOMB_X35_Y7_N2
\Rs|Mux5~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux5~4_combout\ = (\rs_addr[2]~input_o\ & (\Rs|Mux5~1_combout\)) # (!\rs_addr[2]~input_o\ & ((\Rs|Mux5~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rs|Mux5~1_combout\,
	datac => \rs_addr[2]~input_o\,
	datad => \Rs|Mux5~3_combout\,
	combout => \Rs|Mux5~4_combout\);

-- Location: IOIBUF_X43_Y0_N1
\wr_data[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(11),
	o => \wr_data[11]~input_o\);

-- Location: FF_X36_Y7_N15
\R0|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(11));

-- Location: FF_X36_Y7_N29
\R1|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(11));

-- Location: LCCOMB_X36_Y7_N28
\Rs|Mux4~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux4~2_combout\ = (\rs_addr[1]~input_o\ & (((\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & ((\R1|Dout\(11)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R0|Dout\(11),
	datac => \R1|Dout\(11),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux4~2_combout\);

-- Location: FF_X37_Y7_N29
\R2|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(11));

-- Location: FF_X37_Y7_N7
\R3|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(11));

-- Location: LCCOMB_X37_Y7_N28
\Rs|Mux4~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux4~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux4~2_combout\ & ((\R3|Dout\(11)))) # (!\Rs|Mux4~2_combout\ & (\R2|Dout\(11))))) # (!\rs_addr[1]~input_o\ & (\Rs|Mux4~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \Rs|Mux4~2_combout\,
	datac => \R2|Dout\(11),
	datad => \R3|Dout\(11),
	combout => \Rs|Mux4~3_combout\);

-- Location: FF_X39_Y7_N23
\R4|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(11));

-- Location: FF_X39_Y7_N29
\R6|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(11));

-- Location: LCCOMB_X39_Y7_N28
\Rs|Mux4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux4~0_combout\ = (\rs_addr[1]~input_o\ & (((\R6|Dout\(11)) # (\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(11) & ((!\rs_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|Dout\(11),
	datab => \rs_addr[1]~input_o\,
	datac => \R6|Dout\(11),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux4~0_combout\);

-- Location: FF_X38_Y7_N13
\R5|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(11));

-- Location: FF_X38_Y7_N15
\R7|Dout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[11]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(11));

-- Location: LCCOMB_X38_Y7_N12
\Rs|Mux4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux4~1_combout\ = (\Rs|Mux4~0_combout\ & (((\R7|Dout\(11))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux4~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux4~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(11),
	datad => \R7|Dout\(11),
	combout => \Rs|Mux4~1_combout\);

-- Location: LCCOMB_X37_Y7_N0
\Rs|Mux4~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux4~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux4~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux4~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux4~3_combout\,
	datab => \rs_addr[2]~input_o\,
	datac => \Rs|Mux4~1_combout\,
	combout => \Rs|Mux4~4_combout\);

-- Location: IOIBUF_X41_Y0_N15
\wr_data[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(12),
	o => \wr_data[12]~input_o\);

-- Location: FF_X37_Y7_N13
\R3|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(12));

-- Location: FF_X37_Y7_N3
\R2|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(12));

-- Location: FF_X36_Y7_N19
\R0|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(12));

-- Location: FF_X36_Y7_N25
\R1|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(12));

-- Location: LCCOMB_X36_Y7_N24
\Rs|Mux3~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux3~2_combout\ = (\rs_addr[1]~input_o\ & (((\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & ((\R1|Dout\(12)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R0|Dout\(12),
	datac => \R1|Dout\(12),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux3~2_combout\);

-- Location: LCCOMB_X37_Y7_N2
\Rs|Mux3~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux3~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux3~2_combout\ & (\R3|Dout\(12))) # (!\Rs|Mux3~2_combout\ & ((\R2|Dout\(12)))))) # (!\rs_addr[1]~input_o\ & (((\Rs|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \R3|Dout\(12),
	datac => \R2|Dout\(12),
	datad => \Rs|Mux3~2_combout\,
	combout => \Rs|Mux3~3_combout\);

-- Location: FF_X38_Y7_N3
\R7|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(12));

-- Location: FF_X38_Y7_N25
\R5|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(12));

-- Location: FF_X39_Y7_N25
\R6|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(12));

-- Location: FF_X39_Y7_N3
\R4|Dout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[12]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(12));

-- Location: LCCOMB_X39_Y7_N24
\Rs|Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux3~0_combout\ = (\rs_addr[0]~input_o\ & (\rs_addr[1]~input_o\)) # (!\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\ & (\R6|Dout\(12))) # (!\rs_addr[1]~input_o\ & ((\R4|Dout\(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \rs_addr[1]~input_o\,
	datac => \R6|Dout\(12),
	datad => \R4|Dout\(12),
	combout => \Rs|Mux3~0_combout\);

-- Location: LCCOMB_X38_Y7_N24
\Rs|Mux3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux3~1_combout\ = (\rs_addr[0]~input_o\ & ((\Rs|Mux3~0_combout\ & (\R7|Dout\(12))) # (!\Rs|Mux3~0_combout\ & ((\R5|Dout\(12)))))) # (!\rs_addr[0]~input_o\ & (((\Rs|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \R7|Dout\(12),
	datac => \R5|Dout\(12),
	datad => \Rs|Mux3~0_combout\,
	combout => \Rs|Mux3~1_combout\);

-- Location: LCCOMB_X37_Y7_N22
\Rs|Mux3~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux3~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux3~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux3~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rs_addr[2]~input_o\,
	datac => \Rs|Mux3~3_combout\,
	datad => \Rs|Mux3~1_combout\,
	combout => \Rs|Mux3~4_combout\);

-- Location: IOIBUF_X43_Y0_N8
\wr_data[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(13),
	o => \wr_data[13]~input_o\);

-- Location: FF_X36_Y7_N31
\R0|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(13));

-- Location: FF_X36_Y7_N13
\R1|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(13));

-- Location: LCCOMB_X36_Y7_N12
\Rs|Mux2~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux2~2_combout\ = (\rs_addr[1]~input_o\ & (((\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & ((\R1|Dout\(13)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R0|Dout\(13),
	datab => \rs_addr[1]~input_o\,
	datac => \R1|Dout\(13),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux2~2_combout\);

-- Location: FF_X37_Y7_N19
\R3|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(13));

-- Location: FF_X37_Y7_N17
\R2|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(13));

-- Location: LCCOMB_X37_Y7_N16
\Rs|Mux2~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux2~3_combout\ = (\Rs|Mux2~2_combout\ & ((\R3|Dout\(13)) # ((!\rs_addr[1]~input_o\)))) # (!\Rs|Mux2~2_combout\ & (((\R2|Dout\(13) & \rs_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux2~2_combout\,
	datab => \R3|Dout\(13),
	datac => \R2|Dout\(13),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux2~3_combout\);

-- Location: FF_X39_Y7_N31
\R4|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(13));

-- Location: FF_X39_Y7_N21
\R6|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(13));

-- Location: LCCOMB_X39_Y7_N20
\Rs|Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux2~0_combout\ = (\rs_addr[1]~input_o\ & (((\R6|Dout\(13)) # (\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & (\R4|Dout\(13) & ((!\rs_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R4|Dout\(13),
	datab => \rs_addr[1]~input_o\,
	datac => \R6|Dout\(13),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux2~0_combout\);

-- Location: FF_X38_Y7_N21
\R5|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(13));

-- Location: FF_X38_Y7_N23
\R7|Dout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[13]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(13));

-- Location: LCCOMB_X38_Y7_N20
\Rs|Mux2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux2~1_combout\ = (\Rs|Mux2~0_combout\ & (((\R7|Dout\(13))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux2~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux2~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(13),
	datad => \R7|Dout\(13),
	combout => \Rs|Mux2~1_combout\);

-- Location: LCCOMB_X37_Y7_N4
\Rs|Mux2~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux2~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux2~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux2~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux2~3_combout\,
	datab => \rs_addr[2]~input_o\,
	datac => \Rs|Mux2~1_combout\,
	combout => \Rs|Mux2~4_combout\);

-- Location: IOIBUF_X41_Y0_N1
\wr_data[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(14),
	o => \wr_data[14]~input_o\);

-- Location: FF_X36_Y7_N27
\R0|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(14));

-- Location: FF_X36_Y7_N1
\R1|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(14));

-- Location: LCCOMB_X36_Y7_N0
\Rs|Mux1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux1~2_combout\ = (\rs_addr[1]~input_o\ & (((\rs_addr[0]~input_o\)))) # (!\rs_addr[1]~input_o\ & ((\rs_addr[0]~input_o\ & ((\R1|Dout\(14)))) # (!\rs_addr[0]~input_o\ & (\R0|Dout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R0|Dout\(14),
	datab => \rs_addr[1]~input_o\,
	datac => \R1|Dout\(14),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux1~2_combout\);

-- Location: FF_X37_Y7_N9
\R3|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(14));

-- Location: FF_X37_Y7_N31
\R2|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(14));

-- Location: LCCOMB_X37_Y7_N30
\Rs|Mux1~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux1~3_combout\ = (\Rs|Mux1~2_combout\ & ((\R3|Dout\(14)) # ((!\rs_addr[1]~input_o\)))) # (!\Rs|Mux1~2_combout\ & (((\R2|Dout\(14) & \rs_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux1~2_combout\,
	datab => \R3|Dout\(14),
	datac => \R2|Dout\(14),
	datad => \rs_addr[1]~input_o\,
	combout => \Rs|Mux1~3_combout\);

-- Location: FF_X38_Y7_N27
\R7|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(14));

-- Location: FF_X39_Y7_N9
\R6|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(14));

-- Location: FF_X39_Y7_N19
\R4|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(14));

-- Location: LCCOMB_X39_Y7_N8
\Rs|Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux1~0_combout\ = (\rs_addr[0]~input_o\ & (\rs_addr[1]~input_o\)) # (!\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\ & (\R6|Dout\(14))) # (!\rs_addr[1]~input_o\ & ((\R4|Dout\(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \rs_addr[1]~input_o\,
	datac => \R6|Dout\(14),
	datad => \R4|Dout\(14),
	combout => \Rs|Mux1~0_combout\);

-- Location: FF_X38_Y7_N17
\R5|Dout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[14]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(14));

-- Location: LCCOMB_X38_Y7_N16
\Rs|Mux1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux1~1_combout\ = (\Rs|Mux1~0_combout\ & ((\R7|Dout\(14)) # ((!\rs_addr[0]~input_o\)))) # (!\Rs|Mux1~0_combout\ & (((\R5|Dout\(14) & \rs_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R7|Dout\(14),
	datab => \Rs|Mux1~0_combout\,
	datac => \R5|Dout\(14),
	datad => \rs_addr[0]~input_o\,
	combout => \Rs|Mux1~1_combout\);

-- Location: LCCOMB_X32_Y7_N0
\Rs|Mux1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux1~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux1~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datac => \Rs|Mux1~3_combout\,
	datad => \Rs|Mux1~1_combout\,
	combout => \Rs|Mux1~4_combout\);

-- Location: IOIBUF_X52_Y13_N8
\wr_data[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wr_data(15),
	o => \wr_data[15]~input_o\);

-- Location: FF_X36_Y7_N21
\R1|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R1|Dout\(15));

-- Location: FF_X36_Y7_N7
\R0|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[0]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R0|Dout\(15));

-- Location: LCCOMB_X36_Y7_N20
\Rs|Mux0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux0~2_combout\ = (\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\) # ((\R1|Dout\(15))))) # (!\rs_addr[0]~input_o\ & (!\rs_addr[1]~input_o\ & ((\R0|Dout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \rs_addr[1]~input_o\,
	datac => \R1|Dout\(15),
	datad => \R0|Dout\(15),
	combout => \Rs|Mux0~2_combout\);

-- Location: FF_X37_Y7_N11
\R2|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R2|Dout\(15));

-- Location: FF_X37_Y7_N21
\R3|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R3|Dout\(15));

-- Location: LCCOMB_X37_Y7_N10
\Rs|Mux0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux0~3_combout\ = (\rs_addr[1]~input_o\ & ((\Rs|Mux0~2_combout\ & ((\R3|Dout\(15)))) # (!\Rs|Mux0~2_combout\ & (\R2|Dout\(15))))) # (!\rs_addr[1]~input_o\ & (\Rs|Mux0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[1]~input_o\,
	datab => \Rs|Mux0~2_combout\,
	datac => \R2|Dout\(15),
	datad => \R3|Dout\(15),
	combout => \Rs|Mux0~3_combout\);

-- Location: FF_X39_Y7_N5
\R6|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R6|Dout\(15));

-- Location: FF_X39_Y7_N7
\R4|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R4|Dout\(15));

-- Location: LCCOMB_X39_Y7_N4
\Rs|Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux0~0_combout\ = (\rs_addr[0]~input_o\ & (\rs_addr[1]~input_o\)) # (!\rs_addr[0]~input_o\ & ((\rs_addr[1]~input_o\ & (\R6|Dout\(15))) # (!\rs_addr[1]~input_o\ & ((\R4|Dout\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[0]~input_o\,
	datab => \rs_addr[1]~input_o\,
	datac => \R6|Dout\(15),
	datad => \R4|Dout\(15),
	combout => \Rs|Mux0~0_combout\);

-- Location: FF_X38_Y7_N29
\R5|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R5|Dout\(15));

-- Location: FF_X38_Y7_N31
\R7|Dout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \wr_data[15]~input_o\,
	clrn => \rst~inputclkctrl_outclk\,
	sload => VCC,
	ena => \D0|Dout[7]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \R7|Dout\(15));

-- Location: LCCOMB_X38_Y7_N28
\Rs|Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux0~1_combout\ = (\Rs|Mux0~0_combout\ & (((\R7|Dout\(15))) # (!\rs_addr[0]~input_o\))) # (!\Rs|Mux0~0_combout\ & (\rs_addr[0]~input_o\ & (\R5|Dout\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rs|Mux0~0_combout\,
	datab => \rs_addr[0]~input_o\,
	datac => \R5|Dout\(15),
	datad => \R7|Dout\(15),
	combout => \Rs|Mux0~1_combout\);

-- Location: LCCOMB_X32_Y7_N26
\Rs|Mux0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rs|Mux0~4_combout\ = (\rs_addr[2]~input_o\ & ((\Rs|Mux0~1_combout\))) # (!\rs_addr[2]~input_o\ & (\Rs|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs_addr[2]~input_o\,
	datac => \Rs|Mux0~3_combout\,
	datad => \Rs|Mux0~1_combout\,
	combout => \Rs|Mux0~4_combout\);

-- Location: IOIBUF_X41_Y0_N8
\rt_addr[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rt_addr(1),
	o => \rt_addr[1]~input_o\);

-- Location: IOIBUF_X36_Y0_N1
\rt_addr[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rt_addr(0),
	o => \rt_addr[0]~input_o\);

-- Location: LCCOMB_X36_Y8_N18
\Rt|Mux15~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux15~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(0)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(0),
	datad => \R1|Dout\(0),
	combout => \Rt|Mux15~2_combout\);

-- Location: LCCOMB_X35_Y8_N26
\Rt|Mux15~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux15~3_combout\ = (\Rt|Mux15~2_combout\ & (((\R3|Dout\(0)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux15~2_combout\ & (\R2|Dout\(0) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux15~2_combout\,
	datab => \R2|Dout\(0),
	datac => \R3|Dout\(0),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux15~3_combout\);

-- Location: LCCOMB_X34_Y7_N10
\Rt|Mux15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux15~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(0))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(0),
	datac => \R4|Dout\(0),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux15~0_combout\);

-- Location: LCCOMB_X34_Y8_N10
\Rt|Mux15~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux15~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux15~0_combout\ & ((\R7|Dout\(0)))) # (!\Rt|Mux15~0_combout\ & (\R5|Dout\(0))))) # (!\rt_addr[0]~input_o\ & (((\Rt|Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R5|Dout\(0),
	datac => \R7|Dout\(0),
	datad => \Rt|Mux15~0_combout\,
	combout => \Rt|Mux15~1_combout\);

-- Location: IOIBUF_X52_Y9_N1
\rt_addr[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rt_addr(2),
	o => \rt_addr[2]~input_o\);

-- Location: LCCOMB_X34_Y8_N24
\Rt|Mux15~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux15~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux15~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux15~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rt|Mux15~3_combout\,
	datac => \Rt|Mux15~1_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux15~4_combout\);

-- Location: LCCOMB_X34_Y7_N6
\Rt|Mux14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux14~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(1))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(1),
	datac => \R4|Dout\(1),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux14~0_combout\);

-- Location: LCCOMB_X34_Y8_N8
\Rt|Mux14~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux14~1_combout\ = (\Rt|Mux14~0_combout\ & (((\R7|Dout\(1)) # (!\rt_addr[0]~input_o\)))) # (!\Rt|Mux14~0_combout\ & (\R5|Dout\(1) & ((\rt_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux14~0_combout\,
	datab => \R5|Dout\(1),
	datac => \R7|Dout\(1),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux14~1_combout\);

-- Location: LCCOMB_X36_Y8_N6
\Rt|Mux14~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux14~2_combout\ = (\rt_addr[1]~input_o\ & (((\rt_addr[0]~input_o\)))) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & (\R1|Dout\(1))) # (!\rt_addr[0]~input_o\ & ((\R0|Dout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \R1|Dout\(1),
	datac => \R0|Dout\(1),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux14~2_combout\);

-- Location: LCCOMB_X35_Y8_N22
\Rt|Mux14~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux14~3_combout\ = (\Rt|Mux14~2_combout\ & (((\R3|Dout\(1)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux14~2_combout\ & (\R2|Dout\(1) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux14~2_combout\,
	datab => \R2|Dout\(1),
	datac => \R3|Dout\(1),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux14~3_combout\);

-- Location: LCCOMB_X34_Y8_N2
\Rt|Mux14~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux14~4_combout\ = (\rt_addr[2]~input_o\ & (\Rt|Mux14~1_combout\)) # (!\rt_addr[2]~input_o\ & ((\Rt|Mux14~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rt|Mux14~1_combout\,
	datac => \Rt|Mux14~3_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux14~4_combout\);

-- Location: LCCOMB_X36_Y8_N10
\Rt|Mux13~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux13~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(2)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(2),
	datad => \R1|Dout\(2),
	combout => \Rt|Mux13~2_combout\);

-- Location: LCCOMB_X35_Y8_N18
\Rt|Mux13~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux13~3_combout\ = (\Rt|Mux13~2_combout\ & (((\R3|Dout\(2)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux13~2_combout\ & (\R2|Dout\(2) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux13~2_combout\,
	datab => \R2|Dout\(2),
	datac => \R3|Dout\(2),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux13~3_combout\);

-- Location: LCCOMB_X34_Y7_N2
\Rt|Mux13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux13~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(2))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(2),
	datac => \R4|Dout\(2),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux13~0_combout\);

-- Location: LCCOMB_X34_Y8_N30
\Rt|Mux13~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux13~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux13~0_combout\ & (\R7|Dout\(2))) # (!\Rt|Mux13~0_combout\ & ((\R5|Dout\(2)))))) # (!\rt_addr[0]~input_o\ & (\Rt|Mux13~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \Rt|Mux13~0_combout\,
	datac => \R7|Dout\(2),
	datad => \R5|Dout\(2),
	combout => \Rt|Mux13~1_combout\);

-- Location: LCCOMB_X34_Y8_N4
\Rt|Mux13~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux13~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux13~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux13~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rt|Mux13~3_combout\,
	datac => \Rt|Mux13~1_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux13~4_combout\);

-- Location: LCCOMB_X36_Y8_N30
\Rt|Mux12~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux12~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(3)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(3),
	datad => \R1|Dout\(3),
	combout => \Rt|Mux12~2_combout\);

-- Location: LCCOMB_X35_Y8_N30
\Rt|Mux12~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux12~3_combout\ = (\rt_addr[1]~input_o\ & ((\Rt|Mux12~2_combout\ & (\R3|Dout\(3))) # (!\Rt|Mux12~2_combout\ & ((\R2|Dout\(3)))))) # (!\rt_addr[1]~input_o\ & (\Rt|Mux12~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \Rt|Mux12~2_combout\,
	datac => \R3|Dout\(3),
	datad => \R2|Dout\(3),
	combout => \Rt|Mux12~3_combout\);

-- Location: LCCOMB_X34_Y7_N22
\Rt|Mux12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux12~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(3))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(3),
	datac => \R4|Dout\(3),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux12~0_combout\);

-- Location: LCCOMB_X34_Y8_N20
\Rt|Mux12~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux12~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux12~0_combout\ & (\R7|Dout\(3))) # (!\Rt|Mux12~0_combout\ & ((\R5|Dout\(3)))))) # (!\rt_addr[0]~input_o\ & (\Rt|Mux12~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \Rt|Mux12~0_combout\,
	datac => \R7|Dout\(3),
	datad => \R5|Dout\(3),
	combout => \Rt|Mux12~1_combout\);

-- Location: LCCOMB_X35_Y8_N10
\Rt|Mux12~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux12~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux12~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux12~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux12~3_combout\,
	datab => \Rt|Mux12~1_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux12~4_combout\);

-- Location: LCCOMB_X34_Y7_N26
\Rt|Mux11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux11~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(4))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(4),
	datac => \R4|Dout\(4),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux11~0_combout\);

-- Location: LCCOMB_X35_Y7_N18
\Rt|Mux11~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux11~1_combout\ = (\Rt|Mux11~0_combout\ & (((\R7|Dout\(4)) # (!\rt_addr[0]~input_o\)))) # (!\Rt|Mux11~0_combout\ & (\R5|Dout\(4) & ((\rt_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux11~0_combout\,
	datab => \R5|Dout\(4),
	datac => \R7|Dout\(4),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux11~1_combout\);

-- Location: LCCOMB_X36_Y8_N26
\Rt|Mux11~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux11~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(4)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(4),
	datad => \R1|Dout\(4),
	combout => \Rt|Mux11~2_combout\);

-- Location: LCCOMB_X35_Y8_N2
\Rt|Mux11~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux11~3_combout\ = (\Rt|Mux11~2_combout\ & (((\R3|Dout\(4)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux11~2_combout\ & (\R2|Dout\(4) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux11~2_combout\,
	datab => \R2|Dout\(4),
	datac => \R3|Dout\(4),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux11~3_combout\);

-- Location: LCCOMB_X35_Y8_N20
\Rt|Mux11~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux11~4_combout\ = (\rt_addr[2]~input_o\ & (\Rt|Mux11~1_combout\)) # (!\rt_addr[2]~input_o\ & ((\Rt|Mux11~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux11~1_combout\,
	datab => \rt_addr[2]~input_o\,
	datac => \Rt|Mux11~3_combout\,
	combout => \Rt|Mux11~4_combout\);

-- Location: LCCOMB_X36_Y8_N22
\Rt|Mux10~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux10~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(5)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(5),
	datad => \R1|Dout\(5),
	combout => \Rt|Mux10~2_combout\);

-- Location: LCCOMB_X35_Y8_N24
\Rt|Mux10~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux10~3_combout\ = (\Rt|Mux10~2_combout\ & (((\R3|Dout\(5))) # (!\rt_addr[1]~input_o\))) # (!\Rt|Mux10~2_combout\ & (\rt_addr[1]~input_o\ & ((\R2|Dout\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux10~2_combout\,
	datab => \rt_addr[1]~input_o\,
	datac => \R3|Dout\(5),
	datad => \R2|Dout\(5),
	combout => \Rt|Mux10~3_combout\);

-- Location: LCCOMB_X34_Y7_N30
\Rt|Mux10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux10~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(5))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(5),
	datac => \R4|Dout\(5),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux10~0_combout\);

-- Location: LCCOMB_X35_Y7_N14
\Rt|Mux10~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux10~1_combout\ = (\Rt|Mux10~0_combout\ & (((\R7|Dout\(5)) # (!\rt_addr[0]~input_o\)))) # (!\Rt|Mux10~0_combout\ & (\R5|Dout\(5) & ((\rt_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R5|Dout\(5),
	datab => \Rt|Mux10~0_combout\,
	datac => \R7|Dout\(5),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux10~1_combout\);

-- Location: LCCOMB_X35_Y8_N14
\Rt|Mux10~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux10~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux10~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux10~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rt|Mux10~3_combout\,
	datac => \Rt|Mux10~1_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux10~4_combout\);

-- Location: LCCOMB_X36_Y8_N2
\Rt|Mux9~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux9~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(6)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(6),
	datad => \R1|Dout\(6),
	combout => \Rt|Mux9~2_combout\);

-- Location: LCCOMB_X37_Y8_N26
\Rt|Mux9~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux9~3_combout\ = (\Rt|Mux9~2_combout\ & (((\R3|Dout\(6)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux9~2_combout\ & (\R2|Dout\(6) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux9~2_combout\,
	datab => \R2|Dout\(6),
	datac => \R3|Dout\(6),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux9~3_combout\);

-- Location: LCCOMB_X34_Y7_N18
\Rt|Mux9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux9~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(6))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(6),
	datac => \R4|Dout\(6),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux9~0_combout\);

-- Location: LCCOMB_X35_Y7_N20
\Rt|Mux9~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux9~1_combout\ = (\Rt|Mux9~0_combout\ & (((\R7|Dout\(6)) # (!\rt_addr[0]~input_o\)))) # (!\Rt|Mux9~0_combout\ & (\R5|Dout\(6) & ((\rt_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R5|Dout\(6),
	datab => \Rt|Mux9~0_combout\,
	datac => \R7|Dout\(6),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux9~1_combout\);

-- Location: LCCOMB_X37_Y8_N16
\Rt|Mux9~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux9~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux9~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux9~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux9~3_combout\,
	datac => \Rt|Mux9~1_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux9~4_combout\);

-- Location: LCCOMB_X34_Y7_N14
\Rt|Mux8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux8~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(7))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(7),
	datac => \R4|Dout\(7),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux8~0_combout\);

-- Location: LCCOMB_X35_Y7_N0
\Rt|Mux8~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux8~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux8~0_combout\ & ((\R7|Dout\(7)))) # (!\Rt|Mux8~0_combout\ & (\R5|Dout\(7))))) # (!\rt_addr[0]~input_o\ & (((\Rt|Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R5|Dout\(7),
	datab => \rt_addr[0]~input_o\,
	datac => \R7|Dout\(7),
	datad => \Rt|Mux8~0_combout\,
	combout => \Rt|Mux8~1_combout\);

-- Location: LCCOMB_X36_Y8_N14
\Rt|Mux8~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux8~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(7)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(7),
	datad => \R1|Dout\(7),
	combout => \Rt|Mux8~2_combout\);

-- Location: LCCOMB_X37_Y8_N24
\Rt|Mux8~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux8~3_combout\ = (\Rt|Mux8~2_combout\ & (((\R3|Dout\(7)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux8~2_combout\ & (\R2|Dout\(7) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux8~2_combout\,
	datab => \R2|Dout\(7),
	datac => \R3|Dout\(7),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux8~3_combout\);

-- Location: LCCOMB_X37_Y8_N18
\Rt|Mux8~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux8~4_combout\ = (\rt_addr[2]~input_o\ & (\Rt|Mux8~1_combout\)) # (!\rt_addr[2]~input_o\ & ((\Rt|Mux8~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux8~1_combout\,
	datab => \Rt|Mux8~3_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux8~4_combout\);

-- Location: LCCOMB_X36_Y7_N10
\Rt|Mux7~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux7~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(8)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(8),
	datad => \R1|Dout\(8),
	combout => \Rt|Mux7~2_combout\);

-- Location: LCCOMB_X37_Y8_N22
\Rt|Mux7~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux7~3_combout\ = (\Rt|Mux7~2_combout\ & (((\R3|Dout\(8)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux7~2_combout\ & (\R2|Dout\(8) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|Dout\(8),
	datab => \Rt|Mux7~2_combout\,
	datac => \R3|Dout\(8),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux7~3_combout\);

-- Location: LCCOMB_X39_Y7_N10
\Rt|Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux7~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(8))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R6|Dout\(8),
	datab => \rt_addr[0]~input_o\,
	datac => \R4|Dout\(8),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux7~0_combout\);

-- Location: LCCOMB_X35_Y7_N12
\Rt|Mux7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux7~1_combout\ = (\Rt|Mux7~0_combout\ & (((\R7|Dout\(8)) # (!\rt_addr[0]~input_o\)))) # (!\Rt|Mux7~0_combout\ & (\R5|Dout\(8) & ((\rt_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R5|Dout\(8),
	datab => \Rt|Mux7~0_combout\,
	datac => \R7|Dout\(8),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux7~1_combout\);

-- Location: LCCOMB_X35_Y7_N28
\Rt|Mux7~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux7~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux7~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux7~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux7~3_combout\,
	datab => \Rt|Mux7~1_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux7~4_combout\);

-- Location: LCCOMB_X36_Y7_N22
\Rt|Mux6~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux6~2_combout\ = (\rt_addr[1]~input_o\ & (((\rt_addr[0]~input_o\)))) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & (\R1|Dout\(9))) # (!\rt_addr[0]~input_o\ & ((\R0|Dout\(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \R1|Dout\(9),
	datac => \R0|Dout\(9),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux6~2_combout\);

-- Location: LCCOMB_X37_Y8_N28
\Rt|Mux6~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux6~3_combout\ = (\Rt|Mux6~2_combout\ & (((\R3|Dout\(9)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux6~2_combout\ & (\R2|Dout\(9) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|Dout\(9),
	datab => \Rt|Mux6~2_combout\,
	datac => \R3|Dout\(9),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux6~3_combout\);

-- Location: LCCOMB_X39_Y7_N14
\Rt|Mux6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux6~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(9))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R6|Dout\(9),
	datab => \rt_addr[0]~input_o\,
	datac => \R4|Dout\(9),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux6~0_combout\);

-- Location: LCCOMB_X38_Y7_N18
\Rt|Mux6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux6~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux6~0_combout\ & ((\R7|Dout\(9)))) # (!\Rt|Mux6~0_combout\ & (\R5|Dout\(9))))) # (!\rt_addr[0]~input_o\ & (((\Rt|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R5|Dout\(9),
	datac => \R7|Dout\(9),
	datad => \Rt|Mux6~0_combout\,
	combout => \Rt|Mux6~1_combout\);

-- Location: LCCOMB_X37_Y8_N20
\Rt|Mux6~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux6~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux6~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux6~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rt|Mux6~3_combout\,
	datac => \Rt|Mux6~1_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux6~4_combout\);

-- Location: LCCOMB_X39_Y7_N26
\Rt|Mux5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux5~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(10))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(10),
	datac => \R4|Dout\(10),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux5~0_combout\);

-- Location: LCCOMB_X35_Y7_N16
\Rt|Mux5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux5~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux5~0_combout\ & ((\R7|Dout\(10)))) # (!\Rt|Mux5~0_combout\ & (\R5|Dout\(10))))) # (!\rt_addr[0]~input_o\ & (((\Rt|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R5|Dout\(10),
	datab => \rt_addr[0]~input_o\,
	datac => \R7|Dout\(10),
	datad => \Rt|Mux5~0_combout\,
	combout => \Rt|Mux5~1_combout\);

-- Location: LCCOMB_X36_Y7_N2
\Rt|Mux5~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux5~2_combout\ = (\rt_addr[1]~input_o\ & (((\rt_addr[0]~input_o\)))) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & (\R1|Dout\(10))) # (!\rt_addr[0]~input_o\ & ((\R0|Dout\(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \R1|Dout\(10),
	datac => \R0|Dout\(10),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux5~2_combout\);

-- Location: LCCOMB_X37_Y7_N26
\Rt|Mux5~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux5~3_combout\ = (\Rt|Mux5~2_combout\ & (((\R3|Dout\(10)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux5~2_combout\ & (\R2|Dout\(10) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux5~2_combout\,
	datab => \R2|Dout\(10),
	datac => \R3|Dout\(10),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux5~3_combout\);

-- Location: LCCOMB_X35_Y7_N6
\Rt|Mux5~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux5~4_combout\ = (\rt_addr[2]~input_o\ & (\Rt|Mux5~1_combout\)) # (!\rt_addr[2]~input_o\ & ((\Rt|Mux5~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rt|Mux5~1_combout\,
	datac => \Rt|Mux5~3_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux5~4_combout\);

-- Location: LCCOMB_X36_Y7_N14
\Rt|Mux4~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux4~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(11)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(11),
	datad => \R1|Dout\(11),
	combout => \Rt|Mux4~2_combout\);

-- Location: LCCOMB_X37_Y7_N6
\Rt|Mux4~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux4~3_combout\ = (\Rt|Mux4~2_combout\ & (((\R3|Dout\(11)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux4~2_combout\ & (\R2|Dout\(11) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux4~2_combout\,
	datab => \R2|Dout\(11),
	datac => \R3|Dout\(11),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux4~3_combout\);

-- Location: LCCOMB_X39_Y7_N22
\Rt|Mux4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux4~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(11))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(11),
	datac => \R4|Dout\(11),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux4~0_combout\);

-- Location: LCCOMB_X38_Y7_N14
\Rt|Mux4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux4~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux4~0_combout\ & (\R7|Dout\(11))) # (!\Rt|Mux4~0_combout\ & ((\R5|Dout\(11)))))) # (!\rt_addr[0]~input_o\ & (\Rt|Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \Rt|Mux4~0_combout\,
	datac => \R7|Dout\(11),
	datad => \R5|Dout\(11),
	combout => \Rt|Mux4~1_combout\);

-- Location: LCCOMB_X38_Y7_N0
\Rt|Mux4~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux4~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux4~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux4~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux4~3_combout\,
	datab => \Rt|Mux4~1_combout\,
	datac => \rt_addr[2]~input_o\,
	combout => \Rt|Mux4~4_combout\);

-- Location: LCCOMB_X39_Y7_N2
\Rt|Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux3~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(12))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(12),
	datac => \R4|Dout\(12),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux3~0_combout\);

-- Location: LCCOMB_X38_Y7_N2
\Rt|Mux3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux3~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux3~0_combout\ & ((\R7|Dout\(12)))) # (!\Rt|Mux3~0_combout\ & (\R5|Dout\(12))))) # (!\rt_addr[0]~input_o\ & (((\Rt|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R5|Dout\(12),
	datac => \R7|Dout\(12),
	datad => \Rt|Mux3~0_combout\,
	combout => \Rt|Mux3~1_combout\);

-- Location: LCCOMB_X36_Y7_N18
\Rt|Mux3~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux3~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(12)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(12),
	datad => \R1|Dout\(12),
	combout => \Rt|Mux3~2_combout\);

-- Location: LCCOMB_X37_Y7_N12
\Rt|Mux3~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux3~3_combout\ = (\rt_addr[1]~input_o\ & ((\Rt|Mux3~2_combout\ & ((\R3|Dout\(12)))) # (!\Rt|Mux3~2_combout\ & (\R2|Dout\(12))))) # (!\rt_addr[1]~input_o\ & (((\Rt|Mux3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \R2|Dout\(12),
	datac => \R3|Dout\(12),
	datad => \Rt|Mux3~2_combout\,
	combout => \Rt|Mux3~3_combout\);

-- Location: LCCOMB_X37_Y7_N14
\Rt|Mux3~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux3~4_combout\ = (\rt_addr[2]~input_o\ & (\Rt|Mux3~1_combout\)) # (!\rt_addr[2]~input_o\ & ((\Rt|Mux3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux3~1_combout\,
	datac => \Rt|Mux3~3_combout\,
	datad => \rt_addr[2]~input_o\,
	combout => \Rt|Mux3~4_combout\);

-- Location: LCCOMB_X36_Y7_N30
\Rt|Mux2~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux2~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(13)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(13),
	datad => \R1|Dout\(13),
	combout => \Rt|Mux2~2_combout\);

-- Location: LCCOMB_X37_Y7_N18
\Rt|Mux2~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux2~3_combout\ = (\rt_addr[1]~input_o\ & ((\Rt|Mux2~2_combout\ & ((\R3|Dout\(13)))) # (!\Rt|Mux2~2_combout\ & (\R2|Dout\(13))))) # (!\rt_addr[1]~input_o\ & (((\Rt|Mux2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \R2|Dout\(13),
	datac => \R3|Dout\(13),
	datad => \Rt|Mux2~2_combout\,
	combout => \Rt|Mux2~3_combout\);

-- Location: LCCOMB_X39_Y7_N30
\Rt|Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux2~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(13))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(13),
	datac => \R4|Dout\(13),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux2~0_combout\);

-- Location: LCCOMB_X38_Y7_N22
\Rt|Mux2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux2~1_combout\ = (\Rt|Mux2~0_combout\ & (((\R7|Dout\(13)) # (!\rt_addr[0]~input_o\)))) # (!\Rt|Mux2~0_combout\ & (\R5|Dout\(13) & ((\rt_addr[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Rt|Mux2~0_combout\,
	datab => \R5|Dout\(13),
	datac => \R7|Dout\(13),
	datad => \rt_addr[0]~input_o\,
	combout => \Rt|Mux2~1_combout\);

-- Location: LCCOMB_X38_Y7_N10
\Rt|Mux2~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux2~4_combout\ = (\rt_addr[2]~input_o\ & ((\Rt|Mux2~1_combout\))) # (!\rt_addr[2]~input_o\ & (\Rt|Mux2~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[2]~input_o\,
	datab => \Rt|Mux2~3_combout\,
	datac => \Rt|Mux2~1_combout\,
	combout => \Rt|Mux2~4_combout\);

-- Location: LCCOMB_X39_Y7_N18
\Rt|Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux1~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(14))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R6|Dout\(14),
	datac => \R4|Dout\(14),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux1~0_combout\);

-- Location: LCCOMB_X38_Y7_N26
\Rt|Mux1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux1~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux1~0_combout\ & ((\R7|Dout\(14)))) # (!\Rt|Mux1~0_combout\ & (\R5|Dout\(14))))) # (!\rt_addr[0]~input_o\ & (((\Rt|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R5|Dout\(14),
	datac => \R7|Dout\(14),
	datad => \Rt|Mux1~0_combout\,
	combout => \Rt|Mux1~1_combout\);

-- Location: LCCOMB_X36_Y7_N26
\Rt|Mux1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux1~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(14)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(14),
	datad => \R1|Dout\(14),
	combout => \Rt|Mux1~2_combout\);

-- Location: LCCOMB_X37_Y7_N8
\Rt|Mux1~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux1~3_combout\ = (\Rt|Mux1~2_combout\ & (((\R3|Dout\(14)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux1~2_combout\ & (\R2|Dout\(14) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|Dout\(14),
	datab => \Rt|Mux1~2_combout\,
	datac => \R3|Dout\(14),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux1~3_combout\);

-- Location: LCCOMB_X38_Y7_N4
\Rt|Mux1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux1~4_combout\ = (\rt_addr[2]~input_o\ & (\Rt|Mux1~1_combout\)) # (!\rt_addr[2]~input_o\ & ((\Rt|Mux1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Rt|Mux1~1_combout\,
	datac => \rt_addr[2]~input_o\,
	datad => \Rt|Mux1~3_combout\,
	combout => \Rt|Mux1~4_combout\);

-- Location: LCCOMB_X39_Y7_N6
\Rt|Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux0~0_combout\ = (\rt_addr[0]~input_o\ & (((\rt_addr[1]~input_o\)))) # (!\rt_addr[0]~input_o\ & ((\rt_addr[1]~input_o\ & (\R6|Dout\(15))) # (!\rt_addr[1]~input_o\ & ((\R4|Dout\(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R6|Dout\(15),
	datab => \rt_addr[0]~input_o\,
	datac => \R4|Dout\(15),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux0~0_combout\);

-- Location: LCCOMB_X38_Y7_N30
\Rt|Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux0~1_combout\ = (\rt_addr[0]~input_o\ & ((\Rt|Mux0~0_combout\ & ((\R7|Dout\(15)))) # (!\Rt|Mux0~0_combout\ & (\R5|Dout\(15))))) # (!\rt_addr[0]~input_o\ & (((\Rt|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[0]~input_o\,
	datab => \R5|Dout\(15),
	datac => \R7|Dout\(15),
	datad => \Rt|Mux0~0_combout\,
	combout => \Rt|Mux0~1_combout\);

-- Location: LCCOMB_X36_Y7_N6
\Rt|Mux0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux0~2_combout\ = (\rt_addr[1]~input_o\ & (\rt_addr[0]~input_o\)) # (!\rt_addr[1]~input_o\ & ((\rt_addr[0]~input_o\ & ((\R1|Dout\(15)))) # (!\rt_addr[0]~input_o\ & (\R0|Dout\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[1]~input_o\,
	datab => \rt_addr[0]~input_o\,
	datac => \R0|Dout\(15),
	datad => \R1|Dout\(15),
	combout => \Rt|Mux0~2_combout\);

-- Location: LCCOMB_X37_Y7_N20
\Rt|Mux0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux0~3_combout\ = (\Rt|Mux0~2_combout\ & (((\R3|Dout\(15)) # (!\rt_addr[1]~input_o\)))) # (!\Rt|Mux0~2_combout\ & (\R2|Dout\(15) & ((\rt_addr[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \R2|Dout\(15),
	datab => \Rt|Mux0~2_combout\,
	datac => \R3|Dout\(15),
	datad => \rt_addr[1]~input_o\,
	combout => \Rt|Mux0~3_combout\);

-- Location: LCCOMB_X38_Y7_N6
\Rt|Mux0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Rt|Mux0~4_combout\ = (\rt_addr[2]~input_o\ & (\Rt|Mux0~1_combout\)) # (!\rt_addr[2]~input_o\ & ((\Rt|Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rt_addr[2]~input_o\,
	datac => \Rt|Mux0~1_combout\,
	datad => \Rt|Mux0~3_combout\,
	combout => \Rt|Mux0~4_combout\);

ww_rs(0) <= \rs[0]~output_o\;

ww_rs(1) <= \rs[1]~output_o\;

ww_rs(2) <= \rs[2]~output_o\;

ww_rs(3) <= \rs[3]~output_o\;

ww_rs(4) <= \rs[4]~output_o\;

ww_rs(5) <= \rs[5]~output_o\;

ww_rs(6) <= \rs[6]~output_o\;

ww_rs(7) <= \rs[7]~output_o\;

ww_rs(8) <= \rs[8]~output_o\;

ww_rs(9) <= \rs[9]~output_o\;

ww_rs(10) <= \rs[10]~output_o\;

ww_rs(11) <= \rs[11]~output_o\;

ww_rs(12) <= \rs[12]~output_o\;

ww_rs(13) <= \rs[13]~output_o\;

ww_rs(14) <= \rs[14]~output_o\;

ww_rs(15) <= \rs[15]~output_o\;

ww_rt(0) <= \rt[0]~output_o\;

ww_rt(1) <= \rt[1]~output_o\;

ww_rt(2) <= \rt[2]~output_o\;

ww_rt(3) <= \rt[3]~output_o\;

ww_rt(4) <= \rt[4]~output_o\;

ww_rt(5) <= \rt[5]~output_o\;

ww_rt(6) <= \rt[6]~output_o\;

ww_rt(7) <= \rt[7]~output_o\;

ww_rt(8) <= \rt[8]~output_o\;

ww_rt(9) <= \rt[9]~output_o\;

ww_rt(10) <= \rt[10]~output_o\;

ww_rt(11) <= \rt[11]~output_o\;

ww_rt(12) <= \rt[12]~output_o\;

ww_rt(13) <= \rt[13]~output_o\;

ww_rt(14) <= \rt[14]~output_o\;

ww_rt(15) <= \rt[15]~output_o\;
END structure;


