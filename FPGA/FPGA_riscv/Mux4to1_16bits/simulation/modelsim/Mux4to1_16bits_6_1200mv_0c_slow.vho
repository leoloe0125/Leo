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

-- DATE "11/13/2023 17:59:44"

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

ENTITY 	Mux4to1_16bits IS
    PORT (
	Din0 : IN std_logic_vector(15 DOWNTO 0);
	Din1 : IN std_logic_vector(15 DOWNTO 0);
	Din2 : IN std_logic_vector(15 DOWNTO 0);
	Din3 : IN std_logic_vector(15 DOWNTO 0);
	Control : IN std_logic_vector(1 DOWNTO 0);
	Dout : OUT std_logic_vector(15 DOWNTO 0)
	);
END Mux4to1_16bits;

-- Design Ports Information
-- Dout[0]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[1]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[2]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[3]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[4]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[5]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[6]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[7]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[8]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[9]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[10]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[11]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[12]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[13]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[14]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dout[15]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[0]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Control[1]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[0]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Control[0]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[0]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[0]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[1]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[1]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[1]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[1]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[2]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[2]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[2]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[2]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[3]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[3]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[3]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[3]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[4]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[4]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[4]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[4]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[5]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[5]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[5]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[6]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[6]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[6]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[6]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[7]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[7]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[7]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[7]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[8]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[8]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[8]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[8]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[9]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[9]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[9]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[9]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[10]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[10]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[10]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[10]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[11]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[11]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[11]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[11]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[12]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[12]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[12]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[12]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[13]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[13]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[13]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[13]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[14]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[14]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[14]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[14]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din1[15]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din2[15]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din0[15]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din3[15]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Mux4to1_16bits IS
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
SIGNAL ww_Control : std_logic_vector(1 DOWNTO 0);
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
SIGNAL \Din3[0]~input_o\ : std_logic;
SIGNAL \Control[0]~input_o\ : std_logic;
SIGNAL \Din0[0]~input_o\ : std_logic;
SIGNAL \Din1[0]~input_o\ : std_logic;
SIGNAL \Control[1]~input_o\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \Din2[0]~input_o\ : std_logic;
SIGNAL \Mux15~1_combout\ : std_logic;
SIGNAL \Din1[1]~input_o\ : std_logic;
SIGNAL \Din3[1]~input_o\ : std_logic;
SIGNAL \Din2[1]~input_o\ : std_logic;
SIGNAL \Din0[1]~input_o\ : std_logic;
SIGNAL \Mux14~0_combout\ : std_logic;
SIGNAL \Mux14~1_combout\ : std_logic;
SIGNAL \Din3[2]~input_o\ : std_logic;
SIGNAL \Din2[2]~input_o\ : std_logic;
SIGNAL \Din1[2]~input_o\ : std_logic;
SIGNAL \Din0[2]~input_o\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux13~1_combout\ : std_logic;
SIGNAL \Din3[3]~input_o\ : std_logic;
SIGNAL \Din0[3]~input_o\ : std_logic;
SIGNAL \Din2[3]~input_o\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Din1[3]~input_o\ : std_logic;
SIGNAL \Mux12~1_combout\ : std_logic;
SIGNAL \Din0[4]~input_o\ : std_logic;
SIGNAL \Din1[4]~input_o\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Din2[4]~input_o\ : std_logic;
SIGNAL \Din3[4]~input_o\ : std_logic;
SIGNAL \Mux11~1_combout\ : std_logic;
SIGNAL \Din3[5]~input_o\ : std_logic;
SIGNAL \Din1[5]~input_o\ : std_logic;
SIGNAL \Din2[5]~input_o\ : std_logic;
SIGNAL \Din0[5]~input_o\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux10~1_combout\ : std_logic;
SIGNAL \Din0[6]~input_o\ : std_logic;
SIGNAL \Din1[6]~input_o\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Din2[6]~input_o\ : std_logic;
SIGNAL \Din3[6]~input_o\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \Din0[7]~input_o\ : std_logic;
SIGNAL \Din2[7]~input_o\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Din3[7]~input_o\ : std_logic;
SIGNAL \Din1[7]~input_o\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \Din2[8]~input_o\ : std_logic;
SIGNAL \Din1[8]~input_o\ : std_logic;
SIGNAL \Din0[8]~input_o\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Din3[8]~input_o\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Din0[9]~input_o\ : std_logic;
SIGNAL \Din2[9]~input_o\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Din3[9]~input_o\ : std_logic;
SIGNAL \Din1[9]~input_o\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Din3[10]~input_o\ : std_logic;
SIGNAL \Din2[10]~input_o\ : std_logic;
SIGNAL \Din1[10]~input_o\ : std_logic;
SIGNAL \Din0[10]~input_o\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Din0[11]~input_o\ : std_logic;
SIGNAL \Din2[11]~input_o\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Din3[11]~input_o\ : std_logic;
SIGNAL \Din1[11]~input_o\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Din0[12]~input_o\ : std_logic;
SIGNAL \Din1[12]~input_o\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Din2[12]~input_o\ : std_logic;
SIGNAL \Din3[12]~input_o\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Din1[13]~input_o\ : std_logic;
SIGNAL \Din0[13]~input_o\ : std_logic;
SIGNAL \Din2[13]~input_o\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Din3[13]~input_o\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Din3[14]~input_o\ : std_logic;
SIGNAL \Din2[14]~input_o\ : std_logic;
SIGNAL \Din1[14]~input_o\ : std_logic;
SIGNAL \Din0[14]~input_o\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Din1[15]~input_o\ : std_logic;
SIGNAL \Din0[15]~input_o\ : std_logic;
SIGNAL \Din2[15]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Din3[15]~input_o\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;

