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

-- DATE "11/11/2023 21:57:10"

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

ENTITY 	Controller IS
    PORT (
	MOV : IN std_logic;
	ADDI : IN std_logic;
	SUBI : IN std_logic;
	LHI : IN std_logic;
	LLI : IN std_logic;
	LDR : IN std_logic;
	STR : IN std_logic;
	ADD : IN std_logic;
	ADC : IN std_logic;
	SUB : IN std_logic;
	SBB : IN std_logic;
	CMP : IN std_logic;
	BCC : IN std_logic;
	BCS : IN std_logic;
	BNE : IN std_logic;
	BEQ : IN std_logic;
	BAL : IN std_logic;
	JMP : IN std_logic;
	JAL_Label : IN std_logic;
	JAL_Rm : IN std_logic;
	JR : IN std_logic;
	OutR : IN std_logic;
	HLT : IN std_logic;
	RF_rt_addr : BUFFER std_logic;
	RF_wr_en : BUFFER std_logic;
	RF_wr_from : BUFFER std_logic;
	Imm5or8 : BUFFER std_logic;
	JAL : BUFFER std_logic;
	ALU_B : BUFFER std_logic;
	ALU_op : BUFFER std_logic;
	ALU_PSW : BUFFER std_logic;
	Memory_wr_en : BUFFER std_logic;
	ALU_target : BUFFER std_logic_vector(1 DOWNTO 0)
	);
END Controller;

-- Design Ports Information
-- BCC	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BCS	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BNE	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BEQ	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BAL	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JMP	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- OutR	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HLT	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RF_rt_addr	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RF_wr_en	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RF_wr_from	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Imm5or8	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JAL	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_B	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_op	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_PSW	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Memory_wr_en	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_target[0]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALU_target[1]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LHI	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- STR	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JR	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LDR	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JAL_Label	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- JAL_Rm	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADDI	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUBI	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADC	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SBB	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADD	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUB	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LLI	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MOV	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CMP	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Controller IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
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
SIGNAL ww_RF_rt_addr : std_logic;
SIGNAL ww_RF_wr_en : std_logic;
SIGNAL ww_RF_wr_from : std_logic;
SIGNAL ww_Imm5or8 : std_logic;
SIGNAL ww_JAL : std_logic;
SIGNAL ww_ALU_B : std_logic;
SIGNAL ww_ALU_op : std_logic;
SIGNAL ww_ALU_PSW : std_logic;
SIGNAL ww_Memory_wr_en : std_logic;
SIGNAL ww_ALU_target : std_logic_vector(1 DOWNTO 0);
SIGNAL \BCC~input_o\ : std_logic;
SIGNAL \BCS~input_o\ : std_logic;
SIGNAL \BNE~input_o\ : std_logic;
SIGNAL \BEQ~input_o\ : std_logic;
SIGNAL \BAL~input_o\ : std_logic;
SIGNAL \JMP~input_o\ : std_logic;
SIGNAL \OutR~input_o\ : std_logic;
SIGNAL \HLT~input_o\ : std_logic;
SIGNAL \RF_rt_addr~output_o\ : std_logic;
SIGNAL \RF_wr_en~output_o\ : std_logic;
SIGNAL \RF_wr_from~output_o\ : std_logic;
SIGNAL \Imm5or8~output_o\ : std_logic;
SIGNAL \JAL~output_o\ : std_logic;
SIGNAL \ALU_B~output_o\ : std_logic;
SIGNAL \ALU_op~output_o\ : std_logic;
SIGNAL \ALU_PSW~output_o\ : std_logic;
SIGNAL \Memory_wr_en~output_o\ : std_logic;
SIGNAL \ALU_target[0]~output_o\ : std_logic;
SIGNAL \ALU_target[1]~output_o\ : std_logic;
SIGNAL \STR~input_o\ : std_logic;
SIGNAL \JR~input_o\ : std_logic;
SIGNAL \LHI~input_o\ : std_logic;
SIGNAL \RF_rt_addr~0_combout\ : std_logic;
SIGNAL \LDR~input_o\ : std_logic;
SIGNAL \JAL_Label~input_o\ : std_logic;
SIGNAL \SUBI~input_o\ : std_logic;
SIGNAL \ADDI~input_o\ : std_logic;
SIGNAL \Imm5or8~0_combout\ : std_logic;
SIGNAL \LLI~input_o\ : std_logic;
SIGNAL \ALU_target~0_combout\ : std_logic;
SIGNAL \MOV~input_o\ : std_logic;
SIGNAL \SUB~input_o\ : std_logic;
SIGNAL \SBB~input_o\ : std_logic;
SIGNAL \ADD~input_o\ : std_logic;
SIGNAL \ADC~input_o\ : std_logic;
SIGNAL \ALU_PSW~2_combout\ : std_logic;
SIGNAL \RF_wr_from~0_combout\ : std_logic;
SIGNAL \JAL_Rm~input_o\ : std_logic;
SIGNAL \RF_wr_en~0_combout\ : std_logic;
SIGNAL \Imm5or8~1_combout\ : std_logic;
SIGNAL \RF_wr_en~1_combout\ : std_logic;
SIGNAL \CMP~input_o\ : std_logic;
SIGNAL \ALU_B~0_combout\ : std_logic;
SIGNAL \ALU_op~0_combout\ : std_logic;
SIGNAL \ALU_PSW~3_combout\ : std_logic;
SIGNAL \ALU_target~1_combout\ : std_logic;
SIGNAL \ALT_INV_RF_wr_en~1_combout\ : std_logic;
SIGNAL \ALT_INV_RF_wr_from~0_combout\ : std_logic;
SIGNAL \ALT_INV_ALU_target~0_combout\ : std_logic;

