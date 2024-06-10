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

-- DATE "11/11/2023 18:05:28"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Instruction_Decoder IS
    PORT (
	Inst : IN std_logic_vector(15 DOWNTO 0);
	MOV : BUFFER std_logic;
	ADDI : BUFFER std_logic;
	SUBI : BUFFER std_logic;
	LHI : BUFFER std_logic;
	LLI : BUFFER std_logic;
	LDR : BUFFER std_logic;
	STR : BUFFER std_logic;
	ADD : BUFFER std_logic;
	ADC : BUFFER std_logic;
	SUB : BUFFER std_logic;
	SBB : BUFFER std_logic;
	CMP : BUFFER std_logic;
	BCC : BUFFER std_logic;
	BCS : BUFFER std_logic;
	BNE : BUFFER std_logic;
	BEQ : BUFFER std_logic;
	BAL : BUFFER std_logic;
	JMP : BUFFER std_logic;
	JAL_Label : BUFFER std_logic;
	JAL_Rm : BUFFER std_logic;
	JR : BUFFER std_logic;
	OutR : BUFFER std_logic;
	HLT : BUFFER std_logic
	);
END Instruction_Decoder;

-- Design Ports Information
-- Inst[2]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[4]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[5]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[6]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[7]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MOV	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADDI	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUBI	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LHI	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LLI	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LDR	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STR	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADC	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUB	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SBB	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CMP	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BCC	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BCS	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BNE	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BEQ	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BAL	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JMP	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JAL_Label	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JAL_Rm	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JR	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OutR	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HLT	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[12]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[11]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[13]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[14]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[15]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[1]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[0]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[9]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[8]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Inst[10]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Instruction_Decoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Inst : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_MOV : std_logic;
SIGNAL ww_ADDI : std_logic;
SIGNAL ww_SUBI : std_logic;
SIGNAL ww_LHI : std_logic;
SIGNAL ww_LLI : std_logic;
SIGNAL ww_LDR : std_logic;
SIGNAL ww_STR : std_logic;
SIGNAL ww_ADD : std_logic;
SIGNAL ww_ADC : std_logic;
SIGNAL ww_SUB : std_logic;
SIGNAL ww_SBB : std_logic;
SIGNAL ww_CMP : std_logic;
SIGNAL ww_BCC : std_logic;
SIGNAL ww_BCS : std_logic;
SIGNAL ww_BNE : std_logic;
SIGNAL ww_BEQ : std_logic;
SIGNAL ww_BAL : std_logic;
SIGNAL ww_JMP : std_logic;
SIGNAL ww_JAL_Label : std_logic;
SIGNAL ww_JAL_Rm : std_logic;
SIGNAL ww_JR : std_logic;
SIGNAL ww_OutR : std_logic;
SIGNAL ww_HLT : std_logic;
SIGNAL \Inst[2]~input_o\ : std_logic;
SIGNAL \Inst[3]~input_o\ : std_logic;
SIGNAL \Inst[4]~input_o\ : std_logic;
SIGNAL \Inst[5]~input_o\ : std_logic;
SIGNAL \Inst[6]~input_o\ : std_logic;
SIGNAL \Inst[7]~input_o\ : std_logic;
SIGNAL \MOV~output_o\ : std_logic;
SIGNAL \ADDI~output_o\ : std_logic;
SIGNAL \SUBI~output_o\ : std_logic;
SIGNAL \LHI~output_o\ : std_logic;
SIGNAL \LLI~output_o\ : std_logic;
SIGNAL \LDR~output_o\ : std_logic;
SIGNAL \STR~output_o\ : std_logic;
SIGNAL \ADD~output_o\ : std_logic;
SIGNAL \ADC~output_o\ : std_logic;
SIGNAL \SUB~output_o\ : std_logic;
SIGNAL \SBB~output_o\ : std_logic;
SIGNAL \CMP~output_o\ : std_logic;
SIGNAL \BCC~output_o\ : std_logic;
SIGNAL \BCS~output_o\ : std_logic;
SIGNAL \BNE~output_o\ : std_logic;
SIGNAL \BEQ~output_o\ : std_logic;
SIGNAL \BAL~output_o\ : std_logic;
SIGNAL \JMP~output_o\ : std_logic;
SIGNAL \JAL_Label~output_o\ : std_logic;
SIGNAL \JAL_Rm~output_o\ : std_logic;
SIGNAL \JR~output_o\ : std_logic;
SIGNAL \OutR~output_o\ : std_logic;
SIGNAL \HLT~output_o\ : std_logic;
SIGNAL \Inst[14]~input_o\ : std_logic;
SIGNAL \Inst[11]~input_o\ : std_logic;
SIGNAL \Inst[13]~input_o\ : std_logic;
SIGNAL \MOV~0_combout\ : std_logic;
SIGNAL \Inst[15]~input_o\ : std_logic;
SIGNAL \Inst[12]~input_o\ : std_logic;
SIGNAL \MOV~1_combout\ : std_logic;
SIGNAL \ADC~0_combout\ : std_logic;
SIGNAL \ADDI~0_combout\ : std_logic;
SIGNAL \ADC~1_combout\ : std_logic;
SIGNAL \SUBI~0_combout\ : std_logic;
SIGNAL \LHI~0_combout\ : std_logic;
SIGNAL \LLI~0_combout\ : std_logic;
SIGNAL \LLI~1_combout\ : std_logic;
SIGNAL \LDR~0_combout\ : std_logic;
SIGNAL \STR~0_combout\ : std_logic;
SIGNAL \Inst[1]~input_o\ : std_logic;
SIGNAL \Inst[0]~input_o\ : std_logic;
SIGNAL \ADD~0_combout\ : std_logic;
SIGNAL \ADC~2_combout\ : std_logic;
SIGNAL \SUB~0_combout\ : std_logic;
SIGNAL \SBB~0_combout\ : std_logic;
SIGNAL \CMP~0_combout\ : std_logic;
SIGNAL \CMP~1_combout\ : std_logic;
SIGNAL \Inst[8]~input_o\ : std_logic;
SIGNAL \Inst[9]~input_o\ : std_logic;
SIGNAL \Inst[10]~input_o\ : std_logic;
SIGNAL \BCC~0_combout\ : std_logic;
SIGNAL \BCC~1_combout\ : std_logic;
SIGNAL \BCS~0_combout\ : std_logic;
SIGNAL \BNE~0_combout\ : std_logic;
SIGNAL \BEQ~0_combout\ : std_logic;
SIGNAL \BAL~0_combout\ : std_logic;
SIGNAL \BAL~1_combout\ : std_logic;
SIGNAL \JMP~0_combout\ : std_logic;
SIGNAL \JAL_Label~0_combout\ : std_logic;
SIGNAL \JAL_Rm~0_combout\ : std_logic;
SIGNAL \JR~0_combout\ : std_logic;
SIGNAL \OutR~0_combout\ : std_logic;
SIGNAL \OutR~1_combout\ : std_logic;
SIGNAL \HLT~0_combout\ : std_logic;
SIGNAL \ALT_INV_ADD~0_combout\ : std_logic;

