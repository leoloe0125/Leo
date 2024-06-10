transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/ALU_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Mux4to1_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/RF8_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Mux8to1_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Memory256_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Instruction_Decoder.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/FA_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/DFF_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Decoder3to8.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Controller.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/RISC_complete {X:/altera/13.1/quartus/Project/Term_project/RISC_complete/RISC_complete.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Fowarding_unit.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Hazard_Detector.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Mux2to1_16bits.v}
vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/Library {X:/altera/13.1/quartus/Project/Term_project/Library/Branch_unit.v}

vlog -vlog01compat -work work +incdir+X:/altera/13.1/quartus/Project/Term_project/RISC_complete {X:/altera/13.1/quartus/Project/Term_project/RISC_complete/RISC_complete_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  RISC_complete_tb

add wave *
view structure
view signals
run -all
