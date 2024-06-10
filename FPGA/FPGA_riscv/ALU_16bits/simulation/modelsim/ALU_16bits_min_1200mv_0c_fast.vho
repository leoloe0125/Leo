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

-- DATE "11/11/2023 23:51:22"

-- 
-- Device: Altera EP4CGX22CF19C6 Package FBGA324
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ALU_16bits IS
    PORT (
	A : IN std_logic_vector(15 DOWNTO 0);
	B : IN std_logic_vector(15 DOWNTO 0);
	op : IN std_logic;
	S : BUFFER std_logic_vector(15 DOWNTO 0);
	N : BUFFER std_logic;
	Z : BUFFER std_logic;
	V : BUFFER std_logic;
	C : BUFFER std_logic
	);
END ALU_16bits;

-- Design Ports Information
-- S[0]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[1]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[2]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[3]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[4]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[5]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[6]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[7]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[8]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[9]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[10]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[11]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[12]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[13]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[14]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S[15]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Z	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_V15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_U18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[4]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[4]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[5]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[5]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[6]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[6]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[7]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[7]	=>  Location: PIN_R18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[8]	=>  Location: PIN_K18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[8]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[9]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[9]	=>  Location: PIN_H18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[10]	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[10]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[11]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[11]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[12]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[12]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[13]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[13]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[14]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[14]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[15]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[15]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ALU_16bits IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_op : std_logic;
SIGNAL ww_S : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_N : std_logic;
SIGNAL ww_Z : std_logic;
SIGNAL ww_V : std_logic;
SIGNAL ww_C : std_logic;
SIGNAL \S[0]~output_o\ : std_logic;
SIGNAL \S[1]~output_o\ : std_logic;
SIGNAL \S[2]~output_o\ : std_logic;
SIGNAL \S[3]~output_o\ : std_logic;
SIGNAL \S[4]~output_o\ : std_logic;
SIGNAL \S[5]~output_o\ : std_logic;
SIGNAL \S[6]~output_o\ : std_logic;
SIGNAL \S[7]~output_o\ : std_logic;
SIGNAL \S[8]~output_o\ : std_logic;
SIGNAL \S[9]~output_o\ : std_logic;
SIGNAL \S[10]~output_o\ : std_logic;
SIGNAL \S[11]~output_o\ : std_logic;
SIGNAL \S[12]~output_o\ : std_logic;
SIGNAL \S[13]~output_o\ : std_logic;
SIGNAL \S[14]~output_o\ : std_logic;
SIGNAL \S[15]~output_o\ : std_logic;
SIGNAL \N~output_o\ : std_logic;
SIGNAL \Z~output_o\ : std_logic;
SIGNAL \V~output_o\ : std_logic;
SIGNAL \C~output_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \A0|S[0]~0_combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \op~input_o\ : std_logic;
SIGNAL \A0|C[1]~0_combout\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \A0|C[2]~1_combout\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \A0|S[2]~1_combout\ : std_logic;
SIGNAL \A0|C[3]~2_combout\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \A0|S[3]~2_combout\ : std_logic;
SIGNAL \A0|C[4]~3_combout\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \A0|S[4]~3_combout\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \A0|C[5]~4_combout\ : std_logic;
SIGNAL \B[5]~input_o\ : std_logic;
SIGNAL \A0|S[5]~4_combout\ : std_logic;
SIGNAL \A0|C[6]~5_combout\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \B[6]~input_o\ : std_logic;
SIGNAL \A0|S[6]~5_combout\ : std_logic;
SIGNAL \A0|C[7]~6_combout\ : std_logic;
SIGNAL \B[7]~input_o\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \A0|S[7]~6_combout\ : std_logic;
SIGNAL \A0|C[8]~7_combout\ : std_logic;
SIGNAL \A[8]~input_o\ : std_logic;
SIGNAL \B[8]~input_o\ : std_logic;
SIGNAL \A0|S[8]~7_combout\ : std_logic;
SIGNAL \B[9]~input_o\ : std_logic;
SIGNAL \A0|C[9]~8_combout\ : std_logic;
SIGNAL \A[9]~input_o\ : std_logic;
SIGNAL \A0|S[9]~8_combout\ : std_logic;
SIGNAL \A0|C[10]~9_combout\ : std_logic;
SIGNAL \A[10]~input_o\ : std_logic;
SIGNAL \B[10]~input_o\ : std_logic;
SIGNAL \A0|S[10]~9_combout\ : std_logic;
SIGNAL \A[11]~input_o\ : std_logic;
SIGNAL \A0|C[11]~10_combout\ : std_logic;
SIGNAL \B[11]~input_o\ : std_logic;
SIGNAL \A0|S[11]~10_combout\ : std_logic;
SIGNAL \A[12]~input_o\ : std_logic;
SIGNAL \A0|C[12]~11_combout\ : std_logic;
SIGNAL \B[12]~input_o\ : std_logic;
SIGNAL \A0|S[12]~11_combout\ : std_logic;
SIGNAL \B[13]~input_o\ : std_logic;
SIGNAL \A0|C[13]~12_combout\ : std_logic;
SIGNAL \A[13]~input_o\ : std_logic;
SIGNAL \A0|S[13]~12_combout\ : std_logic;
SIGNAL \A[14]~input_o\ : std_logic;
SIGNAL \A0|C[14]~13_combout\ : std_logic;
SIGNAL \B[14]~input_o\ : std_logic;
SIGNAL \A0|S[14]~13_combout\ : std_logic;
SIGNAL \A[15]~input_o\ : std_logic;
SIGNAL \B[15]~input_o\ : std_logic;
SIGNAL \A0|Cout[15]~0_combout\ : std_logic;
SIGNAL \A0|S[15]~14_combout\ : std_logic;
SIGNAL \WideOr0~0_combout\ : std_logic;
SIGNAL \WideOr0~1_combout\ : std_logic;
SIGNAL \WideOr0~3_combout\ : std_logic;
SIGNAL \WideOr0~2_combout\ : std_logic;
SIGNAL \WideOr0~combout\ : std_logic;
SIGNAL \WideXor0~0_combout\ : std_logic;
SIGNAL \A0|S\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_WideOr0~combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_op <= op;
S <= ww_S;
N <= ww_N;
Z <= ww_Z;
V <= ww_V;
C <= ww_C;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_WideOr0~combout\ <= NOT \WideOr0~combout\;