BEGIN

ww_Din0 <= Din0;
ww_Din1 <= Din1;
ww_Din2 <= Din2;
ww_Din3 <= Din3;
ww_Control <= Control;
Dout <= ww_Dout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y0_N2
\Dout[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux15~1_combout\,
	devoe => ww_devoe,
	o => \Dout[0]~output_o\);

-- Location: IOOBUF_X52_Y16_N2
\Dout[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux14~1_combout\,
	devoe => ww_devoe,
	o => \Dout[1]~output_o\);

-- Location: IOOBUF_X46_Y41_N9
\Dout[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux13~1_combout\,
	devoe => ww_devoe,
	o => \Dout[2]~output_o\);

-- Location: IOOBUF_X50_Y41_N9
\Dout[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux12~1_combout\,
	devoe => ww_devoe,
	o => \Dout[3]~output_o\);

-- Location: IOOBUF_X46_Y41_N2
\Dout[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~1_combout\,
	devoe => ww_devoe,
	o => \Dout[4]~output_o\);

-- Location: IOOBUF_X52_Y23_N9
\Dout[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~1_combout\,
	devoe => ww_devoe,
	o => \Dout[5]~output_o\);

-- Location: IOOBUF_X52_Y27_N2
\Dout[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~1_combout\,
	devoe => ww_devoe,
	o => \Dout[6]~output_o\);

-- Location: IOOBUF_X36_Y41_N2
\Dout[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~1_combout\,
	devoe => ww_devoe,
	o => \Dout[7]~output_o\);

-- Location: IOOBUF_X16_Y41_N2
\Dout[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux7~1_combout\,
	devoe => ww_devoe,
	o => \Dout[8]~output_o\);

-- Location: IOOBUF_X5_Y41_N9
\Dout[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~1_combout\,
	devoe => ww_devoe,
	o => \Dout[9]~output_o\);

-- Location: IOOBUF_X16_Y41_N9
\Dout[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~1_combout\,
	devoe => ww_devoe,
	o => \Dout[10]~output_o\);

