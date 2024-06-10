transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {RF8_16bits_6_1200mv_85c_slow.vho}

vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/RF8_16bits {X:/altera/13.1/quartus/RF8_16bits/RF8_16bits_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=RF8_16bits_6_1200mv_85c_vhd_slow.sdo -L altera_mf -L altera -L lpm -L sgate -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L gate_work -L work -voptargs="+acc"  RF8_16bits_tb

add wave *
view structure
view signals
run -all