-- Location: IOOBUF_X12_Y0_N2
\S[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[0]~0_combout\,
	devoe => ww_devoe,
	o => \S[0]~output_o\);

-- Location: IOOBUF_X21_Y41_N9
\S[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S\(1),
	devoe => ww_devoe,
	o => \S[1]~output_o\);

-- Location: IOOBUF_X21_Y41_N2
\S[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[2]~1_combout\,
	devoe => ww_devoe,
	o => \S[2]~output_o\);

-- Location: IOOBUF_X23_Y41_N2
\S[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[3]~2_combout\,
	devoe => ww_devoe,
	o => \S[3]~output_o\);

-- Location: IOOBUF_X14_Y41_N2
\S[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[4]~3_combout\,
	devoe => ww_devoe,
	o => \S[4]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\S[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[5]~4_combout\,
	devoe => ww_devoe,
	o => \S[5]~output_o\);

-- Location: IOOBUF_X16_Y41_N2
\S[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[6]~5_combout\,
	devoe => ww_devoe,
	o => \S[6]~output_o\);

-- Location: IOOBUF_X12_Y41_N9
\S[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[7]~6_combout\,
	devoe => ww_devoe,
	o => \S[7]~output_o\);

-- Location: IOOBUF_X52_Y11_N2
\S[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[8]~7_combout\,
	devoe => ww_devoe,
	o => \S[8]~output_o\);

-- Location: IOOBUF_X52_Y23_N9
\S[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[9]~8_combout\,
	devoe => ww_devoe,
	o => \S[9]~output_o\);

-- Location: IOOBUF_X52_Y19_N2
\S[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[10]~9_combout\,
	devoe => ww_devoe,
	o => \S[10]~output_o\);

-- Location: IOOBUF_X48_Y41_N9
\S[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[11]~10_combout\,
	devoe => ww_devoe,
	o => \S[11]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\S[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[12]~11_combout\,
	devoe => ww_devoe,
	o => \S[12]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\S[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[13]~12_combout\,
	devoe => ww_devoe,
	o => \S[13]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\S[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[14]~13_combout\,
	devoe => ww_devoe,
	o => \S[14]~output_o\);

-- Location: IOOBUF_X16_Y41_N9
\S[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[15]~14_combout\,
	devoe => ww_devoe,
	o => \S[15]~output_o\);

-- Location: IOOBUF_X14_Y41_N9
\N~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|S[15]~14_combout\,
	devoe => ww_devoe,
	o => \N~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\Z~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr0~combout\,
	devoe => ww_devoe,
	o => \Z~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\V~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \WideXor0~0_combout\,
	devoe => ww_devoe,
	o => \V~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\C~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \A0|Cout[15]~0_combout\,
	devoe => ww_devoe,
	o => \C~output_o\);

-- Location: IOIBUF_X10_Y0_N8
\A[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: IOIBUF_X25_Y0_N1
\B[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: LCCOMB_X21_Y1_N8
\A0|S[0]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[0]~0_combout\ = \A[0]~input_o\ $ (\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datac => \B[0]~input_o\,
	combout => \A0|S[0]~0_combout\);

-- Location: IOIBUF_X34_Y0_N1
\A[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\op~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_op,
	o => \op~input_o\);

-- Location: LCCOMB_X21_Y1_N26
\A0|C[1]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[1]~0_combout\ = (\B[0]~input_o\ & (\A[0]~input_o\)) # (!\B[0]~input_o\ & ((\op~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \B[0]~input_o\,
	datad => \op~input_o\,
	combout => \A0|C[1]~0_combout\);

-- Location: IOIBUF_X46_Y0_N22
\B[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: LCCOMB_X25_Y19_N24
\A0|S[1]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S\(1) = \A[1]~input_o\ $ (\A0|C[1]~0_combout\ $ (\op~input_o\ $ (\B[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \A0|C[1]~0_combout\,
	datac => \op~input_o\,
	datad => \B[1]~input_o\,
	combout => \A0|S\(1));

-- Location: IOIBUF_X25_Y0_N8
\A[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: LCCOMB_X25_Y19_N18
\A0|C[2]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[2]~1_combout\ = (\A[1]~input_o\ & ((\A0|C[1]~0_combout\) # (\op~input_o\ $ (\B[1]~input_o\)))) # (!\A[1]~input_o\ & (\A0|C[1]~0_combout\ & (\op~input_o\ $ (\B[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[1]~input_o\,
	datab => \A0|C[1]~0_combout\,
	datac => \op~input_o\,
	datad => \B[1]~input_o\,
	combout => \A0|C[2]~1_combout\);

-- Location: IOIBUF_X25_Y41_N8
\B[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: LCCOMB_X25_Y19_N28
\A0|S[2]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[2]~1_combout\ = \A[2]~input_o\ $ (\A0|C[2]~1_combout\ $ (\op~input_o\ $ (\B[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \A0|C[2]~1_combout\,
	datac => \op~input_o\,
	datad => \B[2]~input_o\,
	combout => \A0|S[2]~1_combout\);

-- Location: LCCOMB_X25_Y19_N22
\A0|C[3]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[3]~2_combout\ = (\A[2]~input_o\ & ((\A0|C[2]~1_combout\) # (\op~input_o\ $ (\B[2]~input_o\)))) # (!\A[2]~input_o\ & (\A0|C[2]~1_combout\ & (\op~input_o\ $ (\B[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \A0|C[2]~1_combout\,
	datac => \op~input_o\,
	datad => \B[2]~input_o\,
	combout => \A0|C[3]~2_combout\);

-- Location: IOIBUF_X23_Y41_N8
\B[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X25_Y41_N1
\A[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: LCCOMB_X25_Y19_N16
\A0|S[3]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[3]~2_combout\ = \A0|C[3]~2_combout\ $ (\B[3]~input_o\ $ (\op~input_o\ $ (\A[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[3]~2_combout\,
	datab => \B[3]~input_o\,
	datac => \op~input_o\,
	datad => \A[3]~input_o\,
	combout => \A0|S[3]~2_combout\);

-- Location: LCCOMB_X25_Y19_N10
\A0|C[4]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[4]~3_combout\ = (\A0|C[3]~2_combout\ & ((\A[3]~input_o\) # (\B[3]~input_o\ $ (\op~input_o\)))) # (!\A0|C[3]~2_combout\ & (\A[3]~input_o\ & (\B[3]~input_o\ $ (\op~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[3]~2_combout\,
	datab => \B[3]~input_o\,
	datac => \op~input_o\,
	datad => \A[3]~input_o\,
	combout => \A0|C[4]~3_combout\);

-- Location: IOIBUF_X52_Y9_N8
\A[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

-- Location: IOIBUF_X52_Y19_N8
\B[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

-- Location: LCCOMB_X25_Y19_N4
\A0|S[4]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[4]~3_combout\ = \A0|C[4]~3_combout\ $ (\op~input_o\ $ (\A[4]~input_o\ $ (\B[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[4]~3_combout\,
	datab => \op~input_o\,
	datac => \A[4]~input_o\,
	datad => \B[4]~input_o\,
	combout => \A0|S[4]~3_combout\);

-- Location: IOIBUF_X52_Y25_N1
\A[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

-- Location: LCCOMB_X25_Y19_N14
\A0|C[5]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[5]~4_combout\ = (\A0|C[4]~3_combout\ & ((\A[4]~input_o\) # (\op~input_o\ $ (\B[4]~input_o\)))) # (!\A0|C[4]~3_combout\ & (\A[4]~input_o\ & (\op~input_o\ $ (\B[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[4]~3_combout\,
	datab => \op~input_o\,
	datac => \A[4]~input_o\,
	datad => \B[4]~input_o\,
	combout => \A0|C[5]~4_combout\);

-- Location: IOIBUF_X52_Y25_N8
\B[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(5),
	o => \B[5]~input_o\);

-- Location: LCCOMB_X25_Y19_N0
\A0|S[5]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[5]~4_combout\ = \A[5]~input_o\ $ (\A0|C[5]~4_combout\ $ (\op~input_o\ $ (\B[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[5]~input_o\,
	datab => \A0|C[5]~4_combout\,
	datac => \op~input_o\,
	datad => \B[5]~input_o\,
	combout => \A0|S[5]~4_combout\);

-- Location: LCCOMB_X25_Y19_N26
\A0|C[6]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[6]~5_combout\ = (\A[5]~input_o\ & ((\A0|C[5]~4_combout\) # (\op~input_o\ $ (\B[5]~input_o\)))) # (!\A[5]~input_o\ & (\A0|C[5]~4_combout\ & (\op~input_o\ $ (\B[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[5]~input_o\,
	datab => \A0|C[5]~4_combout\,
	datac => \op~input_o\,
	datad => \B[5]~input_o\,
	combout => \A0|C[6]~5_combout\);

-- Location: IOIBUF_X7_Y0_N1
\A[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

-- Location: IOIBUF_X52_Y18_N8
\B[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(6),
	o => \B[6]~input_o\);

-- Location: LCCOMB_X25_Y19_N20
\A0|S[6]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[6]~5_combout\ = \A0|C[6]~5_combout\ $ (\A[6]~input_o\ $ (\op~input_o\ $ (\B[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[6]~5_combout\,
	datab => \A[6]~input_o\,
	datac => \op~input_o\,
	datad => \B[6]~input_o\,
	combout => \A0|S[6]~5_combout\);

-- Location: LCCOMB_X25_Y19_N6
\A0|C[7]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[7]~6_combout\ = (\A0|C[6]~5_combout\ & ((\A[6]~input_o\) # (\op~input_o\ $ (\B[6]~input_o\)))) # (!\A0|C[6]~5_combout\ & (\A[6]~input_o\ & (\op~input_o\ $ (\B[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[6]~5_combout\,
	datab => \A[6]~input_o\,
	datac => \op~input_o\,
	datad => \B[6]~input_o\,
	combout => \A0|C[7]~6_combout\);

-- Location: IOIBUF_X52_Y12_N1
\B[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(7),
	o => \B[7]~input_o\);

-- Location: IOIBUF_X52_Y13_N1
\A[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

-- Location: LCCOMB_X25_Y19_N8
\A0|S[7]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[7]~6_combout\ = \A0|C[7]~6_combout\ $ (\B[7]~input_o\ $ (\op~input_o\ $ (\A[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[7]~6_combout\,
	datab => \B[7]~input_o\,
	datac => \op~input_o\,
	datad => \A[7]~input_o\,
	combout => \A0|S[7]~6_combout\);

-- Location: LCCOMB_X25_Y19_N2
\A0|C[8]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[8]~7_combout\ = (\A0|C[7]~6_combout\ & ((\A[7]~input_o\) # (\B[7]~input_o\ $ (\op~input_o\)))) # (!\A0|C[7]~6_combout\ & (\A[7]~input_o\ & (\B[7]~input_o\ $ (\op~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[7]~6_combout\,
	datab => \B[7]~input_o\,
	datac => \op~input_o\,
	datad => \A[7]~input_o\,
	combout => \A0|C[8]~7_combout\);

-- Location: IOIBUF_X52_Y21_N22
\A[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(8),
	o => \A[8]~input_o\);

-- Location: IOIBUF_X52_Y21_N15
\B[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(8),
	o => \B[8]~input_o\);

-- Location: LCCOMB_X51_Y22_N24
\A0|S[8]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[8]~7_combout\ = \op~input_o\ $ (\A0|C[8]~7_combout\ $ (\A[8]~input_o\ $ (\B[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op~input_o\,
	datab => \A0|C[8]~7_combout\,
	datac => \A[8]~input_o\,
	datad => \B[8]~input_o\,
	combout => \A0|S[8]~7_combout\);

-- Location: IOIBUF_X52_Y21_N8
\B[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(9),
	o => \B[9]~input_o\);

-- Location: LCCOMB_X51_Y22_N2
\A0|C[9]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[9]~8_combout\ = (\A0|C[8]~7_combout\ & ((\A[8]~input_o\) # (\op~input_o\ $ (\B[8]~input_o\)))) # (!\A0|C[8]~7_combout\ & (\A[8]~input_o\ & (\op~input_o\ $ (\B[8]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \op~input_o\,
	datab => \A0|C[8]~7_combout\,
	datac => \A[8]~input_o\,
	datad => \B[8]~input_o\,
	combout => \A0|C[9]~8_combout\);

-- Location: IOIBUF_X52_Y27_N1
\A[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(9),
	o => \A[9]~input_o\);

-- Location: LCCOMB_X51_Y22_N4
\A0|S[9]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[9]~8_combout\ = \B[9]~input_o\ $ (\A0|C[9]~8_combout\ $ (\op~input_o\ $ (\A[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[9]~input_o\,
	datab => \A0|C[9]~8_combout\,
	datac => \op~input_o\,
	datad => \A[9]~input_o\,
	combout => \A0|S[9]~8_combout\);

-- Location: LCCOMB_X51_Y22_N6
\A0|C[10]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[10]~9_combout\ = (\A0|C[9]~8_combout\ & ((\A[9]~input_o\) # (\B[9]~input_o\ $ (\op~input_o\)))) # (!\A0|C[9]~8_combout\ & (\A[9]~input_o\ & (\B[9]~input_o\ $ (\op~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[9]~input_o\,
	datab => \A0|C[9]~8_combout\,
	datac => \op~input_o\,
	datad => \A[9]~input_o\,
	combout => \A0|C[10]~9_combout\);

-- Location: IOIBUF_X52_Y21_N1
\A[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(10),
	o => \A[10]~input_o\);

-- Location: IOIBUF_X52_Y23_N1
\B[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(10),
	o => \B[10]~input_o\);

-- Location: LCCOMB_X51_Y22_N8
\A0|S[10]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[10]~9_combout\ = \A0|C[10]~9_combout\ $ (\A[10]~input_o\ $ (\op~input_o\ $ (\B[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[10]~9_combout\,
	datab => \A[10]~input_o\,
	datac => \op~input_o\,
	datad => \B[10]~input_o\,
	combout => \A0|S[10]~9_combout\);

-- Location: IOIBUF_X50_Y41_N8
\A[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(11),
	o => \A[11]~input_o\);

-- Location: LCCOMB_X51_Y22_N18
\A0|C[11]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[11]~10_combout\ = (\A0|C[10]~9_combout\ & ((\A[10]~input_o\) # (\op~input_o\ $ (\B[10]~input_o\)))) # (!\A0|C[10]~9_combout\ & (\A[10]~input_o\ & (\op~input_o\ $ (\B[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|C[10]~9_combout\,
	datab => \A[10]~input_o\,
	datac => \op~input_o\,
	datad => \B[10]~input_o\,
	combout => \A0|C[11]~10_combout\);

-- Location: IOIBUF_X52_Y28_N8
\B[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(11),
	o => \B[11]~input_o\);

-- Location: LCCOMB_X51_Y22_N12
\A0|S[11]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[11]~10_combout\ = \A[11]~input_o\ $ (\A0|C[11]~10_combout\ $ (\op~input_o\ $ (\B[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[11]~input_o\,
	datab => \A0|C[11]~10_combout\,
	datac => \op~input_o\,
	datad => \B[11]~input_o\,
	combout => \A0|S[11]~10_combout\);

-- Location: IOIBUF_X14_Y0_N8
\A[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(12),
	o => \A[12]~input_o\);

-- Location: LCCOMB_X51_Y22_N30
\A0|C[12]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[12]~11_combout\ = (\A[11]~input_o\ & ((\A0|C[11]~10_combout\) # (\op~input_o\ $ (\B[11]~input_o\)))) # (!\A[11]~input_o\ & (\A0|C[11]~10_combout\ & (\op~input_o\ $ (\B[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[11]~input_o\,
	datab => \A0|C[11]~10_combout\,
	datac => \op~input_o\,
	datad => \B[11]~input_o\,
	combout => \A0|C[12]~11_combout\);

-- Location: IOIBUF_X29_Y0_N8
\B[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(12),
	o => \B[12]~input_o\);

-- Location: LCCOMB_X21_Y1_N12
\A0|S[12]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[12]~11_combout\ = \A[12]~input_o\ $ (\op~input_o\ $ (\A0|C[12]~11_combout\ $ (\B[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[12]~input_o\,
	datab => \op~input_o\,
	datac => \A0|C[12]~11_combout\,
	datad => \B[12]~input_o\,
	combout => \A0|S[12]~11_combout\);

-- Location: IOIBUF_X21_Y0_N8
\B[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(13),
	o => \B[13]~input_o\);

-- Location: LCCOMB_X21_Y1_N14
\A0|C[13]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[13]~12_combout\ = (\A[12]~input_o\ & ((\A0|C[12]~11_combout\) # (\op~input_o\ $ (\B[12]~input_o\)))) # (!\A[12]~input_o\ & (\A0|C[12]~11_combout\ & (\op~input_o\ $ (\B[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[12]~input_o\,
	datab => \op~input_o\,
	datac => \A0|C[12]~11_combout\,
	datad => \B[12]~input_o\,
	combout => \A0|C[13]~12_combout\);

-- Location: IOIBUF_X23_Y0_N1
\A[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(13),
	o => \A[13]~input_o\);

-- Location: LCCOMB_X21_Y1_N24
\A0|S[13]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[13]~12_combout\ = \B[13]~input_o\ $ (\A0|C[13]~12_combout\ $ (\A[13]~input_o\ $ (\op~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[13]~input_o\,
	datab => \A0|C[13]~12_combout\,
	datac => \A[13]~input_o\,
	datad => \op~input_o\,
	combout => \A0|S[13]~12_combout\);

-- Location: IOIBUF_X21_Y0_N1
\A[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(14),
	o => \A[14]~input_o\);

-- Location: LCCOMB_X21_Y1_N2
\A0|C[14]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|C[14]~13_combout\ = (\A0|C[13]~12_combout\ & ((\A[13]~input_o\) # (\B[13]~input_o\ $ (\op~input_o\)))) # (!\A0|C[13]~12_combout\ & (\A[13]~input_o\ & (\B[13]~input_o\ $ (\op~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[13]~input_o\,
	datab => \A0|C[13]~12_combout\,
	datac => \A[13]~input_o\,
	datad => \op~input_o\,
	combout => \A0|C[14]~13_combout\);

-- Location: IOIBUF_X31_Y0_N15
\B[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(14),
	o => \B[14]~input_o\);

-- Location: LCCOMB_X21_Y1_N28
\A0|S[14]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[14]~13_combout\ = \A[14]~input_o\ $ (\A0|C[14]~13_combout\ $ (\B[14]~input_o\ $ (\op~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[14]~input_o\,
	datab => \A0|C[14]~13_combout\,
	datac => \B[14]~input_o\,
	datad => \op~input_o\,
	combout => \A0|S[14]~13_combout\);

-- Location: IOIBUF_X14_Y0_N1
\A[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(15),
	o => \A[15]~input_o\);

-- Location: IOIBUF_X12_Y0_N8
\B[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(15),
	o => \B[15]~input_o\);

-- Location: LCCOMB_X21_Y1_N22
\A0|Cout[15]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|Cout[15]~0_combout\ = (\A[14]~input_o\ & ((\A0|C[14]~13_combout\) # (\B[14]~input_o\ $ (\op~input_o\)))) # (!\A[14]~input_o\ & (\A0|C[14]~13_combout\ & (\B[14]~input_o\ $ (\op~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[14]~input_o\,
	datab => \A0|C[14]~13_combout\,
	datac => \B[14]~input_o\,
	datad => \op~input_o\,
	combout => \A0|Cout[15]~0_combout\);

-- Location: LCCOMB_X21_Y1_N0
\A0|S[15]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \A0|S[15]~14_combout\ = \A[15]~input_o\ $ (\B[15]~input_o\ $ (\A0|Cout[15]~0_combout\ $ (\op~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[15]~input_o\,
	datab => \B[15]~input_o\,
	datac => \A0|Cout[15]~0_combout\,
	datad => \op~input_o\,
	combout => \A0|S[15]~14_combout\);

-- Location: LCCOMB_X25_Y19_N12
\WideOr0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~0_combout\ = (\A0|S[6]~5_combout\) # ((\A0|S[4]~3_combout\) # ((\A0|S[7]~6_combout\) # (\A0|S[5]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|S[6]~5_combout\,
	datab => \A0|S[4]~3_combout\,
	datac => \A0|S[7]~6_combout\,
	datad => \A0|S[5]~4_combout\,
	combout => \WideOr0~0_combout\);

-- Location: LCCOMB_X25_Y19_N30
\WideOr0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~1_combout\ = (\WideOr0~0_combout\) # ((\A0|S\(1)) # ((\A0|S[3]~2_combout\) # (\A0|S[2]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr0~0_combout\,
	datab => \A0|S\(1),
	datac => \A0|S[3]~2_combout\,
	datad => \A0|S[2]~1_combout\,
	combout => \WideOr0~1_combout\);

-- Location: LCCOMB_X21_Y1_N18
\WideOr0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~3_combout\ = (\A0|S[12]~11_combout\) # ((\A0|S[15]~14_combout\) # ((\A0|S[14]~13_combout\) # (\A0|S[13]~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|S[12]~11_combout\,
	datab => \A0|S[15]~14_combout\,
	datac => \A0|S[14]~13_combout\,
	datad => \A0|S[13]~12_combout\,
	combout => \WideOr0~3_combout\);

-- Location: LCCOMB_X51_Y22_N0
\WideOr0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~2_combout\ = (\A0|S[11]~10_combout\) # ((\A0|S[8]~7_combout\) # ((\A0|S[10]~9_combout\) # (\A0|S[9]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0|S[11]~10_combout\,
	datab => \A0|S[8]~7_combout\,
	datac => \A0|S[10]~9_combout\,
	datad => \A0|S[9]~8_combout\,
	combout => \WideOr0~2_combout\);

-- Location: LCCOMB_X21_Y1_N20
WideOr0 : cycloneiv_lcell_comb
-- Equation(s):
-- \WideOr0~combout\ = (\WideOr0~1_combout\) # ((\WideOr0~3_combout\) # ((\A0|S[0]~0_combout\) # (\WideOr0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \WideOr0~1_combout\,
	datab => \WideOr0~3_combout\,
	datac => \A0|S[0]~0_combout\,
	datad => \WideOr0~2_combout\,
	combout => \WideOr0~combout\);

-- Location: LCCOMB_X21_Y1_N6
\WideXor0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \WideXor0~0_combout\ = (\A[15]~input_o\ & (!\A0|Cout[15]~0_combout\ & (\B[15]~input_o\ $ (\op~input_o\)))) # (!\A[15]~input_o\ & (\A0|Cout[15]~0_combout\ & (\B[15]~input_o\ $ (!\op~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[15]~input_o\,
	datab => \B[15]~input_o\,
	datac => \A0|Cout[15]~0_combout\,
	datad => \op~input_o\,
	combout => \WideXor0~0_combout\);

ww_S(0) <= \S[0]~output_o\;

ww_S(1) <= \S[1]~output_o\;

ww_S(2) <= \S[2]~output_o\;

ww_S(3) <= \S[3]~output_o\;

ww_S(4) <= \S[4]~output_o\;

ww_S(5) <= \S[5]~output_o\;

ww_S(6) <= \S[6]~output_o\;

ww_S(7) <= \S[7]~output_o\;

ww_S(8) <= \S[8]~output_o\;

ww_S(9) <= \S[9]~output_o\;

ww_S(10) <= \S[10]~output_o\;

ww_S(11) <= \S[11]~output_o\;

ww_S(12) <= \S[12]~output_o\;

ww_S(13) <= \S[13]~output_o\;

ww_S(14) <= \S[14]~output_o\;

ww_S(15) <= \S[15]~output_o\;

ww_N <= \N~output_o\;

ww_Z <= \Z~output_o\;

ww_V <= \V~output_o\;

ww_C <= \C~output_o\;
END structure;


