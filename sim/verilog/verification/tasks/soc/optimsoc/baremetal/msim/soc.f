###################################################################################
##                                            __ _      _     _                  ##
##                                           / _(_)    | |   | |                 ##
##                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 ##
##               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 ##
##              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 ##
##               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 ##
##                  | |                                                          ##
##                  |_|                                                          ##
##                                                                               ##
##                                                                               ##
##              Architecture                                                     ##
##              QueenField                                                       ##
##                                                                               ##
###################################################################################

###################################################################################
##                                                                               ##
## Copyright (c) 2019-2020 by the author(s)                                      ##
##                                                                               ##
## Permission is hereby granted, free of charge, to any person obtaining a copy  ##
## of this software and associated documentation files (the "Software"), to deal ##
## in the Software without restriction, including without limitation the rights  ##
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     ##
## copies of the Software, and to permit persons to whom the Software is         ##
## furnished to do so, subject to the following conditions:                      ##
##                                                                               ##
## The above copyright notice and this permission notice shall be included in    ##
## all copies or substantial portions of the Software.                           ##
##                                                                               ##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    ##
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      ##
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   ##
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        ##
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, ##
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     ##
## THE SOFTWARE.                                                                 ##
##                                                                               ##
## ============================================================================= ##
## Author(s):                                                                    ##
##   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           ##
##                                                                               ##
###################################################################################

+incdir+../../../../../../../../pu/rtl/verilog/pkg
+incdir+../../../../../../../../rtl/verilog/soc/optimsoc/bootrom
+incdir+../../../../../../../../verification/tasks/library/cpp/verilator/inc
+incdir+../../../../../../../../verification/tasks/library/cpp/glip

../../../../../../../../peripheral/dma/rtl/verilog/code/pkg/core/peripheral_dma_pkg.sv

../../../../../../../../pu/rtl/verilog/pkg/peripheral_wb_pkg.sv

../../../../../../../../rtl/verilog/pkg/optimsoc/arbiter/soc_arbiter_rr.sv
../../../../../../../../rtl/verilog/pkg/optimsoc/functions/soc_optimsoc_functions.sv
../../../../../../../../rtl/verilog/pkg/optimsoc/configuration/soc_optimsoc_configuration.sv
../../../../../../../../rtl/verilog/pkg/optimsoc/constants/soc_optimsoc_constants.sv

../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interfaces/common/peripheral_dbg_soc_dii_channel_flat.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interfaces/common/peripheral_dbg_soc_dii_channel.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interfaces/or1k/peripheral_dbg_soc_mor1kx_trace_exec.sv

../../../../../../../../verification/tasks/library/verilog/optimsoc/glip/soc_glip_channel.sv

../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/buffer/peripheral_dbg_soc_dii_buffer.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/buffer/peripheral_dbg_soc_osd_fifo.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/eventpacket/peripheral_dbg_soc_osd_event_packetization_fixedwidth.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/eventpacket/peripheral_dbg_soc_osd_event_packetization.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/regaccess/peripheral_dbg_soc_osd_regaccess_demux.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/regaccess/peripheral_dbg_soc_osd_regaccess_layer.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/regaccess/peripheral_dbg_soc_osd_regaccess.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/timestamp/peripheral_dbg_soc_osd_timestamp.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/blocks/tracesample/peripheral_dbg_soc_osd_tracesample.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_debug_ring_expand.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_debug_ring.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_ring_router_demux.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_ring_router_gateway_demux.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_ring_router_gateway_mux.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_ring_router_gateway.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_ring_router_mux_rr.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_ring_router_mux.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/interconnect/peripheral_dbg_soc_ring_router.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/ctm/common/peripheral_dbg_soc_osd_ctm.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/ctm/or1k/peripheral_dbg_soc_osd_ctm_mor1kx.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/dem_uart/peripheral_dbg_soc_osd_dem_uart_16550.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/dem_uart/peripheral_dbg_soc_osd_dem_uart.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/dem_uart/peripheral_dbg_soc_osd_dem_uart_wb.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/him/peripheral_dbg_soc_osd_him.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/mam/common/peripheral_dbg_soc_osd_mam.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/mam/wb/peripheral_dbg_soc_mam_adapter_wb.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/mam/wb/peripheral_dbg_soc_osd_mam_if_wb.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/mam/wb/peripheral_dbg_soc_osd_mam_wb.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/scm/peripheral_dbg_soc_osd_scm.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/stm/common/peripheral_dbg_soc_osd_stm.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/modules/stm/or1k/mor1kx/peripheral_dbg_soc_osd_stm_mor1kx.sv
../../../../../../../../peripheral/dbg/rtl/soc/verilog/code/peripheral/top/peripheral_dbg_soc_interface.sv

../../../../../../../../peripheral/dma/rtl/verilog/code/core/peripheral_dma_initiator_nocreq.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/core/peripheral_dma_packet_buffer.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/core/peripheral_dma_request_table.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/peripheral/wb/peripheral_dma_initiator_nocres_wb.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/peripheral/wb/peripheral_dma_initiator_req_wb.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/peripheral/wb/peripheral_dma_initiator_wb.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/peripheral/wb/peripheral_dma_interface_wb.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/peripheral/wb/peripheral_dma_target_wb.sv
../../../../../../../../peripheral/dma/rtl/verilog/code/peripheral/wb/peripheral_dma_top_wb.sv