-- Location: IOOBUF_X12_Y41_N2
\Dout[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~1_combout\,
	devoe => ww_devoe,
	o => \Dout[11]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\Dout[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~1_combout\,
	devoe => ww_devoe,
	o => \Dout[12]~output_o\);

-- Location: IOOBUF_X41_Y41_N2
\Dout[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~1_combout\,
	devoe => ww_devoe,
	o => \Dout[13]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\Dout[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~1_combout\,
	devoe => ww_devoe,
	o => \Dout[14]~output_o\);

-- Location: IOOBUF_X31_Y41_N23
\Dout[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux0~1_combout\,
	devoe => ww_devoe,
	o => \Dout[15]~output_o\);

-- Location: IOIBUF_X10_Y0_N1
\Din3[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(0),
	o => \Din3[0]~input_o\);

-- Location: IOIBUF_X41_Y41_N15
\Control[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Control(0),
	o => \Control[0]~input_o\);

-- Location: IOIBUF_X18_Y0_N8
\Din0[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(0),
	o => \Din0[0]~input_o\);

-- Location: IOIBUF_X7_Y41_N15
\Din1[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(0),
	o => \Din1[0]~input_o\);

-- Location: IOIBUF_X41_Y41_N8
\Control[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Control(1),
	o => \Control[1]~input_o\);

-- Location: LCCOMB_X18_Y38_N0
\Mux15~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\Control[0]~input_o\ & (((\Din1[0]~input_o\) # (\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[0]~input_o\ & ((!\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[0]~input_o\,
	datac => \Din1[0]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux15~0_combout\);

-- Location: IOIBUF_X23_Y41_N1
\Din2[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(0),
	o => \Din2[0]~input_o\);

-- Location: LCCOMB_X18_Y38_N18
\Mux15~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux15~1_combout\ = (\Mux15~0_combout\ & ((\Din3[0]~input_o\) # ((!\Control[1]~input_o\)))) # (!\Mux15~0_combout\ & (((\Din2[0]~input_o\ & \Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[0]~input_o\,
	datab => \Mux15~0_combout\,
	datac => \Din2[0]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux15~1_combout\);

-- Location: IOIBUF_X52_Y28_N1
\Din1[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(1),
	o => \Din1[1]~input_o\);

-- Location: IOIBUF_X43_Y41_N1
\Din3[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(1),
	o => \Din3[1]~input_o\);

-- Location: IOIBUF_X52_Y32_N15
\Din2[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(1),
	o => \Din2[1]~input_o\);

-- Location: IOIBUF_X52_Y25_N1
\Din0[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(1),
	o => \Din0[1]~input_o\);

-- Location: LCCOMB_X51_Y33_N24
\Mux14~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux14~0_combout\ = (\Control[1]~input_o\ & ((\Din2[1]~input_o\) # ((\Control[0]~input_o\)))) # (!\Control[1]~input_o\ & (((!\Control[0]~input_o\ & \Din0[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[1]~input_o\,
	datab => \Din2[1]~input_o\,
	datac => \Control[0]~input_o\,
	datad => \Din0[1]~input_o\,
	combout => \Mux14~0_combout\);

-- Location: LCCOMB_X51_Y33_N10
\Mux14~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux14~1_combout\ = (\Control[0]~input_o\ & ((\Mux14~0_combout\ & ((\Din3[1]~input_o\))) # (!\Mux14~0_combout\ & (\Din1[1]~input_o\)))) # (!\Control[0]~input_o\ & (((\Mux14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din1[1]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Din3[1]~input_o\,
	datad => \Mux14~0_combout\,
	combout => \Mux14~1_combout\);

-- Location: IOIBUF_X50_Y41_N1
\Din3[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(2),
	o => \Din3[2]~input_o\);

-- Location: IOIBUF_X46_Y41_N15
\Din2[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(2),
	o => \Din2[2]~input_o\);

-- Location: IOIBUF_X52_Y18_N1
\Din1[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(2),
	o => \Din1[2]~input_o\);

-- Location: IOIBUF_X52_Y32_N22
\Din0[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(2),
	o => \Din0[2]~input_o\);

-- Location: LCCOMB_X51_Y33_N28
\Mux13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\Control[1]~input_o\ & (\Control[0]~input_o\)) # (!\Control[1]~input_o\ & ((\Control[0]~input_o\ & (\Din1[2]~input_o\)) # (!\Control[0]~input_o\ & ((\Din0[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[1]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Din1[2]~input_o\,
	datad => \Din0[2]~input_o\,
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X51_Y33_N22
\Mux13~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux13~1_combout\ = (\Control[1]~input_o\ & ((\Mux13~0_combout\ & (\Din3[2]~input_o\)) # (!\Mux13~0_combout\ & ((\Din2[2]~input_o\))))) # (!\Control[1]~input_o\ & (((\Mux13~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[2]~input_o\,
	datab => \Din2[2]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Mux13~0_combout\,
	combout => \Mux13~1_combout\);

-- Location: IOIBUF_X46_Y41_N22
\Din3[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(3),
	o => \Din3[3]~input_o\);

-- Location: IOIBUF_X52_Y32_N1
\Din0[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(3),
	o => \Din0[3]~input_o\);

-- Location: IOIBUF_X52_Y23_N1
\Din2[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(3),
	o => \Din2[3]~input_o\);

-- Location: LCCOMB_X51_Y33_N0
\Mux12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din2[3]~input_o\))) # (!\Control[1]~input_o\ & (\Din0[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[3]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din2[3]~input_o\,
	combout => \Mux12~0_combout\);

-- Location: IOIBUF_X52_Y30_N1
\Din1[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(3),
	o => \Din1[3]~input_o\);

-- Location: LCCOMB_X51_Y33_N2
\Mux12~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux12~1_combout\ = (\Mux12~0_combout\ & ((\Din3[3]~input_o\) # ((!\Control[0]~input_o\)))) # (!\Mux12~0_combout\ & (((\Control[0]~input_o\ & \Din1[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[3]~input_o\,
	datab => \Mux12~0_combout\,
	datac => \Control[0]~input_o\,
	datad => \Din1[3]~input_o\,
	combout => \Mux12~1_combout\);

-- Location: IOIBUF_X48_Y41_N8
\Din0[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(4),
	o => \Din0[4]~input_o\);

-- Location: IOIBUF_X52_Y31_N1
\Din1[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(4),
	o => \Din1[4]~input_o\);

-- Location: LCCOMB_X51_Y33_N20
\Mux11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[4]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[4]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[4]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[4]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: IOIBUF_X52_Y25_N8
\Din2[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(4),
	o => \Din2[4]~input_o\);

-- Location: IOIBUF_X48_Y41_N1
\Din3[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(4),
	o => \Din3[4]~input_o\);

-- Location: LCCOMB_X51_Y33_N14
\Mux11~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux11~1_combout\ = (\Control[1]~input_o\ & ((\Mux11~0_combout\ & ((\Din3[4]~input_o\))) # (!\Mux11~0_combout\ & (\Din2[4]~input_o\)))) # (!\Control[1]~input_o\ & (\Mux11~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[1]~input_o\,
	datab => \Mux11~0_combout\,
	datac => \Din2[4]~input_o\,
	datad => \Din3[4]~input_o\,
	combout => \Mux11~1_combout\);

-- Location: IOIBUF_X27_Y41_N1
\Din3[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(5),
	o => \Din3[5]~input_o\);

-- Location: IOIBUF_X41_Y41_N22
\Din1[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(5),
	o => \Din1[5]~input_o\);

-- Location: IOIBUF_X52_Y19_N1
\Din2[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(5),
	o => \Din2[5]~input_o\);

-- Location: IOIBUF_X52_Y30_N8
\Din0[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(5),
	o => \Din0[5]~input_o\);

-- Location: LCCOMB_X51_Y33_N16
\Mux10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & (\Din2[5]~input_o\)) # (!\Control[1]~input_o\ & ((\Din0[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din2[5]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din0[5]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X51_Y33_N18
\Mux10~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux10~1_combout\ = (\Control[0]~input_o\ & ((\Mux10~0_combout\ & (\Din3[5]~input_o\)) # (!\Mux10~0_combout\ & ((\Din1[5]~input_o\))))) # (!\Control[0]~input_o\ & (((\Mux10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[5]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Din1[5]~input_o\,
	datad => \Mux10~0_combout\,
	combout => \Mux10~1_combout\);

-- Location: IOIBUF_X52_Y27_N8
\Din0[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(6),
	o => \Din0[6]~input_o\);

-- Location: IOIBUF_X52_Y28_N8
\Din1[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(6),
	o => \Din1[6]~input_o\);

-- Location: LCCOMB_X51_Y33_N12
\Mux9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\) # (\Din1[6]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[6]~input_o\ & (!\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[6]~input_o\,
	datab => \Control[0]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din1[6]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: IOIBUF_X27_Y41_N8
\Din2[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(6),
	o => \Din2[6]~input_o\);

-- Location: IOIBUF_X52_Y31_N8
\Din3[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(6),
	o => \Din3[6]~input_o\);

-- Location: LCCOMB_X51_Y33_N6
\Mux9~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = (\Mux9~0_combout\ & (((\Din3[6]~input_o\) # (!\Control[1]~input_o\)))) # (!\Mux9~0_combout\ & (\Din2[6]~input_o\ & (\Control[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \Din2[6]~input_o\,
	datac => \Control[1]~input_o\,
	datad => \Din3[6]~input_o\,
	combout => \Mux9~1_combout\);

-- Location: IOIBUF_X31_Y41_N8
\Din0[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(7),
	o => \Din0[7]~input_o\);

-- Location: IOIBUF_X12_Y0_N8
\Din2[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(7),
	o => \Din2[7]~input_o\);

-- Location: LCCOMB_X18_Y38_N4
\Mux8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\Control[1]~input_o\ & (((\Din2[7]~input_o\) # (\Control[0]~input_o\)))) # (!\Control[1]~input_o\ & (\Din0[7]~input_o\ & ((!\Control[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[7]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din2[7]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X38_Y41_N1
\Din3[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(7),
	o => \Din3[7]~input_o\);

-- Location: IOIBUF_X36_Y41_N8
\Din1[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(7),
	o => \Din1[7]~input_o\);

-- Location: LCCOMB_X34_Y40_N24
\Mux8~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (\Mux8~0_combout\ & ((\Din3[7]~input_o\) # ((!\Control[0]~input_o\)))) # (!\Mux8~0_combout\ & (((\Din1[7]~input_o\ & \Control[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux8~0_combout\,
	datab => \Din3[7]~input_o\,
	datac => \Din1[7]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux8~1_combout\);

-- Location: IOIBUF_X25_Y41_N8
\Din2[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(8),
	o => \Din2[8]~input_o\);

-- Location: IOIBUF_X21_Y0_N1
\Din1[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(8),
	o => \Din1[8]~input_o\);

-- Location: IOIBUF_X10_Y41_N1
\Din0[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(8),
	o => \Din0[8]~input_o\);

-- Location: LCCOMB_X18_Y38_N14
\Mux7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\Control[1]~input_o\ & (((\Control[0]~input_o\)))) # (!\Control[1]~input_o\ & ((\Control[0]~input_o\ & (\Din1[8]~input_o\)) # (!\Control[0]~input_o\ & ((\Din0[8]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din1[8]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din0[8]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: IOIBUF_X12_Y41_N8
\Din3[8]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(8),
	o => \Din3[8]~input_o\);

-- Location: LCCOMB_X18_Y38_N8
\Mux7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\Mux7~0_combout\ & (((\Din3[8]~input_o\) # (!\Control[1]~input_o\)))) # (!\Mux7~0_combout\ & (\Din2[8]~input_o\ & ((\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din2[8]~input_o\,
	datab => \Mux7~0_combout\,
	datac => \Din3[8]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux7~1_combout\);

-- Location: IOIBUF_X10_Y41_N8
\Din0[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(9),
	o => \Din0[9]~input_o\);

-- Location: IOIBUF_X7_Y41_N8
\Din2[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(9),
	o => \Din2[9]~input_o\);

-- Location: LCCOMB_X18_Y38_N2
\Mux6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\Control[1]~input_o\ & (((\Din2[9]~input_o\) # (\Control[0]~input_o\)))) # (!\Control[1]~input_o\ & (\Din0[9]~input_o\ & ((!\Control[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din0[9]~input_o\,
	datab => \Control[1]~input_o\,
	datac => \Din2[9]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: IOIBUF_X21_Y0_N8
\Din3[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(9),
	o => \Din3[9]~input_o\);

-- Location: IOIBUF_X18_Y0_N1
\Din1[9]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(9),
	o => \Din1[9]~input_o\);

-- Location: LCCOMB_X18_Y38_N12
\Mux6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\Control[0]~input_o\ & ((\Mux6~0_combout\ & (\Din3[9]~input_o\)) # (!\Mux6~0_combout\ & ((\Din1[9]~input_o\))))) # (!\Control[0]~input_o\ & (\Mux6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Mux6~0_combout\,
	datac => \Din3[9]~input_o\,
	datad => \Din1[9]~input_o\,
	combout => \Mux6~1_combout\);

-- Location: IOIBUF_X14_Y41_N8
\Din3[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(10),
	o => \Din3[10]~input_o\);

-- Location: IOIBUF_X31_Y41_N1
\Din2[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(10),
	o => \Din2[10]~input_o\);

-- Location: IOIBUF_X18_Y41_N1
\Din1[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(10),
	o => \Din1[10]~input_o\);

-- Location: IOIBUF_X23_Y41_N8
\Din0[10]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(10),
	o => \Din0[10]~input_o\);

-- Location: LCCOMB_X18_Y38_N30
\Mux5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\Control[0]~input_o\ & ((\Din1[10]~input_o\) # ((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (((\Din0[10]~input_o\ & !\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din1[10]~input_o\,
	datac => \Din0[10]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X18_Y38_N24
\Mux5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = (\Mux5~0_combout\ & ((\Din3[10]~input_o\) # ((!\Control[1]~input_o\)))) # (!\Mux5~0_combout\ & (((\Din2[10]~input_o\ & \Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[10]~input_o\,
	datab => \Din2[10]~input_o\,
	datac => \Mux5~0_combout\,
	datad => \Control[1]~input_o\,
	combout => \Mux5~1_combout\);

-- Location: IOIBUF_X29_Y41_N1
\Din0[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(11),
	o => \Din0[11]~input_o\);

-- Location: IOIBUF_X29_Y41_N8
\Din2[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(11),
	o => \Din2[11]~input_o\);

-- Location: LCCOMB_X18_Y38_N10
\Mux4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\Control[0]~input_o\ & (((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & ((\Control[1]~input_o\ & ((\Din2[11]~input_o\))) # (!\Control[1]~input_o\ & (\Din0[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[11]~input_o\,
	datac => \Din2[11]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: IOIBUF_X7_Y41_N22
\Din3[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(11),
	o => \Din3[11]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\Din1[11]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(11),
	o => \Din1[11]~input_o\);

-- Location: LCCOMB_X18_Y38_N20
\Mux4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (\Mux4~0_combout\ & ((\Din3[11]~input_o\) # ((!\Control[0]~input_o\)))) # (!\Mux4~0_combout\ & (((\Din1[11]~input_o\ & \Control[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4~0_combout\,
	datab => \Din3[11]~input_o\,
	datac => \Din1[11]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux4~1_combout\);

-- Location: IOIBUF_X23_Y0_N1
\Din0[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(12),
	o => \Din0[12]~input_o\);

-- Location: IOIBUF_X25_Y41_N1
\Din1[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(12),
	o => \Din1[12]~input_o\);

-- Location: LCCOMB_X18_Y38_N22
\Mux3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\Control[0]~input_o\ & (((\Din1[12]~input_o\) # (\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (\Din0[12]~input_o\ & ((!\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din0[12]~input_o\,
	datac => \Din1[12]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: IOIBUF_X21_Y41_N8
\Din2[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(12),
	o => \Din2[12]~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\Din3[12]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(12),
	o => \Din3[12]~input_o\);

-- Location: LCCOMB_X18_Y38_N16
\Mux3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = (\Mux3~0_combout\ & (((\Din3[12]~input_o\) # (!\Control[1]~input_o\)))) # (!\Mux3~0_combout\ & (\Din2[12]~input_o\ & ((\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3~0_combout\,
	datab => \Din2[12]~input_o\,
	datac => \Din3[12]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux3~1_combout\);

-- Location: IOIBUF_X52_Y19_N8
\Din1[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(13),
	o => \Din1[13]~input_o\);

-- Location: IOIBUF_X43_Y41_N8
\Din0[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(13),
	o => \Din0[13]~input_o\);

-- Location: IOIBUF_X52_Y18_N8
\Din2[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(13),
	o => \Din2[13]~input_o\);

-- Location: LCCOMB_X51_Y33_N8
\Mux2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\Control[1]~input_o\ & (((\Control[0]~input_o\) # (\Din2[13]~input_o\)))) # (!\Control[1]~input_o\ & (\Din0[13]~input_o\ & (!\Control[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[1]~input_o\,
	datab => \Din0[13]~input_o\,
	datac => \Control[0]~input_o\,
	datad => \Din2[13]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: IOIBUF_X52_Y32_N8
\Din3[13]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(13),
	o => \Din3[13]~input_o\);

-- Location: LCCOMB_X51_Y33_N26
\Mux2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (\Mux2~0_combout\ & (((\Din3[13]~input_o\) # (!\Control[0]~input_o\)))) # (!\Mux2~0_combout\ & (\Din1[13]~input_o\ & (\Control[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din1[13]~input_o\,
	datab => \Mux2~0_combout\,
	datac => \Control[0]~input_o\,
	datad => \Din3[13]~input_o\,
	combout => \Mux2~1_combout\);

-- Location: IOIBUF_X14_Y41_N1
\Din3[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(14),
	o => \Din3[14]~input_o\);

-- Location: IOIBUF_X21_Y41_N1
\Din2[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(14),
	o => \Din2[14]~input_o\);

-- Location: IOIBUF_X18_Y41_N8
\Din1[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(14),
	o => \Din1[14]~input_o\);

-- Location: IOIBUF_X7_Y41_N1
\Din0[14]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(14),
	o => \Din0[14]~input_o\);

-- Location: LCCOMB_X18_Y38_N26
\Mux1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\Control[0]~input_o\ & ((\Din1[14]~input_o\) # ((\Control[1]~input_o\)))) # (!\Control[0]~input_o\ & (((\Din0[14]~input_o\ & !\Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[0]~input_o\,
	datab => \Din1[14]~input_o\,
	datac => \Din0[14]~input_o\,
	datad => \Control[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X18_Y38_N28
\Mux1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\Mux1~0_combout\ & ((\Din3[14]~input_o\) # ((!\Control[1]~input_o\)))) # (!\Mux1~0_combout\ & (((\Din2[14]~input_o\ & \Control[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din3[14]~input_o\,
	datab => \Din2[14]~input_o\,
	datac => \Mux1~0_combout\,
	datad => \Control[1]~input_o\,
	combout => \Mux1~1_combout\);

-- Location: IOIBUF_X34_Y41_N1
\Din1[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din1(15),
	o => \Din1[15]~input_o\);

-- Location: IOIBUF_X34_Y41_N8
\Din0[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din0(15),
	o => \Din0[15]~input_o\);

-- Location: IOIBUF_X38_Y41_N8
\Din2[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din2(15),
	o => \Din2[15]~input_o\);

-- Location: LCCOMB_X34_Y40_N2
\Mux0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\Control[1]~input_o\ & (((\Din2[15]~input_o\) # (\Control[0]~input_o\)))) # (!\Control[1]~input_o\ & (\Din0[15]~input_o\ & ((!\Control[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Control[1]~input_o\,
	datab => \Din0[15]~input_o\,
	datac => \Din2[15]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X31_Y41_N15
\Din3[15]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din3(15),
	o => \Din3[15]~input_o\);

-- Location: LCCOMB_X34_Y40_N12
\Mux0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\Mux0~0_combout\ & (((\Din3[15]~input_o\) # (!\Control[0]~input_o\)))) # (!\Mux0~0_combout\ & (\Din1[15]~input_o\ & ((\Control[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Din1[15]~input_o\,
	datab => \Mux0~0_combout\,
	datac => \Din3[15]~input_o\,
	datad => \Control[0]~input_o\,
	combout => \Mux0~1_combout\);

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


