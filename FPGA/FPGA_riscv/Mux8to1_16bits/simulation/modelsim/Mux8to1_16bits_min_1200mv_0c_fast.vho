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

-- DATE "11/11/2023 11:08:04"

-- 
-- Device: Altera EP4CGX30CF23C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Mux8to1_16bits IS
    PORT (
	Din0 : IN std_logic_vector(15 DOWNTO 0);
	Din1 : IN std_logic_vector(15 DOWNTO 0);
	Din2 : IN std_logic_vector(15 DOWNTO 0);
	Din3 : IN std_logic_vector(15 DOWNTO 0);
	Din4 : IN std_logic_vector(15 DOWNTO 0);
	Din5 : IN std_logic_vector(15 DOWNTO 0);
	Din6 : IN std_logic_vector(15 DOWNTO 0);
	Din7 : IN std_logic_vector(15 DOWNTO 0);
	Control : IN std_logic_vector(2 DOWNTO 0);
	Dout : OUT std_logic_vector(15 DOWNTO 0)
	);
END Mux8to1_16bits;

-- Design Ports Information
-- Dout[0]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[1]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[2]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[3]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[4]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[5]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[6]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[7]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[8]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[9]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[10]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[11]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[12]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[13]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[14]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[15]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[0]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Control[0]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[0]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Control[1]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[0]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[0]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[0]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[0]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[0]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Control[2]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[1]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[1]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[1]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[1]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[1]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[1]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[1]	=>  Location: PIN_W9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[2]	=>  Location: PIN_AA9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[2]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[2]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[2]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[2]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[2]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[2]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[2]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[3]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[3]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[3]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[3]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[3]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[3]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[3]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[4]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[4]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[4]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[4]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[4]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[4]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[4]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[4]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[5]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[5]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[5]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[5]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[5]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[5]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[5]	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[6]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[6]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[6]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[6]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[6]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[6]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[6]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[7]	=>  Location: PIN_K20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[7]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[7]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[7]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[7]	=>  Location: PIN_N22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[7]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[7]	=>  Location: PIN_L20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[7]	=>  Location: PIN_J21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[8]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[8]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[8]	=>  Location: PIN_H20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[8]	=>  Location: PIN_M19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[8]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[8]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[8]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[8]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[9]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[9]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[9]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[9]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[9]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[9]	=>  Location: PIN_K14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[9]	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[9]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[10]	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[10]	=>  Location: PIN_F20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[10]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[10]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[10]	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[10]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[10]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[10]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[11]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[11]	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[11]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[11]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[11]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[11]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[11]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[11]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[12]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[12]	=>  Location: PIN_K19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[12]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[12]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[12]	=>  Location: PIN_J20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[12]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[12]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[12]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[13]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[13]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[13]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[13]	=>  Location: PIN_D21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[13]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[13]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[13]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[13]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[14]	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[14]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[14]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[14]	=>  Location: PIN_Y20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[14]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[14]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[14]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[14]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din5[15]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din6[15]	=>  Location: PIN_U14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din4[15]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din7[15]	=>  Location: PIN_T19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[15]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[15]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[15]	=>  Location: PIN_T16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[15]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Mux8to1_16bits IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Din0 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Din1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Din2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Din3 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Din4 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Din5 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Din6 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Din7 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Control : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Dout : std_logic_vector(15 DOWNTO 0);
SIGNAL \Dout[0]~output_o\ : std_logic;
SIGNAL \Dout[1]~output_o\ : std_logic;
SIGNAL \Dout[2]~output_o\ : std_logic;
SIGNAL \Dout[3]~output_o\ : std_logic;
SIGNAL \Dout[4]~output_o\ : std_logic;
SIGNAL \Dout[5]~output_o\ : std_logic;
SIGNAL \Dout[6]~output_o\ : std_logic;
SIGNAL \Dout[7]~output_o\ : std_logic;
SIGNAL \Dout[8]~output_o\ : std_logic;
SIGNAL \Dout[9]~output_o\ : std_logic;
SIGNAL \Dout[10]~output_o\ : std_logic;
SIGNAL \Dout[11]~output_o\ : std_logic;
SIGNAL \Dout[12]~output_o\ : std_logic;
SIGNAL \Dout[13]~output_o\ : std_logic;
SIGNAL \Dout[14]~output_o\ : std_logic;
SIGNAL \Dout[15]~output_o\ : std_logic;
SIGNAL \Control[2]~input_o\ : std_logic;
SIGNAL \Din5[0]~input_o\ : std_logic;
SIGNAL \Din7[0]~input_o\ : std_logic;
SIGNAL \Control[0]~input_o\ : std_logic;
SIGNAL \Din4[0]~input_o\ : std_logic;
SIGNAL \Control[1]~input_o\ : std_logic;
SIGNAL \Din6[0]~input_o\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Mux15~1_combout\ : std_logic;
SIGNAL \Din3[0]~input_o\ : std_logic;
SIGNAL \Din2[0]~input_o\ : std_logic;
SIGNAL \Din0[0]~input_o\ : std_logic;
SIGNAL \Din1[0]~input_o\ : std_logic;
SIGNAL \Mux15~2_combout\ : std_logic;
SIGNAL \Mux15~3_combout\ : std_logic;
SIGNAL \Mux15~4_combout\ : std_logic;
SIGNAL \Din4[1]~input_o\ : std_logic;
SIGNAL \Din6[1]~input_o\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \Din5[1]~input_o\ : std_logic;
SIGNAL \Din7[1]~input_o\ : std_logic;
SIGNAL \Mux14~1_combout\ : std_logic;
SIGNAL \Din1[1]~input_o\ : std_logic;
SIGNAL \Din0[1]~input_o\ : std_logic;
SIGNAL \Mux14~2_combout\ : std_logic;
SIGNAL \Din3[1]~input_o\ : std_logic;
SIGNAL \Din2[1]~input_o\ : std_logic;
SIGNAL \Mux14~3_combout\ : std_logic;
SIGNAL \Mux14~4_combout\ : std_logic;
SIGNAL \Din3[2]~input_o\ : std_logic;
SIGNAL \Din2[2]~input_o\ : std_logic;
SIGNAL \Din0[2]~input_o\ : std_logic;
SIGNAL \Din1[2]~input_o\ : std_logic;
SIGNAL \Mux13~2_combout\ : std_logic;
SIGNAL \Mux13~3_combout\ : std_logic;
SIGNAL \Din7[2]~input_o\ : std_logic;
SIGNAL \Din6[2]~input_o\ : std_logic;
SIGNAL \Din4[2]~input_o\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Din5[2]~input_o\ : std_logic;
SIGNAL \Mux13~1_combout\ : std_logic;
SIGNAL \Mux13~4_combout\ : std_logic;
SIGNAL \Din1[3]~input_o\ : std_logic;
SIGNAL \Din0[3]~input_o\ : std_logic;
SIGNAL \Mux12~2_combout\ : std_logic;
SIGNAL \Din3[3]~input_o\ : std_logic;
SIGNAL \Din2[3]~input_o\ : std_logic;
SIGNAL \Mux12~3_combout\ : std_logic;
SIGNAL \Din4[3]~input_o\ : std_logic;
SIGNAL \Din6[3]~input_o\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Din7[3]~input_o\ : std_logic;
SIGNAL \Din5[3]~input_o\ : std_logic;
SIGNAL \Mux12~1_combout\ : std_logic;
SIGNAL \Mux12~4_combout\ : std_logic;
SIGNAL \Din3[4]~input_o\ : std_logic;
SIGNAL \Din2[4]~input_o\ : std_logic;
SIGNAL \Din1[4]~input_o\ : std_logic;
SIGNAL \Din0[4]~input_o\ : std_logic;
SIGNAL \Mux11~2_combout\ : std_logic;
SIGNAL \Mux11~3_combout\ : std_logic;
SIGNAL \Din4[4]~input_o\ : std_logic;
SIGNAL \Din6[4]~input_o\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Din5[4]~input_o\ : std_logic;
SIGNAL \Din7[4]~input_o\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \Mux11~4_combout\ : std_logic;
SIGNAL \Din7[5]~input_o\ : std_logic;
SIGNAL \Din5[5]~input_o\ : std_logic;
SIGNAL \Din4[5]~input_o\ : std_logic;
SIGNAL \Din6[5]~input_o\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux10~1_combout\ : std_logic;
SIGNAL \Din2[5]~input_o\ : std_logic;
SIGNAL \Din3[5]~input_o\ : std_logic;
SIGNAL \Din1[5]~input_o\ : std_logic;
SIGNAL \Din0[5]~input_o\ : std_logic;
SIGNAL \Mux10~2_combout\ : std_logic;
SIGNAL \Mux10~3_combout\ : std_logic;
SIGNAL \Mux10~4_combout\ : std_logic;
SIGNAL \Din7[6]~input_o\ : std_logic;
SIGNAL \Din5[6]~input_o\ : std_logic;
SIGNAL \Din4[6]~input_o\ : std_logic;
SIGNAL \Din6[6]~input_o\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \Din1[6]~input_o\ : std_logic;
SIGNAL \Din0[6]~input_o\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Din2[6]~input_o\ : std_logic;
SIGNAL \Din3[6]~input_o\ : std_logic;
SIGNAL \Mux9~3_combout\ : std_logic;
SIGNAL \Mux9~4_combout\ : std_logic;
SIGNAL \Din0[7]~input_o\ : std_logic;
SIGNAL \Din1[7]~input_o\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \Din3[7]~input_o\ : std_logic;
SIGNAL \Din2[7]~input_o\ : std_logic;
SIGNAL \Mux8~3_combout\ : std_logic;
SIGNAL \Din7[7]~input_o\ : std_logic;
SIGNAL \Din4[7]~input_o\ : std_logic;
SIGNAL \Din6[7]~input_o\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Din5[7]~input_o\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \Mux8~4_combout\ : std_logic;
SIGNAL \Din3[8]~input_o\ : std_logic;
SIGNAL \Din2[8]~input_o\ : std_logic;
SIGNAL \Din0[8]~input_o\ : std_logic;
SIGNAL \Din1[8]~input_o\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \Din6[8]~input_o\ : std_logic;
SIGNAL \Din4[8]~input_o\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Din5[8]~input_o\ : std_logic;
SIGNAL \Din7[8]~input_o\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \Din4[9]~input_o\ : std_logic;
SIGNAL \Din6[9]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Din7[9]~input_o\ : std_logic;
SIGNAL \Din5[9]~input_o\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Din2[9]~input_o\ : std_logic;
SIGNAL \Din0[9]~input_o\ : std_logic;
SIGNAL \Din1[9]~input_o\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Din3[9]~input_o\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \Din1[10]~input_o\ : std_logic;
SIGNAL \Din0[10]~input_o\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Din3[10]~input_o\ : std_logic;
SIGNAL \Din2[10]~input_o\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Din7[10]~input_o\ : std_logic;
SIGNAL \Din6[10]~input_o\ : std_logic;
SIGNAL \Din4[10]~input_o\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Din5[10]~input_o\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~4_combout\ : std_logic;
SIGNAL \Din3[11]~input_o\ : std_logic;
SIGNAL \Din2[11]~input_o\ : std_logic;
SIGNAL \Din0[11]~input_o\ : std_logic;
SIGNAL \Din1[11]~input_o\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \Mux4~3_combout\ : std_logic;
SIGNAL \Din6[11]~input_o\ : std_logic;
SIGNAL \Din4[11]~input_o\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Din7[11]~input_o\ : std_logic;
SIGNAL \Din5[11]~input_o\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Mux4~4_combout\ : std_logic;
SIGNAL \Din1[12]~input_o\ : std_logic;
SIGNAL \Din0[12]~input_o\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Din3[12]~input_o\ : std_logic;
SIGNAL \Din2[12]~input_o\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Din7[12]~input_o\ : std_logic;
SIGNAL \Din4[12]~input_o\ : std_logic;
SIGNAL \Din6[12]~input_o\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Din5[12]~input_o\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux3~4_combout\ : std_logic;
SIGNAL \Din7[13]~input_o\ : std_logic;
SIGNAL \Din4[13]~input_o\ : std_logic;
SIGNAL \Din6[13]~input_o\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Din5[13]~input_o\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Din3[13]~input_o\ : std_logic;
SIGNAL \Din0[13]~input_o\ : std_logic;
SIGNAL \Din1[13]~input_o\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \Din2[13]~input_o\ : std_logic;
SIGNAL \Mux2~3_combout\ : std_logic;
SIGNAL \Mux2~4_combout\ : std_logic;
SIGNAL \Din6[14]~input_o\ : std_logic;
SIGNAL \Din4[14]~input_o\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Din5[14]~input_o\ : std_logic;
SIGNAL \Din7[14]~input_o\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Din2[14]~input_o\ : std_logic;
SIGNAL \Din0[14]~input_o\ : std_logic;
SIGNAL \Din1[14]~input_o\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Din3[14]~input_o\ : std_logic;
SIGNAL \Mux1~3_combout\ : std_logic;
SIGNAL \Mux1~4_combout\ : std_logic;
SIGNAL \Din4[15]~input_o\ : std_logic;
SIGNAL \Din6[15]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Din5[15]~input_o\ : std_logic;
SIGNAL \Din7[15]~input_o\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Din3[15]~input_o\ : std_logic;
SIGNAL \Din2[15]~input_o\ : std_logic;
SIGNAL \Din0[15]~input_o\ : std_logic;
SIGNAL \Din1[15]~input_o\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;