BEGIN

ww_Inst <= Inst;
MOV <= ww_MOV;
ADDI <= ww_ADDI;
SUBI <= ww_SUBI;
LHI <= ww_LHI;
LLI <= ww_LLI;
LDR <= ww_LDR;
STR <= ww_STR;
ADD <= ww_ADD;
ADC <= ww_ADC;
SUB <= ww_SUB;
SBB <= ww_SBB;
CMP <= ww_CMP;
BCC <= ww_BCC;
BCS <= ww_BCS;
BNE <= ww_BNE;
BEQ <= ww_BEQ;
BAL <= ww_BAL;
JMP <= ww_JMP;
JAL_Label <= ww_JAL_Label;
JAL_Rm <= ww_JAL_Rm;
JR <= ww_JR;
OutR <= ww_OutR;
HLT <= ww_HLT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_ADD~0_combout\ <= NOT \ADD~0_combout\;

-- Location: IOOBUF_X33_Y24_N2
\MOV~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MOV~1_combout\,
	devoe => ww_devoe,
	o => \MOV~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\ADDI~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ADDI~0_combout\,
	devoe => ww_devoe,
	o => \ADDI~output_o\);

-- Location: IOOBUF_X33_Y12_N2
\SUBI~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SUBI~0_combout\,
	devoe => ww_devoe,
	o => \SUBI~output_o\);