BEGIN

ww_MOV <= MOV;
ww_ADDI <= ADDI;
ww_SUBI <= SUBI;
ww_LHI <= LHI;
ww_LLI <= LLI;
ww_LDR <= LDR;
ww_STR <= STR;
ww_ADD <= ADD;
ww_ADC <= ADC;
ww_SUB <= SUB;
ww_SBB <= SBB;
ww_CMP <= CMP;
ww_BCC <= BCC;
ww_BCS <= BCS;
ww_BNE <= BNE;
ww_BEQ <= BEQ;
ww_BAL <= BAL;
ww_JMP <= JMP;
ww_JAL_Label <= JAL_Label;
ww_JAL_Rm <= JAL_Rm;
ww_JR <= JR;
ww_OutR <= OutR;
ww_HLT <= HLT;
RF_rt_addr <= ww_RF_rt_addr;
RF_wr_en <= ww_RF_wr_en;
RF_wr_from <= ww_RF_wr_from;
Imm5or8 <= ww_Imm5or8;
JAL <= ww_JAL;
ALU_B <= ww_ALU_B;
ALU_op <= ww_ALU_op;
ALU_PSW <= ww_ALU_PSW;
Memory_wr_en <= ww_Memory_wr_en;
ALU_target <= ww_ALU_target;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_RF_wr_en~1_combout\ <= NOT \RF_wr_en~1_combout\;
\ALT_INV_RF_wr_from~0_combout\ <= NOT \RF_wr_from~0_combout\;
\ALT_INV_ALU_target~0_combout\ <= NOT \ALU_target~0_combout\;

-- Location: IOOBUF_X20_Y31_N9
\RF_rt_addr~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF_rt_addr~0_combout\,
	devoe => ww_devoe,
	o => \RF_rt_addr~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\RF_wr_en~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RF_wr_en~0_combout\,
	devoe => ww_devoe,
	o => \RF_wr_en~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\RF_wr_from~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RF_wr_from~0_combout\,
	devoe => ww_devoe,
	o => \RF_wr_from~output_o\);