BEGIN

ww_Din0 <= Din0;
ww_Din1 <= Din1;
ww_Din2 <= Din2;
ww_Din3 <= Din3;
ww_Din4 <= Din4;
ww_Din5 <= Din5;
ww_Din6 <= Din6;
ww_Din7 <= Din7;
ww_Control <= Control;
Dout <= ww_Dout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X31_Y0_N9
\Dout[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~4_combout\,
	devoe => ww_devoe,
	o => \Dout[0]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\Dout[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux14~4_combout\,
	devoe => ww_devoe,
	o => \Dout[1]~output_o\);

-- Location: IOOBUF_X33_Y0_N9
\Dout[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux13~4_combout\,
	devoe => ww_devoe,
	o => \Dout[2]~output_o\);

-- Location: IOOBUF_X52_Y67_N9
\Dout[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux12~4_combout\,
	devoe => ww_devoe,
	o => \Dout[3]~output_o\);

-- Location: IOOBUF_X52_Y67_N2
\Dout[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~4_combout\,
	devoe => ww_devoe,
	o => \Dout[4]~output_o\);

-- Location: IOOBUF_X81_Y46_N16
\Dout[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~4_combout\,
	devoe => ww_devoe,
	o => \Dout[5]~output_o\);

-- Location: IOOBUF_X54_Y67_N16
\Dout[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~4_combout\,
	devoe => ww_devoe,
	o => \Dout[6]~output_o\);

-- Location: IOOBUF_X81_Y21_N9
\Dout[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~4_combout\,
	devoe => ww_devoe,
	o => \Dout[7]~output_o\);

-- Location: IOOBUF_X81_Y25_N9
\Dout[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~4_combout\,
	devoe => ww_devoe,
	o => \Dout[8]~output_o\);

-- Location: IOOBUF_X81_Y59_N16
\Dout[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~4_combout\,
	devoe => ww_devoe,
	o => \Dout[9]~output_o\);

-- Location: IOOBUF_X81_Y64_N2
\Dout[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~4_combout\,
	devoe => ww_devoe,
	o => \Dout[10]~output_o\);

-- Location: IOOBUF_X52_Y0_N9
\Dout[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~4_combout\,
	devoe => ww_devoe,
	o => \Dout[11]~output_o\);

-- Location: IOOBUF_X81_Y17_N2
\Dout[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~4_combout\,
	devoe => ww_devoe,
	o => \Dout[12]~output_o\);

-- Location: IOOBUF_X81_Y62_N9
\Dout[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~4_combout\,
	devoe => ww_devoe,
	o => \Dout[13]~output_o\);

-- Location: IOOBUF_X52_Y0_N2
\Dout[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~4_combout\,
	devoe => ww_devoe,
	o => \Dout[14]~output_o\);

-- Location: IOOBUF_X54_Y0_N9
\Dout[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~4_combout\,
	devoe => ww_devoe,
	o => \Dout[15]~output_o\);

-- Location: IOIBUF_X33_Y67_N1
\Control[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Control(2),
	o => \Control[2]~input_o\);

-- Location: IOIBUF_X19_Y0_N15
\Din5[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(0),
	o => \Din5[0]~input_o\);

-- Location: IOIBUF_X22_Y0_N8
\Din7[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(0),
	o => \Din7[0]~input_o\);

-- Location: IOIBUF_X33_Y67_N22
\Control[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Control(0),
	o => \Control[0]~input_o\);

-- Location: IOIBUF_X33_Y67_N8
\Din4[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(0),
	o => \Din4[0]~input_o\);

-- Location: IOIBUF_X81_Y4_N8
\Control[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Control(1),
	o => \Control[1]~input_o\);

-- Location: IOIBUF_X31_Y0_N15
\Din6[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(0),
	o => \Din6[0]~input_o\);

-- Location: LCCOMB_X33_Y1_N0
\Mux15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[0]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din4[0]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din6[0]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: LCCOMB_X33_Y1_N2
\Mux15~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux15~1_combout\ = (\Control[0]~input_o\ & ((\Mux15~0_combout\ & ((\Din7[0]~input_o\))) # (!\Mux15~0_combout\ & (\Din5[0]~input_o\)))) # (!\Control[0]~input_o\ & (((\Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din5[0]~input_o\,
	datab => \Din7[0]~input_o\,
	datac => \Control[0]~input_o\,
	datad => \Mux15~0_combout\,
	combout => \Mux15~1_combout\);

-- Location: IOIBUF_X29_Y0_N15
\Din3[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(0),
	o => \Din3[0]~input_o\);

-- Location: IOIBUF_X22_Y0_N15
\Din2[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(0),
	o => \Din2[0]~input_o\);

-- Location: IOIBUF_X42_Y0_N15
\Din0[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(0),
	o => \Din0[0]~input_o\);

-- Location: IOIBUF_X33_Y0_N15
\Din1[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(0),
	o => \Din1[0]~input_o\);

-- Location: LCCOMB_X33_Y1_N28
\Mux15~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux15~2_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[0]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[0]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[0]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[0]~input_o\,
	combout => \Mux15~2_combout\);

-- Location: LCCOMB_X33_Y1_N14
\Mux15~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux15~3_combout\ = (\Control[1]~input_o\ & ((\Mux15~2_combout\ & (\Din3[0]~input_o\)) # (!\Mux15~2_combout\ & ((\Din2[0]~input_o\))))) # (!\Control[1]~input_o\ & (((\Mux15~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[0]~input_o\,
	datab => \Din2[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Mux15~2_combout\,
	combout => \Mux15~3_combout\);

-- Location: LCCOMB_X33_Y1_N24
\Mux15~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux15~4_combout\ = (\Control[2]~input_o\ & (\Mux15~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux15~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[2]~input_o\,
	datab => \Mux15~1_combout\,
	datac => \Mux15~3_combout\,
	combout => \Mux15~4_combout\);

-- Location: IOIBUF_X40_Y0_N8
\Din4[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(1),
	o => \Din4[1]~input_o\);

-- Location: IOIBUF_X31_Y0_N22
\Din6[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(1),
	o => \Din6[1]~input_o\);

-- Location: LCCOMB_X33_Y1_N10
\Mux14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[1]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din4[1]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din6[1]~input_o\,
	combout => \Mux14~0_combout\);

-- Location: IOIBUF_X33_Y0_N1
\Din5[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(1),
	o => \Din5[1]~input_o\);

-- Location: IOIBUF_X42_Y0_N1
\Din7[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(1),
	o => \Din7[1]~input_o\);

-- Location: LCCOMB_X33_Y1_N20
\Mux14~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux14~1_combout\ = (\Mux14~0_combout\ & (((\Din7[1]~input_o\)) # (!\Control[0]~input_o\))) # (!\Mux14~0_combout\ & (\Control[0]~input_o\ & (\Din5[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux14~0_combout\,
	datab => \Control[0]~input_o\,
	datac => \Din5[1]~input_o\,
	datad => \Din7[1]~input_o\,
	combout => \Mux14~1_combout\);

-- Location: IOIBUF_X40_Y0_N1
\Din1[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(1),
	o => \Din1[1]~input_o\);

-- Location: IOIBUF_X31_Y67_N15
\Din0[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(1),
	o => \Din0[1]~input_o\);

-- Location: LCCOMB_X33_Y1_N22
\Mux14~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux14~2_combout\ = (\Control[0]~input_o\ & ((\Din1[1]~input_o\) # ((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (((!\Control[1]~input_o\ & \Din0[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din1[1]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din0[1]~input_o\,
	combout => \Mux14~2_combout\);

-- Location: IOIBUF_X24_Y0_N1
\Din3[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(1),
	o => \Din3[1]~input_o\);

-- Location: IOIBUF_X26_Y0_N15
\Din2[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(1),
	o => \Din2[1]~input_o\);

-- Location: LCCOMB_X33_Y1_N8
\Mux14~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux14~3_combout\ = (\Mux14~2_combout\ & ((\Din3[1]~input_o\) # ((!\Control[1]~input_o\)))) # (!\Mux14~2_combout\ & (((\Control[1]~input_o\ & \Din2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux14~2_combout\,
	datab => \Din3[1]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din2[1]~input_o\,
	combout => \Mux14~3_combout\);

-- Location: LCCOMB_X33_Y1_N26
\Mux14~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux14~4_combout\ = (\Control[2]~input_o\ & (\Mux14~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux14~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[2]~input_o\,
	datab => \Mux14~1_combout\,
	datac => \Mux14~3_combout\,
	combout => \Mux14~4_combout\);

-- Location: IOIBUF_X42_Y0_N8
\Din3[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(2),
	o => \Din3[2]~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\Din2[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(2),
	o => \Din2[2]~input_o\);

-- Location: IOIBUF_X44_Y0_N8
\Din0[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(2),
	o => \Din0[2]~input_o\);

-- Location: IOIBUF_X29_Y0_N8
\Din1[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(2),
	o => \Din1[2]~input_o\);

-- Location: LCCOMB_X33_Y1_N16
\Mux13~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux13~2_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[2]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[2]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[2]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[2]~input_o\,
	combout => \Mux13~2_combout\);

-- Location: LCCOMB_X33_Y1_N18
\Mux13~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux13~3_combout\ = (\Control[1]~input_o\ & ((\Mux13~2_combout\ & (\Din3[2]~input_o\)) # (!\Mux13~2_combout\ & ((\Din2[2]~input_o\))))) # (!\Control[1]~input_o\ & (((\Mux13~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[2]~input_o\,
	datab => \Din2[2]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Mux13~2_combout\,
	combout => \Mux13~3_combout\);

-- Location: IOIBUF_X29_Y0_N1
\Din7[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(2),
	o => \Din7[2]~input_o\);

-- Location: IOIBUF_X31_Y67_N8
\Din6[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(2),
	o => \Din6[2]~input_o\);

-- Location: IOIBUF_X33_Y0_N22
\Din4[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(2),
	o => \Din4[2]~input_o\);

-- Location: LCCOMB_X33_Y1_N4
\Mux13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & (\Din6[2]~input_o\)) # (!\Control[1]~input_o\ & ((\Din4[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din6[2]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din4[2]~input_o\,
	combout => \Mux13~0_combout\);

-- Location: IOIBUF_X26_Y0_N1
\Din5[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(2),
	o => \Din5[2]~input_o\);

-- Location: LCCOMB_X33_Y1_N30
\Mux13~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux13~1_combout\ = (\Mux13~0_combout\ & ((\Din7[2]~input_o\) # ((!\Control[0]~input_o\)))) # (!\Mux13~0_combout\ & (((\Control[0]~input_o\ & \Din5[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din7[2]~input_o\,
	datab => \Mux13~0_combout\,
	datac => \Control[0]~input_o\,
	datad => \Din5[2]~input_o\,
	combout => \Mux13~1_combout\);

-- Location: LCCOMB_X33_Y1_N12
\Mux13~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux13~4_combout\ = (\Control[2]~input_o\ & ((\Mux13~1_combout\))) # (!\Control[2]~input_o\ & (\Mux13~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[2]~input_o\,
	datab => \Mux13~3_combout\,
	datac => \Mux13~1_combout\,
	combout => \Mux13~4_combout\);

-- Location: IOIBUF_X22_Y0_N1
\Din1[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(3),
	o => \Din1[3]~input_o\);

-- Location: IOIBUF_X40_Y0_N15
\Din0[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(3),
	o => \Din0[3]~input_o\);

-- Location: LCCOMB_X33_Y1_N6
\Mux12~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux12~2_combout\ = (\Control[0]~input_o\ & ((\Din1[3]~input_o\) # ((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (((!\Control[1]~input_o\ & \Din0[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din1[3]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din0[3]~input_o\,
	combout => \Mux12~2_combout\);

-- Location: IOIBUF_X61_Y67_N8
\Din3[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(3),
	o => \Din3[3]~input_o\);

-- Location: IOIBUF_X56_Y67_N8
\Din2[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(3),
	o => \Din2[3]~input_o\);

-- Location: LCCOMB_X57_Y66_N28
\Mux12~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux12~3_combout\ = (\Mux12~2_combout\ & ((\Din3[3]~input_o\) # ((!\Control[1]~input_o\)))) # (!\Mux12~2_combout\ & (((\Din2[3]~input_o\ & \Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux12~2_combout\,
	datab => \Din3[3]~input_o\,
	datac => \Din2[3]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux12~3_combout\);

-- Location: IOIBUF_X61_Y67_N1
\Din4[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(3),
	o => \Din4[3]~input_o\);

-- Location: IOIBUF_X54_Y67_N1
\Din6[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(3),
	o => \Din6[3]~input_o\);

-- Location: LCCOMB_X57_Y66_N16
\Mux12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[3]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din4[3]~input_o\,
	datac => \Din6[3]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: IOIBUF_X54_Y67_N8
\Din7[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(3),
	o => \Din7[3]~input_o\);

-- Location: IOIBUF_X70_Y67_N15
\Din5[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(3),
	o => \Din5[3]~input_o\);

-- Location: LCCOMB_X57_Y66_N10
\Mux12~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux12~1_combout\ = (\Control[0]~input_o\ & ((\Mux12~0_combout\ & (\Din7[3]~input_o\)) # (!\Mux12~0_combout\ & ((\Din5[3]~input_o\))))) # (!\Control[0]~input_o\ & (\Mux12~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux12~0_combout\,
	datac => \Din7[3]~input_o\,
	datad => \Din5[3]~input_o\,
	combout => \Mux12~1_combout\);

-- Location: LCCOMB_X57_Y66_N22
\Mux12~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux12~4_combout\ = (\Control[2]~input_o\ & ((\Mux12~1_combout\))) # (!\Control[2]~input_o\ & (\Mux12~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux12~3_combout\,
	datac => \Control[2]~input_o\,
	datad => \Mux12~1_combout\,
	combout => \Mux12~4_combout\);

-- Location: IOIBUF_X54_Y67_N22
\Din3[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(4),
	o => \Din3[4]~input_o\);

-- Location: IOIBUF_X52_Y67_N22
\Din2[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(4),
	o => \Din2[4]~input_o\);

-- Location: IOIBUF_X58_Y67_N22
\Din1[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(4),
	o => \Din1[4]~input_o\);

-- Location: IOIBUF_X65_Y67_N1
\Din0[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(4),
	o => \Din0[4]~input_o\);

-- Location: LCCOMB_X57_Y66_N4
\Mux11~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux11~2_combout\ = (\Control[0]~input_o\ & ((\Din1[4]~input_o\) # ((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (((\Din0[4]~input_o\ & !\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din1[4]~input_o\,
	datac => \Din0[4]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux11~2_combout\);

-- Location: LCCOMB_X57_Y66_N14
\Mux11~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux11~3_combout\ = (\Mux11~2_combout\ & ((\Din3[4]~input_o\) # ((!\Control[1]~input_o\)))) # (!\Mux11~2_combout\ & (((\Din2[4]~input_o\ & \Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[4]~input_o\,
	datab => \Din2[4]~input_o\,
	datac => \Mux11~2_combout\,
	datad => \Control[1]~input_o\,
	combout => \Mux11~3_combout\);

-- Location: IOIBUF_X70_Y67_N22
\Din4[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(4),
	o => \Din4[4]~input_o\);

-- Location: IOIBUF_X63_Y67_N15
\Din6[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(4),
	o => \Din6[4]~input_o\);

-- Location: LCCOMB_X57_Y66_N8
\Mux11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[4]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din4[4]~input_o\,
	datac => \Din6[4]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: IOIBUF_X56_Y67_N1
\Din5[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(4),
	o => \Din5[4]~input_o\);

-- Location: IOIBUF_X58_Y67_N8
\Din7[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(4),
	o => \Din7[4]~input_o\);

-- Location: LCCOMB_X57_Y66_N18
\Mux11~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = (\Control[0]~input_o\ & ((\Mux11~0_combout\ & ((\Din7[4]~input_o\))) # (!\Mux11~0_combout\ & (\Din5[4]~input_o\)))) # (!\Control[0]~input_o\ & (\Mux11~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux11~0_combout\,
	datac => \Din5[4]~input_o\,
	datad => \Din7[4]~input_o\,
	combout => \Mux11~1_combout\);

-- Location: LCCOMB_X57_Y66_N0
\Mux11~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux11~4_combout\ = (\Control[2]~input_o\ & ((\Mux11~1_combout\))) # (!\Control[2]~input_o\ & (\Mux11~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux11~3_combout\,
	datac => \Control[2]~input_o\,
	datad => \Mux11~1_combout\,
	combout => \Mux11~4_combout\);

-- Location: IOIBUF_X56_Y67_N15
\Din7[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(5),
	o => \Din7[5]~input_o\);

-- Location: IOIBUF_X49_Y67_N1
\Din5[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(5),
	o => \Din5[5]~input_o\);

-- Location: IOIBUF_X81_Y34_N15
\Din4[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(5),
	o => \Din4[5]~input_o\);

-- Location: IOIBUF_X81_Y34_N22
\Din6[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(5),
	o => \Din6[5]~input_o\);

-- Location: LCCOMB_X57_Y66_N2
\Mux10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\Control[0]~input_o\ & (\Control[1]~input_o\)) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[5]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din4[5]~input_o\,
	datad => \Din6[5]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X57_Y66_N20
\Mux10~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux10~1_combout\ = (\Control[0]~input_o\ & ((\Mux10~0_combout\ & (\Din7[5]~input_o\)) # (!\Mux10~0_combout\ & ((\Din5[5]~input_o\))))) # (!\Control[0]~input_o\ & (((\Mux10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din7[5]~input_o\,
	datac => \Din5[5]~input_o\,
	datad => \Mux10~0_combout\,
	combout => \Mux10~1_combout\);

-- Location: IOIBUF_X81_Y19_N8
\Din2[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(5),
	o => \Din2[5]~input_o\);

-- Location: IOIBUF_X81_Y34_N1
\Din3[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(5),
	o => \Din3[5]~input_o\);

-- Location: IOIBUF_X81_Y44_N1
\Din1[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(5),
	o => \Din1[5]~input_o\);

-- Location: IOIBUF_X81_Y34_N8
\Din0[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(5),
	o => \Din0[5]~input_o\);

-- Location: LCCOMB_X80_Y31_N16
\Mux10~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux10~2_combout\ = (\Control[0]~input_o\ & ((\Control[1]~input_o\) # ((\Din1[5]~input_o\)))) # (!\Control[0]~input_o\ & (!\Control[1]~input_o\ & ((\Din0[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din1[5]~input_o\,
	datad => \Din0[5]~input_o\,
	combout => \Mux10~2_combout\);

-- Location: LCCOMB_X80_Y31_N26
\Mux10~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux10~3_combout\ = (\Control[1]~input_o\ & ((\Mux10~2_combout\ & ((\Din3[5]~input_o\))) # (!\Mux10~2_combout\ & (\Din2[5]~input_o\)))) # (!\Control[1]~input_o\ & (((\Mux10~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din2[5]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din3[5]~input_o\,
	datad => \Mux10~2_combout\,
	combout => \Mux10~3_combout\);

-- Location: LCCOMB_X80_Y31_N12
\Mux10~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux10~4_combout\ = (\Control[2]~input_o\ & (\Mux10~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux10~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~1_combout\,
	datac => \Mux10~3_combout\,
	datad => \Control[2]~input_o\,
	combout => \Mux10~4_combout\);

-- Location: IOIBUF_X63_Y67_N8
\Din7[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(6),
	o => \Din7[6]~input_o\);

-- Location: IOIBUF_X65_Y67_N8
\Din5[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(6),
	o => \Din5[6]~input_o\);

-- Location: IOIBUF_X68_Y67_N1
\Din4[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(6),
	o => \Din4[6]~input_o\);

-- Location: IOIBUF_X65_Y67_N15
\Din6[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(6),
	o => \Din6[6]~input_o\);

-- Location: LCCOMB_X57_Y66_N6
\Mux9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[6]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din4[6]~input_o\,
	datac => \Din6[6]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X57_Y66_N24
\Mux9~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = (\Control[0]~input_o\ & ((\Mux9~0_combout\ & (\Din7[6]~input_o\)) # (!\Mux9~0_combout\ & ((\Din5[6]~input_o\))))) # (!\Control[0]~input_o\ & (((\Mux9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din7[6]~input_o\,
	datac => \Din5[6]~input_o\,
	datad => \Mux9~0_combout\,
	combout => \Mux9~1_combout\);

-- Location: IOIBUF_X58_Y67_N1
\Din1[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(6),
	o => \Din1[6]~input_o\);

-- Location: IOIBUF_X63_Y67_N1
\Din0[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(6),
	o => \Din0[6]~input_o\);

-- Location: LCCOMB_X57_Y66_N26
\Mux9~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux9~2_combout\ = (\Control[0]~input_o\ & ((\Din1[6]~input_o\) # ((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (((\Din0[6]~input_o\ & !\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din1[6]~input_o\,
	datac => \Din0[6]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux9~2_combout\);

-- Location: IOIBUF_X56_Y67_N22
\Din2[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(6),
	o => \Din2[6]~input_o\);

-- Location: IOIBUF_X58_Y67_N15
\Din3[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(6),
	o => \Din3[6]~input_o\);

-- Location: LCCOMB_X57_Y66_N12
\Mux9~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux9~3_combout\ = (\Mux9~2_combout\ & (((\Din3[6]~input_o\) # (!\Control[1]~input_o\)))) # (!\Mux9~2_combout\ & (\Din2[6]~input_o\ & ((\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~2_combout\,
	datab => \Din2[6]~input_o\,
	datac => \Din3[6]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux9~3_combout\);

-- Location: LCCOMB_X57_Y66_N30
\Mux9~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux9~4_combout\ = (\Control[2]~input_o\ & (\Mux9~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux9~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux9~1_combout\,
	datac => \Control[2]~input_o\,
	datad => \Mux9~3_combout\,
	combout => \Mux9~4_combout\);

-- Location: IOIBUF_X81_Y39_N8
\Din0[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(7),
	o => \Din0[7]~input_o\);

-- Location: IOIBUF_X81_Y25_N15
\Din1[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(7),
	o => \Din1[7]~input_o\);

-- Location: LCCOMB_X80_Y31_N18
\Mux8~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux8~2_combout\ = (\Control[0]~input_o\ & ((\Control[1]~input_o\) # ((\Din1[7]~input_o\)))) # (!\Control[0]~input_o\ & (!\Control[1]~input_o\ & (\Din0[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din0[7]~input_o\,
	datad => \Din1[7]~input_o\,
	combout => \Mux8~2_combout\);

-- Location: IOIBUF_X81_Y44_N8
\Din3[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(7),
	o => \Din3[7]~input_o\);

-- Location: IOIBUF_X81_Y21_N1
\Din2[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(7),
	o => \Din2[7]~input_o\);

-- Location: LCCOMB_X80_Y31_N28
\Mux8~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux8~3_combout\ = (\Mux8~2_combout\ & (((\Din3[7]~input_o\)) # (!\Control[1]~input_o\))) # (!\Mux8~2_combout\ & (\Control[1]~input_o\ & ((\Din2[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux8~2_combout\,
	datab => \Control[1]~input_o\,
	datac => \Din3[7]~input_o\,
	datad => \Din2[7]~input_o\,
	combout => \Mux8~3_combout\);

-- Location: IOIBUF_X81_Y20_N8
\Din7[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(7),
	o => \Din7[7]~input_o\);

-- Location: IOIBUF_X81_Y39_N1
\Din4[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(7),
	o => \Din4[7]~input_o\);

-- Location: IOIBUF_X81_Y41_N1
\Din6[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(7),
	o => \Din6[7]~input_o\);

-- Location: LCCOMB_X80_Y31_N22
\Mux8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\Control[0]~input_o\ & (\Control[1]~input_o\)) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[7]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din4[7]~input_o\,
	datad => \Din6[7]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X81_Y46_N8
\Din5[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(7),
	o => \Din5[7]~input_o\);

-- Location: LCCOMB_X80_Y31_N0
\Mux8~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\Control[0]~input_o\ & ((\Mux8~0_combout\ & (\Din7[7]~input_o\)) # (!\Mux8~0_combout\ & ((\Din5[7]~input_o\))))) # (!\Control[0]~input_o\ & (((\Mux8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din7[7]~input_o\,
	datac => \Mux8~0_combout\,
	datad => \Din5[7]~input_o\,
	combout => \Mux8~1_combout\);

-- Location: LCCOMB_X80_Y31_N6
\Mux8~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux8~4_combout\ = (\Control[2]~input_o\ & ((\Mux8~1_combout\))) # (!\Control[2]~input_o\ & (\Mux8~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[2]~input_o\,
	datab => \Mux8~3_combout\,
	datad => \Mux8~1_combout\,
	combout => \Mux8~4_combout\);

-- Location: IOIBUF_X81_Y49_N8
\Din3[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(8),
	o => \Din3[8]~input_o\);

-- Location: IOIBUF_X81_Y58_N1
\Din2[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(8),
	o => \Din2[8]~input_o\);

-- Location: IOIBUF_X81_Y50_N1
\Din0[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(8),
	o => \Din0[8]~input_o\);

-- Location: IOIBUF_X81_Y52_N1
\Din1[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(8),
	o => \Din1[8]~input_o\);

-- Location: LCCOMB_X80_Y55_N16
\Mux7~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[8]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[8]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[8]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[8]~input_o\,
	combout => \Mux7~2_combout\);

-- Location: LCCOMB_X80_Y55_N10
\Mux7~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = (\Control[1]~input_o\ & ((\Mux7~2_combout\ & (\Din3[8]~input_o\)) # (!\Mux7~2_combout\ & ((\Din2[8]~input_o\))))) # (!\Control[1]~input_o\ & (((\Mux7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[8]~input_o\,
	datab => \Din2[8]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Mux7~2_combout\,
	combout => \Mux7~3_combout\);

-- Location: IOIBUF_X81_Y42_N1
\Din6[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(8),
	o => \Din6[8]~input_o\);

-- Location: IOIBUF_X81_Y47_N1
\Din4[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(8),
	o => \Din4[8]~input_o\);

-- Location: LCCOMB_X80_Y31_N24
\Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Control[0]~input_o\ & (\Control[1]~input_o\)) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & (\Din6[8]~input_o\)) # (!\Control[1]~input_o\ & ((\Din4[8]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din6[8]~input_o\,
	datad => \Din4[8]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: IOIBUF_X81_Y26_N1
\Din5[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(8),
	o => \Din5[8]~input_o\);

-- Location: IOIBUF_X81_Y26_N8
\Din7[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(8),
	o => \Din7[8]~input_o\);

-- Location: LCCOMB_X80_Y31_N2
\Mux7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\Control[0]~input_o\ & ((\Mux7~0_combout\ & ((\Din7[8]~input_o\))) # (!\Mux7~0_combout\ & (\Din5[8]~input_o\)))) # (!\Control[0]~input_o\ & (\Mux7~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux7~0_combout\,
	datac => \Din5[8]~input_o\,
	datad => \Din7[8]~input_o\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X80_Y31_N20
\Mux7~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = (\Control[2]~input_o\ & ((\Mux7~1_combout\))) # (!\Control[2]~input_o\ & (\Mux7~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[2]~input_o\,
	datac => \Mux7~3_combout\,
	datad => \Mux7~1_combout\,
	combout => \Mux7~4_combout\);

-- Location: IOIBUF_X81_Y58_N8
\Din4[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(9),
	o => \Din4[9]~input_o\);

-- Location: IOIBUF_X81_Y62_N1
\Din6[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(9),
	o => \Din6[9]~input_o\);

-- Location: LCCOMB_X80_Y55_N28
\Mux6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[9]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din4[9]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din6[9]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: IOIBUF_X81_Y56_N1
\Din7[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(9),
	o => \Din7[9]~input_o\);

-- Location: IOIBUF_X81_Y55_N8
\Din5[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(9),
	o => \Din5[9]~input_o\);

-- Location: LCCOMB_X80_Y55_N6
\Mux6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\Control[0]~input_o\ & ((\Mux6~0_combout\ & (\Din7[9]~input_o\)) # (!\Mux6~0_combout\ & ((\Din5[9]~input_o\))))) # (!\Control[0]~input_o\ & (\Mux6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux6~0_combout\,
	datac => \Din7[9]~input_o\,
	datad => \Din5[9]~input_o\,
	combout => \Mux6~1_combout\);

-- Location: IOIBUF_X81_Y56_N8
\Din2[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(9),
	o => \Din2[9]~input_o\);

-- Location: IOIBUF_X81_Y49_N1
\Din0[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(9),
	o => \Din0[9]~input_o\);

-- Location: IOIBUF_X81_Y64_N22
\Din1[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(9),
	o => \Din1[9]~input_o\);

-- Location: LCCOMB_X80_Y55_N24
\Mux6~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[9]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[9]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[9]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[9]~input_o\,
	combout => \Mux6~2_combout\);

-- Location: IOIBUF_X81_Y62_N15
\Din3[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(9),
	o => \Din3[9]~input_o\);

-- Location: LCCOMB_X80_Y55_N2
\Mux6~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\Mux6~2_combout\ & (((\Din3[9]~input_o\) # (!\Control[1]~input_o\)))) # (!\Mux6~2_combout\ & (\Din2[9]~input_o\ & (\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din2[9]~input_o\,
	datab => \Mux6~2_combout\,
	datac => \Control[1]~input_o\,
	datad => \Din3[9]~input_o\,
	combout => \Mux6~3_combout\);

-- Location: LCCOMB_X80_Y55_N4
\Mux6~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = (\Control[2]~input_o\ & (\Mux6~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux6~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~1_combout\,
	datac => \Control[2]~input_o\,
	datad => \Mux6~3_combout\,
	combout => \Mux6~4_combout\);

-- Location: IOIBUF_X81_Y49_N15
\Din1[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(10),
	o => \Din1[10]~input_o\);

-- Location: IOIBUF_X81_Y52_N8
\Din0[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(10),
	o => \Din0[10]~input_o\);

-- Location: LCCOMB_X80_Y55_N26
\Mux5~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = (\Control[0]~input_o\ & ((\Din1[10]~input_o\) # ((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (((!\Control[1]~input_o\ & \Din0[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din1[10]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din0[10]~input_o\,
	combout => \Mux5~2_combout\);

-- Location: IOIBUF_X81_Y59_N8
\Din3[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(10),
	o => \Din3[10]~input_o\);

-- Location: IOIBUF_X81_Y61_N1
\Din2[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(10),
	o => \Din2[10]~input_o\);

-- Location: LCCOMB_X80_Y55_N12
\Mux5~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = (\Mux5~2_combout\ & (((\Din3[10]~input_o\)) # (!\Control[1]~input_o\))) # (!\Mux5~2_combout\ & (\Control[1]~input_o\ & ((\Din2[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~2_combout\,
	datab => \Control[1]~input_o\,
	datac => \Din3[10]~input_o\,
	datad => \Din2[10]~input_o\,
	combout => \Mux5~3_combout\);

-- Location: IOIBUF_X81_Y55_N1
\Din7[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(10),
	o => \Din7[10]~input_o\);

-- Location: IOIBUF_X81_Y50_N8
\Din6[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(10),
	o => \Din6[10]~input_o\);

-- Location: IOIBUF_X81_Y52_N15
\Din4[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(10),
	o => \Din4[10]~input_o\);

-- Location: LCCOMB_X80_Y55_N14
\Mux5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & (\Din6[10]~input_o\)) # (!\Control[1]~input_o\ & ((\Din4[10]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din6[10]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din4[10]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: IOIBUF_X81_Y59_N1
\Din5[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(10),
	o => \Din5[10]~input_o\);

-- Location: LCCOMB_X80_Y55_N0
\Mux5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Control[0]~input_o\ & ((\Mux5~0_combout\ & (\Din7[10]~input_o\)) # (!\Mux5~0_combout\ & ((\Din5[10]~input_o\))))) # (!\Control[0]~input_o\ & (((\Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din7[10]~input_o\,
	datac => \Mux5~0_combout\,
	datad => \Din5[10]~input_o\,
	combout => \Mux5~1_combout\);

-- Location: LCCOMB_X80_Y55_N22
\Mux5~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~4_combout\ = (\Control[2]~input_o\ & ((\Mux5~1_combout\))) # (!\Control[2]~input_o\ & (\Mux5~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux5~3_combout\,
	datac => \Control[2]~input_o\,
	datad => \Mux5~1_combout\,
	combout => \Mux5~4_combout\);

-- Location: IOIBUF_X38_Y0_N8
\Din3[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(11),
	o => \Din3[11]~input_o\);

-- Location: IOIBUF_X56_Y0_N22
\Din2[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(11),
	o => \Din2[11]~input_o\);

-- Location: IOIBUF_X81_Y2_N15
\Din0[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(11),
	o => \Din0[11]~input_o\);

-- Location: IOIBUF_X61_Y0_N1
\Din1[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(11),
	o => \Din1[11]~input_o\);

-- Location: LCCOMB_X57_Y1_N20
\Mux4~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = (\Control[1]~input_o\ & (((\Control[0]~input_o\)))) # (!\Control[1]~input_o\ & ((\Control[0]~input_o\ & ((\Din1[11]~input_o\))) # (!\Control[0]~input_o\ & (\Din0[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[11]~input_o\,
	datab => \Din1[11]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux4~2_combout\);

-- Location: LCCOMB_X57_Y1_N30
\Mux4~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = (\Control[1]~input_o\ & ((\Mux4~2_combout\ & (\Din3[11]~input_o\)) # (!\Mux4~2_combout\ & ((\Din2[11]~input_o\))))) # (!\Control[1]~input_o\ & (((\Mux4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[11]~input_o\,
	datab => \Din2[11]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Mux4~2_combout\,
	combout => \Mux4~3_combout\);

-- Location: IOIBUF_X52_Y0_N15
\Din6[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(11),
	o => \Din6[11]~input_o\);

-- Location: IOIBUF_X58_Y0_N15
\Din4[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(11),
	o => \Din4[11]~input_o\);

-- Location: LCCOMB_X57_Y1_N16
\Mux4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & (\Din6[11]~input_o\)) # (!\Control[1]~input_o\ & ((\Din4[11]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din6[11]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din4[11]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X63_Y0_N1
\Din7[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(11),
	o => \Din7[11]~input_o\);

-- Location: IOIBUF_X68_Y0_N8
\Din5[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(11),
	o => \Din5[11]~input_o\);

-- Location: LCCOMB_X57_Y1_N26
\Mux4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Control[0]~input_o\ & ((\Mux4~0_combout\ & (\Din7[11]~input_o\)) # (!\Mux4~0_combout\ & ((\Din5[11]~input_o\))))) # (!\Control[0]~input_o\ & (\Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux4~0_combout\,
	datac => \Din7[11]~input_o\,
	datad => \Din5[11]~input_o\,
	combout => \Mux4~1_combout\);

-- Location: LCCOMB_X57_Y1_N8
\Mux4~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~4_combout\ = (\Control[2]~input_o\ & ((\Mux4~1_combout\))) # (!\Control[2]~input_o\ & (\Mux4~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~3_combout\,
	datab => \Control[2]~input_o\,
	datac => \Mux4~1_combout\,
	combout => \Mux4~4_combout\);

-- Location: IOIBUF_X81_Y25_N1
\Din1[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(12),
	o => \Din1[12]~input_o\);

-- Location: IOIBUF_X81_Y43_N1
\Din0[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(12),
	o => \Din0[12]~input_o\);

-- Location: LCCOMB_X80_Y31_N10
\Mux3~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = (\Control[0]~input_o\ & ((\Control[1]~input_o\) # ((\Din1[12]~input_o\)))) # (!\Control[0]~input_o\ & (!\Control[1]~input_o\ & ((\Din0[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din1[12]~input_o\,
	datad => \Din0[12]~input_o\,
	combout => \Mux3~2_combout\);

-- Location: IOIBUF_X81_Y20_N1
\Din3[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(12),
	o => \Din3[12]~input_o\);

-- Location: IOIBUF_X81_Y42_N8
\Din2[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(12),
	o => \Din2[12]~input_o\);

-- Location: LCCOMB_X80_Y31_N4
\Mux3~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = (\Mux3~2_combout\ & (((\Din3[12]~input_o\)) # (!\Control[1]~input_o\))) # (!\Mux3~2_combout\ & (\Control[1]~input_o\ & ((\Din2[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~2_combout\,
	datab => \Control[1]~input_o\,
	datac => \Din3[12]~input_o\,
	datad => \Din2[12]~input_o\,
	combout => \Mux3~3_combout\);

-- Location: IOIBUF_X81_Y19_N1
\Din7[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(12),
	o => \Din7[12]~input_o\);

-- Location: IOIBUF_X81_Y23_N8
\Din4[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(12),
	o => \Din4[12]~input_o\);

-- Location: IOIBUF_X81_Y46_N1
\Din6[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(12),
	o => \Din6[12]~input_o\);

-- Location: LCCOMB_X80_Y31_N30
\Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\Control[0]~input_o\ & (\Control[1]~input_o\)) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[12]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din4[12]~input_o\,
	datad => \Din6[12]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: IOIBUF_X38_Y0_N1
\Din5[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(12),
	o => \Din5[12]~input_o\);

-- Location: LCCOMB_X80_Y31_N8
\Mux3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Control[0]~input_o\ & ((\Mux3~0_combout\ & (\Din7[12]~input_o\)) # (!\Mux3~0_combout\ & ((\Din5[12]~input_o\))))) # (!\Control[0]~input_o\ & (((\Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din7[12]~input_o\,
	datac => \Mux3~0_combout\,
	datad => \Din5[12]~input_o\,
	combout => \Mux3~1_combout\);

-- Location: LCCOMB_X80_Y31_N14
\Mux3~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~4_combout\ = (\Control[2]~input_o\ & ((\Mux3~1_combout\))) # (!\Control[2]~input_o\ & (\Mux3~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux3~3_combout\,
	datac => \Mux3~1_combout\,
	datad => \Control[2]~input_o\,
	combout => \Mux3~4_combout\);

-- Location: IOIBUF_X81_Y53_N1
\Din7[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(13),
	o => \Din7[13]~input_o\);

-- Location: IOIBUF_X65_Y0_N1
\Din4[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(13),
	o => \Din4[13]~input_o\);

-- Location: IOIBUF_X58_Y0_N22
\Din6[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(13),
	o => \Din6[13]~input_o\);

-- Location: LCCOMB_X57_Y1_N10
\Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din6[13]~input_o\))) # (!\Control[1]~input_o\ & (\Din4[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din4[13]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din6[13]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: IOIBUF_X81_Y64_N8
\Din5[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(13),
	o => \Din5[13]~input_o\);

-- Location: LCCOMB_X80_Y55_N8
\Mux2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\Control[0]~input_o\ & ((\Mux2~0_combout\ & (\Din7[13]~input_o\)) # (!\Mux2~0_combout\ & ((\Din5[13]~input_o\))))) # (!\Control[0]~input_o\ & (((\Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din7[13]~input_o\,
	datac => \Mux2~0_combout\,
	datad => \Din5[13]~input_o\,
	combout => \Mux2~1_combout\);

-- Location: IOIBUF_X81_Y61_N8
\Din3[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(13),
	o => \Din3[13]~input_o\);

-- Location: IOIBUF_X81_Y53_N8
\Din0[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(13),
	o => \Din0[13]~input_o\);

-- Location: IOIBUF_X81_Y61_N15
\Din1[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(13),
	o => \Din1[13]~input_o\);

-- Location: LCCOMB_X80_Y55_N18
\Mux2~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[13]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[13]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[13]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[13]~input_o\,
	combout => \Mux2~2_combout\);

-- Location: IOIBUF_X81_Y63_N1
\Din2[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(13),
	o => \Din2[13]~input_o\);

-- Location: LCCOMB_X80_Y55_N20
\Mux2~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~3_combout\ = (\Mux2~2_combout\ & ((\Din3[13]~input_o\) # ((!\Control[1]~input_o\)))) # (!\Mux2~2_combout\ & (((\Control[1]~input_o\ & \Din2[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[13]~input_o\,
	datab => \Mux2~2_combout\,
	datac => \Control[1]~input_o\,
	datad => \Din2[13]~input_o\,
	combout => \Mux2~3_combout\);

-- Location: LCCOMB_X80_Y55_N30
\Mux2~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~4_combout\ = (\Control[2]~input_o\ & (\Mux2~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[2]~input_o\,
	datac => \Mux2~1_combout\,
	datad => \Mux2~3_combout\,
	combout => \Mux2~4_combout\);

-- Location: IOIBUF_X54_Y0_N15
\Din6[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(14),
	o => \Din6[14]~input_o\);

-- Location: IOIBUF_X56_Y0_N8
\Din4[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(14),
	o => \Din4[14]~input_o\);

-- Location: LCCOMB_X57_Y1_N28
\Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & (\Din6[14]~input_o\)) # (!\Control[1]~input_o\ & ((\Din4[14]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din6[14]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din4[14]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: IOIBUF_X56_Y0_N1
\Din5[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(14),
	o => \Din5[14]~input_o\);

-- Location: IOIBUF_X70_Y0_N1
\Din7[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(14),
	o => \Din7[14]~input_o\);

-- Location: LCCOMB_X57_Y1_N22
\Mux1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Control[0]~input_o\ & ((\Mux1~0_combout\ & ((\Din7[14]~input_o\))) # (!\Mux1~0_combout\ & (\Din5[14]~input_o\)))) # (!\Control[0]~input_o\ & (\Mux1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux1~0_combout\,
	datac => \Din5[14]~input_o\,
	datad => \Din7[14]~input_o\,
	combout => \Mux1~1_combout\);

-- Location: IOIBUF_X65_Y0_N8
\Din2[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(14),
	o => \Din2[14]~input_o\);

-- Location: IOIBUF_X58_Y0_N8
\Din0[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(14),
	o => \Din0[14]~input_o\);

-- Location: IOIBUF_X81_Y2_N22
\Din1[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(14),
	o => \Din1[14]~input_o\);

-- Location: LCCOMB_X57_Y1_N24
\Mux1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[14]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[14]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[14]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[14]~input_o\,
	combout => \Mux1~2_combout\);

-- Location: IOIBUF_X54_Y0_N22
\Din3[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(14),
	o => \Din3[14]~input_o\);

-- Location: LCCOMB_X57_Y1_N18
\Mux1~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~3_combout\ = (\Mux1~2_combout\ & (((\Din3[14]~input_o\) # (!\Control[1]~input_o\)))) # (!\Mux1~2_combout\ & (\Din2[14]~input_o\ & (\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din2[14]~input_o\,
	datab => \Mux1~2_combout\,
	datac => \Control[1]~input_o\,
	datad => \Din3[14]~input_o\,
	combout => \Mux1~3_combout\);

-- Location: LCCOMB_X57_Y1_N4
\Mux1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~4_combout\ = (\Control[2]~input_o\ & (\Mux1~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1~1_combout\,
	datab => \Mux1~3_combout\,
	datac => \Control[2]~input_o\,
	combout => \Mux1~4_combout\);

-- Location: IOIBUF_X58_Y0_N1
\Din4[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din4(15),
	o => \Din4[15]~input_o\);

-- Location: IOIBUF_X49_Y0_N1
\Din6[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din6(15),
	o => \Din6[15]~input_o\);

-- Location: LCCOMB_X57_Y1_N14
\Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Control[1]~input_o\ & (((\Din6[15]~input_o\) # (\Control[0]~input_o\)))) # (!\Control[1]~input_o\ & (\Din4[15]~input_o\ & ((!\Control[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din4[15]~input_o\,
	datab => \Din6[15]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X56_Y0_N15
\Din5[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din5(15),
	o => \Din5[15]~input_o\);

-- Location: IOIBUF_X81_Y7_N1
\Din7[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din7(15),
	o => \Din7[15]~input_o\);

-- Location: LCCOMB_X57_Y1_N0
\Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Control[0]~input_o\ & ((\Mux0~0_combout\ & ((\Din7[15]~input_o\))) # (!\Mux0~0_combout\ & (\Din5[15]~input_o\)))) # (!\Control[0]~input_o\ & (\Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux0~0_combout\,
	datac => \Din5[15]~input_o\,
	datad => \Din7[15]~input_o\,
	combout => \Mux0~1_combout\);

-- Location: IOIBUF_X49_Y0_N15
\Din3[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(15),
	o => \Din3[15]~input_o\);

-- Location: IOIBUF_X54_Y0_N1
\Din2[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(15),
	o => \Din2[15]~input_o\);

-- Location: IOIBUF_X63_Y0_N8
\Din0[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(15),
	o => \Din0[15]~input_o\);

-- Location: IOIBUF_X65_Y0_N15
\Din1[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(15),
	o => \Din1[15]~input_o\);

-- Location: LCCOMB_X57_Y1_N2
\Mux0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[15]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[15]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[15]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[15]~input_o\,
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X57_Y1_N12
\Mux0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\Control[1]~input_o\ & ((\Mux0~2_combout\ & (\Din3[15]~input_o\)) # (!\Mux0~2_combout\ & ((\Din2[15]~input_o\))))) # (!\Control[1]~input_o\ & (((\Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[15]~input_o\,
	datab => \Din2[15]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Mux0~2_combout\,
	combout => \Mux0~3_combout\);

-- Location: LCCOMB_X57_Y1_N6
\Mux0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = (\Control[2]~input_o\ & (\Mux0~1_combout\)) # (!\Control[2]~input_o\ & ((\Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux0~1_combout\,
	datac => \Control[2]~input_o\,
	datad => \Mux0~3_combout\,
	combout => \Mux0~4_combout\);

ww_Dout(0) <= \Dout[0]~output_o\;

ww_Dout(1) <= \Dout[1]~output_o\;

ww_Dout(2) <= \Dout[2]~output_o\;

ww_Dout(3) <= \Dout[3]~output_o\;

ww_Dout(4) <= \Dout[4]~output_o\;

ww_Dout(5) <= \Dout[5]~output_o\;

ww_Dout(6) <= \Dout[6]~output_o\;

ww_Dout(7) <= \Dout[7]~output_o\;

ww_Dout(8) <= \Dout[8]~output_o\;

ww_Dout(9) <= \Dout[9]~output_o\;

ww_Dout(10) <= \Dout[10]~output_o\;

ww_Dout(11) <= \Dout[11]~output_o\;

ww_Dout(12) <= \Dout[12]~output_o\;

ww_Dout(13) <= \Dout[13]~output_o\;

ww_Dout(14) <= \Dout[14]~output_o\;

ww_Dout(15) <= \Dout[15]~output_o\;
END structure;