../../../../../../../../peripheral/mpi/rtl/verilog/code/core/peripheral_mpi_buffer.sv
../../../../../../../../peripheral/mpi/rtl/verilog/code/core/peripheral_mpi_buffer_endpoint.sv
../../../../../../../../peripheral/mpi/rtl/verilog/code/peripheral/wb/peripheral_mpi_wb.sv

../../../../../../../../peripheral/noc/rtl/verilog/code/core/main/peripheral_arbiter_rr.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/main/peripheral_noc_buffer.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/main/peripheral_noc_demux.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/main/peripheral_noc_mux.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/main/peripheral_noc_vchannel_mux.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/router/peripheral_noc_router_input.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/router/peripheral_noc_router_lookup_slice.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/router/peripheral_noc_router_lookup.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/router/peripheral_noc_router_output.sv
../../../../../../../../peripheral/noc/rtl/verilog/code/core/router/peripheral_noc_router.sv

../../../../../../../../pu/rtl/verilog/core/control/pu_or1k_cfgrs.sv
../../../../../../../../pu/rtl/verilog/core/control/pu_or1k_ctrl_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/control/pu_or1k_pcu.sv
../../../../../../../../pu/rtl/verilog/core/control/pu_or1k_pic.sv
../../../../../../../../pu/rtl/verilog/core/control/pu_or1k_ticktimer.sv
../../../../../../../../pu/rtl/verilog/core/decode/pu_or1k_decode.sv
../../../../../../../../pu/rtl/verilog/core/execute/pu_or1k_execute_alu.sv
../../../../../../../../pu/rtl/verilog/core/execute/pu_or1k_execute_ctrl_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/execute/pu_or1k_rf_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/execute/pu_or1k_wb_mux_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/fetch/pu_or1k_cache_lru.sv
../../../../../../../../pu/rtl/verilog/core/fetch/pu_or1k_fetch_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/fetch/pu_or1k_icache.sv
../../../../../../../../pu/rtl/verilog/core/fetch/pu_or1k_immu.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_branch_prediction.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_branch_predictor_gshare.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_branch_predictor_saturation_counter.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_branch_predictor_simple.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_bus_if_wb32.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_core.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_cpu_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_cpu.sv
../../../../../../../../pu/rtl/verilog/core/main/pu_or1k_decode_execute_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/memory/pu_or1k_dcache.sv
../../../../../../../../pu/rtl/verilog/core/memory/pu_or1k_dmmu.sv
../../../../../../../../pu/rtl/verilog/core/memory/pu_or1k_lsu_cappuccino.sv
../../../../../../../../pu/rtl/verilog/core/memory/pu_or1k_store_buffer.sv
../../../../../../../../pu/rtl/verilog/peripheral/pfpu32/pu_or1k_pfpu32_addsub.sv
../../../../../../../../pu/rtl/verilog/peripheral/pfpu32/pu_or1k_pfpu32_cmp.sv
../../../../../../../../pu/rtl/verilog/peripheral/pfpu32/pu_or1k_pfpu32_f2i.sv
../../../../../../../../pu/rtl/verilog/peripheral/pfpu32/pu_or1k_pfpu32_i2f.sv
../../../../../../../../pu/rtl/verilog/peripheral/pfpu32/pu_or1k_pfpu32_muldiv.sv
../../../../../../../../pu/rtl/verilog/peripheral/pfpu32/pu_or1k_pfpu32_rnd.sv
../../../../../../../../pu/rtl/verilog/peripheral/pfpu32/pu_or1k_pfpu32_top.sv
../../../../../../../../pu/rtl/verilog/memory/pu_or1k_simple_dpram_sclk.sv
../../../../../../../../pu/rtl/verilog/memory/pu_or1k_true_dpram_sclk.sv
../../../../../../../../pu/rtl/verilog/module/pu_or1k_module.sv

../../../../../../../../rtl/verilog/soc/optimsoc/adapter/soc_network_adapter_configuration.sv
../../../../../../../../rtl/verilog/soc/optimsoc/adapter/soc_network_adapter_ct.sv
../../../../../../../../rtl/verilog/soc/optimsoc/bootrom/soc_bootrom.sv
../../../../../../../../rtl/verilog/soc/optimsoc/interconnection/bus/soc_b3_wb.sv
../../../../../../../../rtl/verilog/soc/optimsoc/interconnection/decode/soc_decode_wb.sv
../../../../../../../../rtl/verilog/soc/optimsoc/interconnection/mux/soc_mux_wb.sv
../../../../../../../../rtl/verilog/soc/optimsoc/main/soc_or1k_tile.sv
../../../../../../../../rtl/verilog/soc/optimsoc/spram/soc_sram_sp_implemented_plain.sv
../../../../../../../../rtl/verilog/soc/optimsoc/spram/soc_sram_sp.sv
../../../../../../../../rtl/verilog/soc/optimsoc/spram/soc_sram_sp_wb.sv
../../../../../../../../rtl/verilog/soc/optimsoc/spram/soc_wb2sram.sv

../../../../../../../../verification/tasks/library/verilog/optimsoc/main/soc_or1k_testbench.sv