-- Location: IOOBUF_X33_Y10_N9
\Imm5or8~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Imm5or8~1_combout\,
	devoe => ww_devoe,
	o => \Imm5or8~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\JAL~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RF_wr_en~1_combout\,
	devoe => ww_devoe,
	o => \JAL~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\ALU_B~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_B~0_combout\,
	devoe => ww_devoe,
	o => \ALU_B~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\ALU_op~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_op~0_combout\,
	devoe => ww_devoe,
	o => \ALU_op~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\ALU_PSW~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_PSW~3_combout\,
	devoe => ww_devoe,
	o => \ALU_PSW~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\Memory_wr_en~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \STR~input_o\,
	devoe => ww_devoe,
	o => \Memory_wr_en~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\ALU_target[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALU_target~1_combout\,
	devoe => ww_devoe,
	o => \ALU_target[0]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\ALU_target[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_ALU_target~0_combout\,
	devoe => ww_devoe,
	o => \ALU_target[1]~output_o\);

-- Location: IOIBUF_X31_Y0_N1
\STR~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_STR,
	o => \STR~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\JR~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JR,
	o => \JR~input_o\);

-- Location: IOIBUF_X33_Y14_N1
\LHI~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LHI,
	o => \LHI~input_o\);

-- Location: LCCOMB_X24_Y1_N0
\RF_rt_addr~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RF_rt_addr~0_combout\ = (\STR~input_o\) # ((\JR~input_o\) # (\LHI~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STR~input_o\,
	datac => \JR~input_o\,
	datad => \LHI~input_o\,
	combout => \RF_rt_addr~0_combout\);

-- Location: IOIBUF_X10_Y0_N8
\LDR~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LDR,
	o => \LDR~input_o\);

-- Location: IOIBUF_X12_Y0_N1
\JAL_Label~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JAL_Label,
	o => \JAL_Label~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\SUBI~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SUBI,
	o => \SUBI~input_o\);

-- Location: IOIBUF_X33_Y16_N1
\ADDI~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDI,
	o => \ADDI~input_o\);

-- Location: LCCOMB_X24_Y1_N10
\Imm5or8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Imm5or8~0_combout\ = (!\SUBI~input_o\ & !\ADDI~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SUBI~input_o\,
	datac => \ADDI~input_o\,
	combout => \Imm5or8~0_combout\);

-- Location: IOIBUF_X24_Y0_N8
\LLI~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_LLI,
	o => \LLI~input_o\);

-- Location: LCCOMB_X24_Y1_N6
\ALU_target~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALU_target~0_combout\ = (!\LLI~input_o\ & !\LHI~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LLI~input_o\,
	datad => \LHI~input_o\,
	combout => \ALU_target~0_combout\);

-- Location: IOIBUF_X14_Y0_N8
\MOV~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_MOV,
	o => \MOV~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\SUB~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SUB,
	o => \SUB~input_o\);

-- Location: IOIBUF_X33_Y11_N1
\SBB~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SBB,
	o => \SBB~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\ADD~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADD,
	o => \ADD~input_o\);

-- Location: IOIBUF_X33_Y22_N8
\ADC~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADC,
	o => \ADC~input_o\);

-- Location: LCCOMB_X24_Y1_N12
\ALU_PSW~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALU_PSW~2_combout\ = (!\SUB~input_o\ & (!\SBB~input_o\ & (!\ADD~input_o\ & !\ADC~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SUB~input_o\,
	datab => \SBB~input_o\,
	datac => \ADD~input_o\,
	datad => \ADC~input_o\,
	combout => \ALU_PSW~2_combout\);

-- Location: LCCOMB_X24_Y1_N8
\RF_wr_from~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RF_wr_from~0_combout\ = (\Imm5or8~0_combout\ & (\ALU_target~0_combout\ & (!\MOV~input_o\ & \ALU_PSW~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Imm5or8~0_combout\,
	datab => \ALU_target~0_combout\,
	datac => \MOV~input_o\,
	datad => \ALU_PSW~2_combout\,
	combout => \RF_wr_from~0_combout\);

-- Location: IOIBUF_X33_Y16_N8
\JAL_Rm~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JAL_Rm,
	o => \JAL_Rm~input_o\);

-- Location: LCCOMB_X24_Y1_N2
\RF_wr_en~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RF_wr_en~0_combout\ = (\LDR~input_o\) # ((\JAL_Label~input_o\) # ((\JAL_Rm~input_o\) # (!\RF_wr_from~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LDR~input_o\,
	datab => \JAL_Label~input_o\,
	datac => \RF_wr_from~0_combout\,
	datad => \JAL_Rm~input_o\,
	combout => \RF_wr_en~0_combout\);

-- Location: LCCOMB_X24_Y1_N20
\Imm5or8~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Imm5or8~1_combout\ = (\STR~input_o\) # ((\SUBI~input_o\) # ((\ADDI~input_o\) # (\LDR~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \STR~input_o\,
	datab => \SUBI~input_o\,
	datac => \ADDI~input_o\,
	datad => \LDR~input_o\,
	combout => \Imm5or8~1_combout\);

-- Location: LCCOMB_X24_Y1_N30
\RF_wr_en~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \RF_wr_en~1_combout\ = (!\JAL_Label~input_o\ & !\JAL_Rm~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \JAL_Label~input_o\,
	datad => \JAL_Rm~input_o\,
	combout => \RF_wr_en~1_combout\);

-- Location: IOIBUF_X20_Y31_N1
\CMP~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CMP,
	o => \CMP~input_o\);

