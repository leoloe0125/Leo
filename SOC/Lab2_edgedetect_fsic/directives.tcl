solution options set /Input/TargetPlatform x86_64
solution options set /Input/SearchPath {../hls_c/inc ../cmodel/inc ../bmpUtil/inc} 
solution options set /Flows/SCVerify/INVOKE_ARGS {./image/people640x360_rgb.bmp 1 out_algorithm.bmp out_hw.bmp}
solution options set /Flows/SCVerify/INCL_DIRS {../hls_c/inc ../cmodel/inc ../bmpUtil/inc}
solution file add ../hls_c/inc/EdgeDetect.h -type CHEADER
solution file add ../hls_c/src/EdgeDetect_tb.cpp -type C++ -exclude true
solution file add {../bmpUtil/src/bmp_io.cpp} -type C++ -exclude true
go compile
flow run /SCVerify/launch_make ./scverify/Verify_orig_cxx_osci.mk {} SIMTOOL=osci sim
options set Output/OutputVHDL false

#EdgeDetect_VerDer
go new
solution design set EdgeDetect_IP::EdgeDetect_VerDer -top

# ==================================
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /EdgeDetect_IP::EdgeDetect_VerDer/dat_in:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait_coupled
directive set /EdgeDetect_IP::EdgeDetect_VerDer/widthIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_VerDer/heightIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -EXTERNAL_MEMORY true
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf0:rsc -GEN_EXTERNAL_ENABLE true
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -MAP_TO_MODULE ccs_sample_mem.ccs_ram_sync_singleport
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -EXTERNAL_MEMORY true
directive set /EdgeDetect_IP::EdgeDetect_VerDer/run/line_buf1:rsc -GEN_EXTERNAL_ENABLE true
directive set /EdgeDetect_IP::EdgeDetect_VerDer -RESET_CLEARS_ALL_REGS no
go architect
go extract

#EdgeDetect_HorDer
go new
solution design set EdgeDetect_IP::EdgeDetect_HorDer -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /EdgeDetect_IP::EdgeDetect_HorDer/dat_in:rsc -MAP_TO_MODULE ccs_ioport.ccs_in_wait_coupled
directive set /EdgeDetect_IP::EdgeDetect_HorDer/widthIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_HorDer/heightIn:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /EdgeDetect_IP::EdgeDetect_HorDer -RESET_CLEARS_ALL_REGS no
go architect
go extract

#EdgeDetect_MagAng
go new
solution design set EdgeDetect_IP::EdgeDetect_MagAng -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /EdgeDetect_IP::EdgeDetect_MagAng -RESET_CLEARS_ALL_REGS no
go architect
go extract

#EdgeDetect
go new
solution design set EdgeDetect_IP::EdgeDetect_VerDer -block
solution design set EdgeDetect_IP::EdgeDetect_HorDer -block
solution design set EdgeDetect_IP::EdgeDetect_MagAng -block
solution design set EdgeDetect_IP::EdgeDetect_Top -top
go compile
solution library add nangate-45nm_beh -- -rtlsyntool OasysRTL -vendor Nangate -technology 045nm
solution library add ccs_sample_mem
solution library add {[Block] EdgeDetect_IP::EdgeDetect_HorDer.v1}
solution library add {[Block] EdgeDetect_IP::EdgeDetect_MagAng.v1}
solution library add {[Block] EdgeDetect_IP::EdgeDetect_VerDer.v1}
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 10.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 5.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND both -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
directive set /EdgeDetect_IP::EdgeDetect_Top/EdgeDetect_IP::EdgeDetect_MagAng -MAP_TO_MODULE {[Block] EdgeDetect_IP::EdgeDetect_MagAng.v1}
directive set /EdgeDetect_IP::EdgeDetect_Top/EdgeDetect_IP::EdgeDetect_HorDer -MAP_TO_MODULE {[Block] EdgeDetect_IP::EdgeDetect_HorDer.v1}
directive set /EdgeDetect_IP::EdgeDetect_Top/EdgeDetect_IP::EdgeDetect_VerDer -MAP_TO_MODULE {[Block] EdgeDetect_IP::EdgeDetect_VerDer.v1}
go assembly
directive set /EdgeDetect_IP::EdgeDetect_Top/pix_chan1:cns -FIFO_DEPTH 0
directive set /EdgeDetect_IP::EdgeDetect_Top/pix_chan2:cns -FIFO_DEPTH 0
directive set /EdgeDetect_IP::EdgeDetect_Top/dy_chan:cns -FIFO_DEPTH 2
directive set /EdgeDetect_IP::EdgeDetect_Top/dx_chan:cns -FIFO_DEPTH 0
directive set /EdgeDetect_IP::EdgeDetect_Top -RESET_CLEARS_ALL_REGS no
go architect
go extract