-- Location: IOOBUF_X31_Y31_N2
\LHI~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LHI~0_combout\,
	devoe => ww_devoe,
	o => \LHI~output_o\);

-- Location: IOOBUF_X24_Y31_N9
\LLI~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LLI~1_combout\,
	devoe => ww_devoe,
	o => \LLI~output_o\);

-- Location: IOOBUF_X33_Y24_N9
\LDR~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LDR~0_combout\,
	devoe => ww_devoe,
	o => \LDR~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\STR~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \STR~0_combout\,
	devoe => ww_devoe,
	o => \STR~output_o\);

-- Location: IOOBUF_X14_Y31_N2
\ADD~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_ADD~0_combout\,
	devoe => ww_devoe,
	o => \ADD~output_o\);

-- Location: IOOBUF_X12_Y31_N9
\ADC~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ADC~2_combout\,
	devoe => ww_devoe,
	o => \ADC~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\SUB~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SUB~0_combout\,
	devoe => ww_devoe,
	o => \SUB~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\SBB~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SBB~0_combout\,
	devoe => ww_devoe,
	o => \SBB~output_o\);

-- Location: IOOBUF_X12_Y31_N2
\CMP~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CMP~1_combout\,
	devoe => ww_devoe,
	o => \CMP~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\BCC~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BCC~1_combout\,
	devoe => ww_devoe,
	o => \BCC~output_o\);

-- Location: IOOBUF_X33_Y22_N2
\BCS~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BCS~0_combout\,
	devoe => ww_devoe,
	o => \BCS~output_o\);

-- Location: IOOBUF_X33_Y27_N2
\BNE~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BNE~0_combout\,
	devoe => ww_devoe,
	o => \BNE~output_o\);

-- Location: IOOBUF_X26_Y31_N2
\BEQ~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BEQ~0_combout\,
	devoe => ww_devoe,
	o => \BEQ~output_o\);

-- Location: IOOBUF_X33_Y11_N9
\BAL~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \BAL~1_combout\,
	devoe => ww_devoe,
	o => \BAL~output_o\);

-- Location: IOOBUF_X20_Y31_N9
\JMP~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \JMP~0_combout\,
	devoe => ww_devoe,
	o => \JMP~output_o\);

-- Location: IOOBUF_X24_Y31_N2
\JAL_Label~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \JAL_Label~0_combout\,
	devoe => ww_devoe,
	o => \JAL_Label~output_o\);

-- Location: IOOBUF_X12_Y0_N2
\JAL_Rm~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \JAL_Rm~0_combout\,
	devoe => ww_devoe,
	o => \JAL_Rm~output_o\);

-- Location: IOOBUF_X33_Y15_N9
\JR~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \JR~0_combout\,
	devoe => ww_devoe,
	o => \JR~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\OutR~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \OutR~1_combout\,
	devoe => ww_devoe,
	o => \OutR~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\HLT~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \HLT~0_combout\,
	devoe => ww_devoe,
	o => \HLT~output_o\);

