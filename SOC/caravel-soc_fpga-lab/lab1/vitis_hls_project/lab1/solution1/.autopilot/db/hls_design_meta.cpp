#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("m_axi_BUS0_AWVALID", 1, hls_out, 0, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS0_AWREADY", 1, hls_in, 0, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS0_AWADDR", 64, hls_out, 0, "m_axi", "ADDR", 1),
	Port_Property("m_axi_BUS0_AWID", 1, hls_out, 0, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS0_AWLEN", 8, hls_out, 0, "m_axi", "SIZE", 1),
	Port_Property("m_axi_BUS0_AWSIZE", 3, hls_out, 0, "m_axi", "BURST", 1),
	Port_Property("m_axi_BUS0_AWBURST", 2, hls_out, 0, "m_axi", "LOCK", 1),
	Port_Property("m_axi_BUS0_AWLOCK", 2, hls_out, 0, "m_axi", "CACHE", 1),
	Port_Property("m_axi_BUS0_AWCACHE", 4, hls_out, 0, "m_axi", "PROT", 1),
	Port_Property("m_axi_BUS0_AWPROT", 3, hls_out, 0, "m_axi", "QOS", 1),
	Port_Property("m_axi_BUS0_AWQOS", 4, hls_out, 0, "m_axi", "REGION", 1),
	Port_Property("m_axi_BUS0_AWREGION", 4, hls_out, 0, "m_axi", "USER", 1),
	Port_Property("m_axi_BUS0_AWUSER", 1, hls_out, 0, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS0_WVALID", 1, hls_out, 0, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS0_WREADY", 1, hls_in, 0, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS0_WDATA", 32, hls_out, 0, "m_axi", "FIFONUM", 1),
	Port_Property("m_axi_BUS0_WSTRB", 4, hls_out, 0, "m_axi", "STRB", 1),
	Port_Property("m_axi_BUS0_WLAST", 1, hls_out, 0, "m_axi", "LAST", 1),
	Port_Property("m_axi_BUS0_WID", 1, hls_out, 0, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS0_WUSER", 1, hls_out, 0, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS0_ARVALID", 1, hls_out, 0, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS0_ARREADY", 1, hls_in, 0, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS0_ARADDR", 64, hls_out, 0, "m_axi", "ADDR", 1),
	Port_Property("m_axi_BUS0_ARID", 1, hls_out, 0, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS0_ARLEN", 8, hls_out, 0, "m_axi", "SIZE", 1),
	Port_Property("m_axi_BUS0_ARSIZE", 3, hls_out, 0, "m_axi", "BURST", 1),
	Port_Property("m_axi_BUS0_ARBURST", 2, hls_out, 0, "m_axi", "LOCK", 1),
	Port_Property("m_axi_BUS0_ARLOCK", 2, hls_out, 0, "m_axi", "CACHE", 1),
	Port_Property("m_axi_BUS0_ARCACHE", 4, hls_out, 0, "m_axi", "PROT", 1),
	Port_Property("m_axi_BUS0_ARPROT", 3, hls_out, 0, "m_axi", "QOS", 1),
	Port_Property("m_axi_BUS0_ARQOS", 4, hls_out, 0, "m_axi", "REGION", 1),
	Port_Property("m_axi_BUS0_ARREGION", 4, hls_out, 0, "m_axi", "USER", 1),
	Port_Property("m_axi_BUS0_ARUSER", 1, hls_out, 0, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS0_RVALID", 1, hls_in, 0, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS0_RREADY", 1, hls_out, 0, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS0_RDATA", 32, hls_in, 0, "m_axi", "FIFONUM", 1),
	Port_Property("m_axi_BUS0_RLAST", 1, hls_in, 0, "m_axi", "LAST", 1),
	Port_Property("m_axi_BUS0_RID", 1, hls_in, 0, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS0_RUSER", 1, hls_in, 0, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS0_RRESP", 2, hls_in, 0, "m_axi", "RESP", 1),
	Port_Property("m_axi_BUS0_BVALID", 1, hls_in, 0, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS0_BREADY", 1, hls_out, 0, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS0_BRESP", 2, hls_in, 0, "m_axi", "RESP", 1),
	Port_Property("m_axi_BUS0_BID", 1, hls_in, 0, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS0_BUSER", 1, hls_in, 0, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS1_AWVALID", 1, hls_out, 1, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS1_AWREADY", 1, hls_in, 1, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS1_AWADDR", 64, hls_out, 1, "m_axi", "ADDR", 1),
	Port_Property("m_axi_BUS1_AWID", 1, hls_out, 1, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS1_AWLEN", 8, hls_out, 1, "m_axi", "SIZE", 1),
	Port_Property("m_axi_BUS1_AWSIZE", 3, hls_out, 1, "m_axi", "BURST", 1),
	Port_Property("m_axi_BUS1_AWBURST", 2, hls_out, 1, "m_axi", "LOCK", 1),
	Port_Property("m_axi_BUS1_AWLOCK", 2, hls_out, 1, "m_axi", "CACHE", 1),
	Port_Property("m_axi_BUS1_AWCACHE", 4, hls_out, 1, "m_axi", "PROT", 1),
	Port_Property("m_axi_BUS1_AWPROT", 3, hls_out, 1, "m_axi", "QOS", 1),
	Port_Property("m_axi_BUS1_AWQOS", 4, hls_out, 1, "m_axi", "REGION", 1),
	Port_Property("m_axi_BUS1_AWREGION", 4, hls_out, 1, "m_axi", "USER", 1),
	Port_Property("m_axi_BUS1_AWUSER", 1, hls_out, 1, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS1_WVALID", 1, hls_out, 1, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS1_WREADY", 1, hls_in, 1, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS1_WDATA", 32, hls_out, 1, "m_axi", "FIFONUM", 1),
	Port_Property("m_axi_BUS1_WSTRB", 4, hls_out, 1, "m_axi", "STRB", 1),
	Port_Property("m_axi_BUS1_WLAST", 1, hls_out, 1, "m_axi", "LAST", 1),
	Port_Property("m_axi_BUS1_WID", 1, hls_out, 1, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS1_WUSER", 1, hls_out, 1, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS1_ARVALID", 1, hls_out, 1, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS1_ARREADY", 1, hls_in, 1, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS1_ARADDR", 64, hls_out, 1, "m_axi", "ADDR", 1),
	Port_Property("m_axi_BUS1_ARID", 1, hls_out, 1, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS1_ARLEN", 8, hls_out, 1, "m_axi", "SIZE", 1),
	Port_Property("m_axi_BUS1_ARSIZE", 3, hls_out, 1, "m_axi", "BURST", 1),
	Port_Property("m_axi_BUS1_ARBURST", 2, hls_out, 1, "m_axi", "LOCK", 1),
	Port_Property("m_axi_BUS1_ARLOCK", 2, hls_out, 1, "m_axi", "CACHE", 1),
	Port_Property("m_axi_BUS1_ARCACHE", 4, hls_out, 1, "m_axi", "PROT", 1),
	Port_Property("m_axi_BUS1_ARPROT", 3, hls_out, 1, "m_axi", "QOS", 1),
	Port_Property("m_axi_BUS1_ARQOS", 4, hls_out, 1, "m_axi", "REGION", 1),
	Port_Property("m_axi_BUS1_ARREGION", 4, hls_out, 1, "m_axi", "USER", 1),
	Port_Property("m_axi_BUS1_ARUSER", 1, hls_out, 1, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS1_RVALID", 1, hls_in, 1, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS1_RREADY", 1, hls_out, 1, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS1_RDATA", 32, hls_in, 1, "m_axi", "FIFONUM", 1),
	Port_Property("m_axi_BUS1_RLAST", 1, hls_in, 1, "m_axi", "LAST", 1),
	Port_Property("m_axi_BUS1_RID", 1, hls_in, 1, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS1_RUSER", 1, hls_in, 1, "m_axi", "DATA", 1),
	Port_Property("m_axi_BUS1_RRESP", 2, hls_in, 1, "m_axi", "RESP", 1),
	Port_Property("m_axi_BUS1_BVALID", 1, hls_in, 1, "m_axi", "VALID", 1),
	Port_Property("m_axi_BUS1_BREADY", 1, hls_out, 1, "m_axi", "READY", 1),
	Port_Property("m_axi_BUS1_BRESP", 2, hls_in, 1, "m_axi", "RESP", 1),
	Port_Property("m_axi_BUS1_BID", 1, hls_in, 1, "m_axi", "ID", 1),
	Port_Property("m_axi_BUS1_BUSER", 1, hls_in, 1, "m_axi", "DATA", 1),
	Port_Property("internal_bram_Addr_A", 32, hls_out, 3, "bram", "MemPortADDR2", 1),
	Port_Property("internal_bram_EN_A", 1, hls_out, 3, "bram", "MemPortCE2", 1),
	Port_Property("internal_bram_WEN_A", 4, hls_out, 3, "bram", "MemPortWE2", 1),
	Port_Property("internal_bram_Din_A", 32, hls_out, 3, "bram", "MemPortDIN2", 1),
	Port_Property("internal_bram_Dout_A", 32, hls_in, 3, "bram", "MemPortDOUT2", 1),
	Port_Property("internal_bram_Clk_A", 1, hls_out, 3, "bram", "mem_clk", 1),
	Port_Property("internal_bram_Rst_A", 1, hls_out, 3, "bram", "mem_rst", 1),
	Port_Property("s_axi_control_AWVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_AWREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_AWADDR", 6, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_WDATA", 32, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_WSTRB", 4, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_ARVALID", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_ARREADY", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_ARADDR", 6, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_RVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_RREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_RDATA", 32, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_RRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_BVALID", 1, hls_out, -1, "", "", 1),
	Port_Property("s_axi_control_BREADY", 1, hls_in, -1, "", "", 1),
	Port_Property("s_axi_control_BRESP", 2, hls_out, -1, "", "", 1),
	Port_Property("interrupt", 1, hls_out, -1, "", "", 1),
};
const char* HLS_Design_Meta::dut_name = "read_romcode";