-- Location: LCCOMB_X24_Y1_N24
\ALU_B~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALU_B~0_combout\ = (\CMP~input_o\) # ((\MOV~input_o\) # (!\ALU_PSW~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CMP~input_o\,
	datac => \MOV~input_o\,
	datad => \ALU_PSW~2_combout\,
	combout => \ALU_B~0_combout\);

-- Location: LCCOMB_X24_Y1_N26
\ALU_op~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALU_op~0_combout\ = (\SUB~input_o\) # ((\SBB~input_o\) # ((\SUBI~input_o\) # (\CMP~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SUB~input_o\,
	datab => \SBB~input_o\,
	datac => \SUBI~input_o\,
	datad => \CMP~input_o\,
	combout => \ALU_op~0_combout\);

-- Location: LCCOMB_X24_Y1_N22
\ALU_PSW~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALU_PSW~3_combout\ = ((\SUBI~input_o\) # ((\ADDI~input_o\) # (\CMP~input_o\))) # (!\ALU_PSW~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_PSW~2_combout\,
	datab => \SUBI~input_o\,
	datac => \ADDI~input_o\,
	datad => \CMP~input_o\,
	combout => \ALU_PSW~3_combout\);

-- Location: LCCOMB_X24_Y1_N28
\ALU_target~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ALU_target~1_combout\ = (\ADC~input_o\) # ((\LLI~input_o\) # (\SBB~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADC~input_o\,
	datab => \LLI~input_o\,
	datad => \SBB~input_o\,
	combout => \ALU_target~1_combout\);

-- Location: IOIBUF_X16_Y0_N8
\BCC~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BCC,
	o => \BCC~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\BCS~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BCS,
	o => \BCS~input_o\);

-- Location: IOIBUF_X33_Y27_N8
\BNE~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BNE,
	o => \BNE~input_o\);

-- Location: IOIBUF_X33_Y12_N1
\BEQ~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BEQ,
	o => \BEQ~input_o\);

-- Location: IOIBUF_X26_Y31_N1
\BAL~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BAL,
	o => \BAL~input_o\);

-- Location: IOIBUF_X33_Y12_N8
\JMP~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_JMP,
	o => \JMP~input_o\);

-- Location: IOIBUF_X33_Y24_N1
\OutR~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_OutR,
	o => \OutR~input_o\);

-- Location: IOIBUF_X12_Y31_N1
\HLT~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_HLT,
	o => \HLT~input_o\);

ww_RF_rt_addr <= \RF_rt_addr~output_o\;

ww_RF_wr_en <= \RF_wr_en~output_o\;

ww_RF_wr_from <= \RF_wr_from~output_o\;

ww_Imm5or8 <= \Imm5or8~output_o\;

ww_JAL <= \JAL~output_o\;

ww_ALU_B <= \ALU_B~output_o\;

ww_ALU_op <= \ALU_op~output_o\;

ww_ALU_PSW <= \ALU_PSW~output_o\;

ww_Memory_wr_en <= \Memory_wr_en~output_o\;

ww_ALU_target(0) <= \ALU_target[0]~output_o\;

ww_ALU_target(1) <= \ALU_target[1]~output_o\;
END structure;