-- Location: IOIBUF_X22_Y31_N8
\Inst[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(14),
	o => \Inst[14]~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\Inst[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(11),
	o => \Inst[11]~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\Inst[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(13),
	o => \Inst[13]~input_o\);

-- Location: LCCOMB_X16_Y7_N8
\MOV~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MOV~0_combout\ = (\Inst[11]~input_o\ & !\Inst[13]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Inst[11]~input_o\,
	datad => \Inst[13]~input_o\,
	combout => \MOV~0_combout\);

-- Location: IOIBUF_X16_Y31_N1
\Inst[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(15),
	o => \Inst[15]~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\Inst[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(12),
	o => \Inst[12]~input_o\);

-- Location: LCCOMB_X31_Y21_N16
\MOV~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \MOV~1_combout\ = (\Inst[14]~input_o\ & (\MOV~0_combout\ & (!\Inst[15]~input_o\ & \Inst[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[14]~input_o\,
	datab => \MOV~0_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[12]~input_o\,
	combout => \MOV~1_combout\);

-- Location: LCCOMB_X16_Y7_N10
\ADC~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ADC~0_combout\ = (!\Inst[14]~input_o\ & !\Inst[15]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Inst[14]~input_o\,
	datad => \Inst[15]~input_o\,
	combout => \ADC~0_combout\);

-- Location: LCCOMB_X16_Y7_N28
\ADDI~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ADDI~0_combout\ = (\ADC~0_combout\ & (\Inst[12]~input_o\ & (\Inst[11]~input_o\ & \Inst[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~0_combout\,
	datab => \Inst[12]~input_o\,
	datac => \Inst[11]~input_o\,
	datad => \Inst[13]~input_o\,
	combout => \ADDI~0_combout\);

-- Location: LCCOMB_X16_Y7_N22
\ADC~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ADC~1_combout\ = (!\Inst[11]~input_o\ & (!\Inst[12]~input_o\ & !\Inst[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[11]~input_o\,
	datac => \Inst[12]~input_o\,
	datad => \Inst[13]~input_o\,
	combout => \ADC~1_combout\);

-- Location: LCCOMB_X31_Y21_N18
\SUBI~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SUBI~0_combout\ = (\ADC~1_combout\ & (!\Inst[15]~input_o\ & \Inst[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADC~1_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[14]~input_o\,
	combout => \SUBI~0_combout\);

-- Location: LCCOMB_X31_Y21_N20
\LHI~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LHI~0_combout\ = (!\Inst[14]~input_o\ & (\MOV~0_combout\ & (!\Inst[15]~input_o\ & !\Inst[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[14]~input_o\,
	datab => \MOV~0_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[12]~input_o\,
	combout => \LHI~0_combout\);

-- Location: LCCOMB_X16_Y7_N24
\LLI~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LLI~0_combout\ = (!\Inst[11]~input_o\ & (!\Inst[14]~input_o\ & (\Inst[12]~input_o\ & !\Inst[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[11]~input_o\,
	datab => \Inst[14]~input_o\,
	datac => \Inst[12]~input_o\,
	datad => \Inst[13]~input_o\,
	combout => \LLI~0_combout\);

-- Location: LCCOMB_X31_Y21_N30
\LLI~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LLI~1_combout\ = (!\Inst[15]~input_o\ & \LLI~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Inst[15]~input_o\,
	datad => \LLI~0_combout\,
	combout => \LLI~1_combout\);

-- Location: LCCOMB_X31_Y21_N8
\LDR~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LDR~0_combout\ = (!\Inst[14]~input_o\ & (\MOV~0_combout\ & (!\Inst[15]~input_o\ & \Inst[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[14]~input_o\,
	datab => \MOV~0_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[12]~input_o\,
	combout => \LDR~0_combout\);

-- Location: LCCOMB_X16_Y7_N18
\STR~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \STR~0_combout\ = (\ADC~0_combout\ & (!\Inst[12]~input_o\ & (\Inst[11]~input_o\ & \Inst[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~0_combout\,
	datab => \Inst[12]~input_o\,
	datac => \Inst[11]~input_o\,
	datad => \Inst[13]~input_o\,
	combout => \STR~0_combout\);

-- Location: IOIBUF_X16_Y31_N8
\Inst[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(1),
	o => \Inst[1]~input_o\);

-- Location: IOIBUF_X33_Y25_N8
\Inst[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(0),
	o => \Inst[0]~input_o\);

-- Location: LCCOMB_X16_Y7_N4
\ADD~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ADD~0_combout\ = ((\Inst[1]~input_o\) # ((\Inst[0]~input_o\) # (!\ADC~1_combout\))) # (!\ADC~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~0_combout\,
	datab => \Inst[1]~input_o\,
	datac => \ADC~1_combout\,
	datad => \Inst[0]~input_o\,
	combout => \ADD~0_combout\);

-- Location: LCCOMB_X16_Y7_N30
\ADC~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ADC~2_combout\ = (\ADC~0_combout\ & (!\Inst[1]~input_o\ & (\ADC~1_combout\ & \Inst[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~0_combout\,
	datab => \Inst[1]~input_o\,
	datac => \ADC~1_combout\,
	datad => \Inst[0]~input_o\,
	combout => \ADC~2_combout\);

-- Location: LCCOMB_X16_Y7_N16
\SUB~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SUB~0_combout\ = (\ADC~0_combout\ & (\Inst[1]~input_o\ & (\ADC~1_combout\ & !\Inst[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~0_combout\,
	datab => \Inst[1]~input_o\,
	datac => \ADC~1_combout\,
	datad => \Inst[0]~input_o\,
	combout => \SUB~0_combout\);

-- Location: LCCOMB_X16_Y7_N2
\SBB~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \SBB~0_combout\ = (\ADC~0_combout\ & (\Inst[1]~input_o\ & (\ADC~1_combout\ & \Inst[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~0_combout\,
	datab => \Inst[1]~input_o\,
	datac => \ADC~1_combout\,
	datad => \Inst[0]~input_o\,
	combout => \SBB~0_combout\);

-- Location: LCCOMB_X16_Y7_N12
\CMP~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \CMP~0_combout\ = (!\Inst[1]~input_o\ & (!\Inst[11]~input_o\ & \Inst[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Inst[1]~input_o\,
	datac => \Inst[11]~input_o\,
	datad => \Inst[13]~input_o\,
	combout => \CMP~0_combout\);

-- Location: LCCOMB_X16_Y7_N14
\CMP~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \CMP~1_combout\ = (\ADC~0_combout\ & (\Inst[0]~input_o\ & (\Inst[12]~input_o\ & \CMP~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~0_combout\,
	datab => \Inst[0]~input_o\,
	datac => \Inst[12]~input_o\,
	datad => \CMP~0_combout\,
	combout => \CMP~1_combout\);

-- Location: IOIBUF_X33_Y14_N8
\Inst[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(8),
	o => \Inst[8]~input_o\);

-- Location: IOIBUF_X33_Y22_N8
\Inst[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(9),
	o => \Inst[9]~input_o\);

-- Location: IOIBUF_X33_Y25_N1
\Inst[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(10),
	o => \Inst[10]~input_o\);

-- Location: LCCOMB_X31_Y21_N10
\BCC~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BCC~0_combout\ = (\Inst[14]~input_o\ & (\ADC~1_combout\ & (\Inst[15]~input_o\ & !\Inst[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[14]~input_o\,
	datab => \ADC~1_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[10]~input_o\,
	combout => \BCC~0_combout\);

-- Location: LCCOMB_X31_Y21_N4
\BCC~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BCC~1_combout\ = (\Inst[8]~input_o\ & (\Inst[9]~input_o\ & \BCC~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[8]~input_o\,
	datac => \Inst[9]~input_o\,
	datad => \BCC~0_combout\,
	combout => \BCC~1_combout\);

-- Location: LCCOMB_X31_Y21_N6
\BCS~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BCS~0_combout\ = (!\Inst[8]~input_o\ & (\Inst[9]~input_o\ & \BCC~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[8]~input_o\,
	datac => \Inst[9]~input_o\,
	datad => \BCC~0_combout\,
	combout => \BCS~0_combout\);

-- Location: LCCOMB_X31_Y21_N0
\BNE~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BNE~0_combout\ = (\Inst[8]~input_o\ & (!\Inst[9]~input_o\ & \BCC~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[8]~input_o\,
	datac => \Inst[9]~input_o\,
	datad => \BCC~0_combout\,
	combout => \BNE~0_combout\);

-- Location: LCCOMB_X31_Y21_N2
\BEQ~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BEQ~0_combout\ = (!\Inst[8]~input_o\ & (!\Inst[9]~input_o\ & \BCC~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[8]~input_o\,
	datac => \Inst[9]~input_o\,
	datad => \BCC~0_combout\,
	combout => \BEQ~0_combout\);

-- Location: LCCOMB_X31_Y21_N28
\BAL~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BAL~0_combout\ = (\Inst[14]~input_o\ & (!\Inst[12]~input_o\ & (\Inst[15]~input_o\ & \Inst[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[14]~input_o\,
	datab => \Inst[12]~input_o\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[10]~input_o\,
	combout => \BAL~0_combout\);

-- Location: LCCOMB_X31_Y21_N14
\BAL~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \BAL~1_combout\ = (\Inst[9]~input_o\ & (\MOV~0_combout\ & (!\Inst[8]~input_o\ & \BAL~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[9]~input_o\,
	datab => \MOV~0_combout\,
	datac => \Inst[8]~input_o\,
	datad => \BAL~0_combout\,
	combout => \BAL~1_combout\);

-- Location: LCCOMB_X31_Y21_N24
\JMP~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \JMP~0_combout\ = (\ADC~1_combout\ & (\Inst[15]~input_o\ & !\Inst[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADC~1_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[14]~input_o\,
	combout => \JMP~0_combout\);

-- Location: LCCOMB_X31_Y21_N26
\JAL_Label~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \JAL_Label~0_combout\ = (!\Inst[14]~input_o\ & (\MOV~0_combout\ & (\Inst[15]~input_o\ & !\Inst[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[14]~input_o\,
	datab => \MOV~0_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[12]~input_o\,
	combout => \JAL_Label~0_combout\);

-- Location: LCCOMB_X16_Y7_N0
\JAL_Rm~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \JAL_Rm~0_combout\ = (\LLI~0_combout\ & \Inst[15]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LLI~0_combout\,
	datad => \Inst[15]~input_o\,
	combout => \JAL_Rm~0_combout\);

-- Location: LCCOMB_X31_Y21_N12
\JR~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \JR~0_combout\ = (!\Inst[14]~input_o\ & (\MOV~0_combout\ & (\Inst[15]~input_o\ & \Inst[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Inst[14]~input_o\,
	datab => \MOV~0_combout\,
	datac => \Inst[15]~input_o\,
	datad => \Inst[12]~input_o\,
	combout => \JR~0_combout\);

-- Location: LCCOMB_X16_Y7_N26
\OutR~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \OutR~0_combout\ = (\CMP~0_combout\ & (\Inst[14]~input_o\ & (!\Inst[12]~input_o\ & \Inst[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMP~0_combout\,
	datab => \Inst[14]~input_o\,
	datac => \Inst[12]~input_o\,
	datad => \Inst[15]~input_o\,
	combout => \OutR~0_combout\);

-- Location: LCCOMB_X16_Y7_N20
\OutR~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \OutR~1_combout\ = (\OutR~0_combout\ & !\Inst[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \OutR~0_combout\,
	datad => \Inst[0]~input_o\,
	combout => \OutR~1_combout\);

-- Location: LCCOMB_X16_Y7_N6
\HLT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \HLT~0_combout\ = (\OutR~0_combout\ & \Inst[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \OutR~0_combout\,
	datad => \Inst[0]~input_o\,
	combout => \HLT~0_combout\);

-- Location: IOIBUF_X20_Y31_N1
\Inst[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(2),
	o => \Inst[2]~input_o\);

-- Location: IOIBUF_X14_Y31_N8
\Inst[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(3),
	o => \Inst[3]~input_o\);

-- Location: IOIBUF_X29_Y0_N1
\Inst[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(4),
	o => \Inst[4]~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\Inst[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(5),
	o => \Inst[5]~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\Inst[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(6),
	o => \Inst[6]~input_o\);

-- Location: IOIBUF_X20_Y0_N8
\Inst[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Inst(7),
	o => \Inst[7]~input_o\);

ww_MOV <= \MOV~output_o\;

ww_ADDI <= \ADDI~output_o\;

ww_SUBI <= \SUBI~output_o\;

ww_LHI <= \LHI~output_o\;

ww_LLI <= \LLI~output_o\;

ww_LDR <= \LDR~output_o\;

ww_STR <= \STR~output_o\;

ww_ADD <= \ADD~output_o\;

ww_ADC <= \ADC~output_o\;

ww_SUB <= \SUB~output_o\;

ww_SBB <= \SBB~output_o\;

ww_CMP <= \CMP~output_o\;

ww_BCC <= \BCC~output_o\;

ww_BCS <= \BCS~output_o\;

ww_BNE <= \BNE~output_o\;

ww_BEQ <= \BEQ~output_o\;

ww_BAL <= \BAL~output_o\;

ww_JMP <= \JMP~output_o\;

ww_JAL_Label <= \JAL_Label~output_o\;

ww_JAL_Rm <= \JAL_Rm~output_o\;

ww_JR <= \JR~output_o\;

ww_OutR <= \OutR~output_o\;

ww_HLT <= \HLT~output_o\;
END structure;


