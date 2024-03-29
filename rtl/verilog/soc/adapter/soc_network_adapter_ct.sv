////////////////////////////////////////////////////////////////////////////////
//                                            __ _      _     _               //
//                                           / _(_)    | |   | |              //
//                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |              //
//               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |              //
//              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |              //
//               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|              //
//                  | |                                                       //
//                  |_|                                                       //
//                                                                            //
//                                                                            //
//              MPSoC-OR1K CPU                                                //
//              Multi Processor System on Chip                                //
//              Wishbone Bus Interface                                        //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2019-2020 by the author(s)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////
// Author(s):
//   Paco Reina Campo <pacoreinacampo@queenfield.tech>

import soc_optimsoc_configuration::*;

module soc_network_adapter_ct #(
  parameter config_t CONFIG = 'x,

  parameter TILEID   = 'x,
  parameter COREBASE = 'x,

  localparam CHANNELS   = CONFIG.NOC_CHANNELS,
  localparam FLIT_WIDTH = CONFIG.NOC_FLIT_WIDTH
) (
`ifdef OPTIMSOC_CLOCKDOMAINS
`ifdef OPTIMSOC_CDC_DYNAMIC
  output [2:0] cdc_conf,
  output       cdc_enable,
`endif
`endif

  input clk,
  input rst,

  input  [CHANNELS-1:0][FLIT_WIDTH-1:0] noc_in_flit,
  input  [CHANNELS-1:0]                 noc_in_last,
  input  [CHANNELS-1:0]                 noc_in_valid,
  output [CHANNELS-1:0]                 noc_in_ready,
  output [CHANNELS-1:0][FLIT_WIDTH-1:0] noc_out_flit,
  output [CHANNELS-1:0]                 noc_out_last,
  output [CHANNELS-1:0]                 noc_out_valid,
  input  [CHANNELS-1:0]                 noc_out_ready,

  output [31:0] wbm_adr_o,
  output        wbm_cyc_o,
  output [31:0] wbm_dat_o,
  output [ 3:0] wbm_sel_o,
  output        wbm_stb_o,
  output        wbm_we_o,
  output        wbm_cab_o,
  output [ 2:0] wbm_cti_o,
  output [ 1:0] wbm_bte_o,
  input         wbm_ack_i,
  input         wbm_rty_i,
  input         wbm_err_i,
  input  [31:0] wbm_dat_i,

  input  [31:0] wbs_adr_i,
  input         wbs_cyc_i,
  input  [31:0] wbs_dat_i,
  input  [ 3:0] wbs_sel_i,
  input         wbs_stb_i,
  input         wbs_we_i,
  input         wbs_cab_i,
  input  [ 2:0] wbs_cti_i,
  input  [ 1:0] wbs_bte_i,
  output        wbs_ack_o,
  output        wbs_rty_o,
  output        wbs_err_o,
  output [31:0] wbs_dat_o,

  output [1:0] irq
);

  //////////////////////////////////////////////////////////////////////////////
  // Constants
  //////////////////////////////////////////////////////////////////////////////

  // Those are the actual channels from the modules
  localparam C_MPSIMPLE_REQ = 0;
  localparam C_MPSIMPLE_RES = 1;
  localparam C_DMA_REQ = 2;
  localparam C_DMA_RES = 3;
  localparam MODCHANNELS = 4;

  // The different interfaces at the bus slave
  //  slave 0: configuration
  //           NABASE + 0x000000
  //  slave 1: mp_simple
  //           NABASE + 0x100000
  //  slave 2: dma
  //           NABASE + 0x200000
  // If a slave is not present there is a gap

  localparam ID_CONF = 0;
  localparam ID_MPSIMPLE = 1;
  localparam ID_DMA = 2;
  localparam SLAVES = 3;  // This is the number of maximum slaves

  //////////////////////////////////////////////////////////////////////////////
  // Variables
  //////////////////////////////////////////////////////////////////////////////

  wire [MODCHANNELS-1:0]                 mod_out_ready;
  wire [MODCHANNELS-1:0]                 mod_out_valid;
  wire [MODCHANNELS-1:0]                 mod_out_last;
  wire [MODCHANNELS-1:0][FLIT_WIDTH-1:0] mod_out_flit;
  wire [MODCHANNELS-1:0]                 mod_in_ready;
  wire [MODCHANNELS-1:0]                 mod_in_valid;
  wire [MODCHANNELS-1:0]                 mod_in_last;
  wire [MODCHANNELS-1:0][FLIT_WIDTH-1:0] mod_in_flit;

  wire [     SLAVES-1:0][          23:0] wbif_adr_i;
  wire [     SLAVES-1:0][          31:0] wbif_dat_i;
  wire [     SLAVES-1:0]                 wbif_cyc_i;
  wire [     SLAVES-1:0]                 wbif_stb_i;
  wire [     SLAVES-1:0][           3:0] wbif_sel_i;
  wire [     SLAVES-1:0]                 wbif_we_i;
  wire [     SLAVES-1:0][           2:0] wbif_cti_i;
  wire [     SLAVES-1:0][           1:0] wbif_bte_i;
  wire [     SLAVES-1:0][          31:0] wbif_dat_o;
  wire [     SLAVES-1:0]                 wbif_ack_o;
  wire [     SLAVES-1:0]                 wbif_err_o;
  wire [     SLAVES-1:0]                 wbif_rty_o;

  //////////////////////////////////////////////////////////////////////////////
  // Body
  //////////////////////////////////////////////////////////////////////////////

  soc_decode_wb #(
    .SLAVES        (3),
    .DATA_WIDTH    (32),
    .ADDR_WIDTH    (24),
    .S0_RANGE_WIDTH(4),
    .S0_RANGE_MATCH(4'h0),
    .S1_RANGE_WIDTH(4),
    .S1_RANGE_MATCH(4'h1),
    .S2_RANGE_WIDTH(4),
    .S2_RANGE_MATCH(4'h2)
  ) u_slavedecode (
    .clk_i(clk),
    .rst_i(rst),

    .m_adr_i(wbs_adr_i[23:0]),
    .m_dat_i(wbs_dat_i),
    .m_cyc_i(wbs_cyc_i),
    .m_stb_i(wbs_stb_i),
    .m_sel_i(wbs_sel_i),
    .m_we_i (wbs_we_i),
    .m_cti_i(wbs_cti_i),
    .m_bte_i(wbs_bte_i),

    .m_dat_o(wbs_dat_o),
    .m_ack_o(wbs_ack_o),
    .m_err_o(wbs_err_o),
    .m_rty_o(wbs_rty_o),

    .s_adr_o(wbif_adr_i),
    .s_dat_o(wbif_dat_i),
    .s_cyc_o(wbif_cyc_i),
    .s_stb_o(wbif_stb_i),
    .s_sel_o(wbif_sel_i),
    .s_we_o (wbif_we_i),
    .s_cti_o(wbif_cti_i),
    .s_bte_o(wbif_bte_i),

    .s_dat_i(wbif_dat_o),
    .s_ack_i(wbif_ack_o),
    .s_err_i(wbif_err_o),
    .s_rty_i(wbif_rty_o)
  );

  soc_network_adapter_configuration #(
    .CONFIG  (CONFIG),
    .TILEID  (TILEID),
    .COREBASE(COREBASE)
  ) u_conf (
`ifdef OPTIMSOC_CLOCKDOMAINS
`ifdef OPTIMSOC_CDC_DYNAMIC
    .cdc_conf  (cdc_conf[2:0]),
    .cdc_enable(cdc_enable),
`endif
`endif
    // Outputs
    .data      (wbif_dat_o[ID_CONF]),
    .ack       (wbif_ack_o[ID_CONF]),
    .rty       (wbif_rty_o[ID_CONF]),
    .err       (wbif_err_o[ID_CONF]),
    // Inputs
    .clk       (clk),
    .rst       (rst),
    .adr       (wbs_adr_i[15:0]),
    .we        (wbs_cyc_i & wbs_stb_i & wbs_we_i),
    .data_i    (wbif_dat_i[ID_CONF])
  );

  // just wire them statically for the moment
  assign wbif_rty_o[ID_MPSIMPLE] = 1'b0;

  peripheral_mpi_wb #(
    .NOC_FLIT_WIDTH(CONFIG.NOC_FLIT_WIDTH),
    .SIZE          (16),
    .N             (2)
  ) u_mpi (
    .*,
    .noc_out_flit ({mod_out_flit[C_MPSIMPLE_RES], mod_out_flit[C_MPSIMPLE_REQ]}),
    .noc_out_last ({mod_out_last[C_MPSIMPLE_RES], mod_out_last[C_MPSIMPLE_REQ]}),
    .noc_out_valid({mod_out_valid[C_MPSIMPLE_RES], mod_out_valid[C_MPSIMPLE_REQ]}),
    .noc_out_ready({mod_out_ready[C_MPSIMPLE_RES], mod_out_ready[C_MPSIMPLE_REQ]}),

    .noc_in_flit ({mod_in_flit[C_MPSIMPLE_RES], mod_in_flit[C_MPSIMPLE_REQ]}),
    .noc_in_last ({mod_in_last[C_MPSIMPLE_RES], mod_in_last[C_MPSIMPLE_REQ]}),
    .noc_in_valid({mod_in_valid[C_MPSIMPLE_RES], mod_in_valid[C_MPSIMPLE_REQ]}),
    .noc_in_ready({mod_in_ready[C_MPSIMPLE_RES], mod_in_ready[C_MPSIMPLE_REQ]}),

    .wb_dat_o(wbif_dat_o[ID_MPSIMPLE]),
    .wb_ack_o(wbif_ack_o[ID_MPSIMPLE]),
    .wb_err_o(wbif_err_o[ID_MPSIMPLE]),
    .wb_adr_i({8'h0, wbif_adr_i[ID_MPSIMPLE]}),
    .wb_we_i (wbif_we_i[ID_MPSIMPLE]),
    .wb_cyc_i(wbif_cyc_i[ID_MPSIMPLE]),
    .wb_stb_i(wbif_stb_i[ID_MPSIMPLE]),
    .wb_dat_i(wbif_dat_i[ID_MPSIMPLE]),

    .irq(irq[0])
  );

  generate
    if (CONFIG.NA_ENABLE_DMA) begin
      wire [3:0] irq_dma;
      assign irq[1] = |irq_dma;

      wire [1:0][CONFIG.NOC_FLIT_WIDTH+1:0] dma_in_flit, dma_out_flit;
      assign dma_in_flit[0]          = {mod_in_last[C_DMA_REQ], 1'b0, mod_in_flit[C_DMA_REQ]};
      assign dma_in_flit[1]          = {mod_in_last[C_DMA_RES], 1'b0, mod_in_flit[C_DMA_RES]};
      assign mod_out_last[C_DMA_REQ] = dma_out_flit[0][CONFIG.NOC_FLIT_WIDTH+1];
      assign mod_out_flit[C_DMA_REQ] = dma_out_flit[0][CONFIG.NOC_FLIT_WIDTH-1:0];
      assign mod_out_last[C_DMA_RES] = dma_out_flit[1][CONFIG.NOC_FLIT_WIDTH+1];
      assign mod_out_flit[C_DMA_RES] = dma_out_flit[1][CONFIG.NOC_FLIT_WIDTH-1:0];

      peripheral_dma_top_wb #(
        .TILEID       (TILEID),
        .TABLE_ENTRIES(CONFIG.NA_DMA_ENTRIES)
      ) u_dma (
        // Outputs
        .noc_in_req_ready (mod_in_ready[C_DMA_REQ]),
        .noc_in_res_ready (mod_in_ready[C_DMA_RES]),
        .noc_out_req_flit (dma_out_flit[0]),
        .noc_out_req_valid(mod_out_valid[C_DMA_REQ]),
        .noc_out_res_flit (dma_out_flit[1]),
        .noc_out_res_valid(mod_out_valid[C_DMA_RES]),
        .wb_if_dat_o      (wbif_dat_o[ID_DMA]),
        .wb_if_ack_o      (wbif_ack_o[ID_DMA]),
        .wb_if_err_o      (wbif_err_o[ID_DMA]),
        .wb_if_rty_o      (wbif_rty_o[ID_DMA]),
        .wb_adr_o         (wbm_adr_o),
        .wb_dat_o         (wbm_dat_o),
        .wb_cyc_o         (wbm_cyc_o),
        .wb_stb_o         (wbm_stb_o),
        .wb_sel_o         (wbm_sel_o),
        .wb_we_o          (wbm_we_o),
        .wb_cab_o         (wbm_cab_o),
        .wb_cti_o         (wbm_cti_o),
        .wb_bte_o         (wbm_bte_o),
        .irq              (irq_dma),
        // Inputs
        .clk              (clk),
        .rst              (rst),
        .noc_in_req_flit  (dma_in_flit[0]),
        .noc_in_req_valid (mod_in_valid[C_DMA_REQ]),
        .noc_in_res_flit  (dma_in_flit[1]),
        .noc_in_res_valid (mod_in_valid[C_DMA_RES]),
        .noc_out_req_ready(mod_out_ready[C_DMA_REQ]),
        .noc_out_res_ready(mod_out_ready[C_DMA_RES]),
        .wb_if_addr_i     ({8'h0, wbif_adr_i[ID_DMA]}),
        .wb_if_dat_i      (wbif_dat_i[ID_DMA]),
        .wb_if_cyc_i      (wbif_cyc_i[ID_DMA]),
        .wb_if_stb_i      (wbif_stb_i[ID_DMA]),
        .wb_if_we_i       (wbif_we_i[ID_DMA]),
        .wb_dat_i         (wbm_dat_i),
        .wb_ack_i         (wbm_ack_i)
      );
    end else begin
      assign irq[1] = 1'b0;
    end
  endgenerate

  wire [1:0][FLIT_WIDTH-1:0] muxed_flit;
  wire [1:0] muxed_last, muxed_valid, muxed_ready;

  peripheral_noc_mux #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .CHANNELS  (2)
  ) u_mux0 (
    .*,
    .in_flit  ({mod_out_flit[C_MPSIMPLE_REQ], mod_out_flit[C_DMA_REQ]}),
    .in_last  ({mod_out_last[C_MPSIMPLE_REQ], mod_out_last[C_DMA_REQ]}),
    .in_valid ({mod_out_valid[C_MPSIMPLE_REQ], mod_out_valid[C_DMA_REQ]}),
    .in_ready ({mod_out_ready[C_MPSIMPLE_REQ], mod_out_ready[C_DMA_REQ]}),
    .out_flit (muxed_flit[0]),
    .out_last (muxed_last[0]),
    .out_valid(muxed_valid[0]),
    .out_ready(muxed_ready[0])
  );

  peripheral_noc_mux #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .CHANNELS  (2)
  ) u_mux1 (
    .*,
    .in_flit  ({mod_out_flit[C_MPSIMPLE_RES], mod_out_flit[C_DMA_RES]}),
    .in_last  ({mod_out_last[C_MPSIMPLE_RES], mod_out_last[C_DMA_RES]}),
    .in_valid ({mod_out_valid[C_MPSIMPLE_RES], mod_out_valid[C_DMA_RES]}),
    .in_ready ({mod_out_ready[C_MPSIMPLE_RES], mod_out_ready[C_DMA_RES]}),
    .out_flit (muxed_flit[1]),
    .out_last (muxed_last[1]),
    .out_valid(muxed_valid[1]),
    .out_ready(muxed_ready[1])
  );

  peripheral_noc_buffer #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .DEPTH     (4)
  ) u_outbuffer0 (
    .*,
    .in_flit    (muxed_flit[0]),
    .in_last    (muxed_last[0]),
    .in_valid   (muxed_valid[0]),
    .in_ready   (muxed_ready[0]),
    .out_flit   (noc_out_flit[0]),
    .out_last   (noc_out_last[0]),
    .out_valid  (noc_out_valid[0]),
    .out_ready  (noc_out_ready[0]),
    .packet_size()
  );

  peripheral_noc_buffer #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .DEPTH     (4)
  ) u_outbuffer1 (
    .*,
    .in_flit    (muxed_flit[1]),
    .in_last    (muxed_last[1]),
    .in_valid   (muxed_valid[1]),
    .in_ready   (muxed_ready[1]),
    .out_flit   (noc_out_flit[1]),
    .out_last   (noc_out_last[1]),
    .out_valid  (noc_out_valid[1]),
    .out_ready  (noc_out_ready[1]),
    .packet_size()
  );

  wire [1:0][FLIT_WIDTH-1:0] inbuffer_flit;
  wire [1:0]                 inbuffer_last;
  wire [1:0]                 inbuffer_valid;
  wire [1:0]                 inbuffer_ready;

  peripheral_noc_buffer #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .DEPTH     (4)
  ) u_inbuffer0 (
    .*,
    .in_flit    (noc_in_flit[0]),
    .in_last    (noc_in_last[0]),
    .in_valid   (noc_in_valid[0]),
    .in_ready   (noc_in_ready[0]),
    .out_flit   (inbuffer_flit[0]),
    .out_last   (inbuffer_last[0]),
    .out_valid  (inbuffer_valid[0]),
    .out_ready  (inbuffer_ready[0]),
    .packet_size()
  );

  peripheral_noc_demux #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .CHANNELS  (2),
    .MAPPING   ({48'h0, 8'h2, 8'h1})
  ) u_demux0 (
    .*,
    .in_flit  (inbuffer_flit[0]),
    .in_last  (inbuffer_last[0]),
    .in_valid (inbuffer_valid[0]),
    .in_ready (inbuffer_ready[0]),
    .out_flit ({mod_in_flit[C_DMA_REQ], mod_in_flit[C_MPSIMPLE_REQ]}),
    .out_last ({mod_in_last[C_DMA_REQ], mod_in_last[C_MPSIMPLE_REQ]}),
    .out_valid({mod_in_valid[C_DMA_REQ], mod_in_valid[C_MPSIMPLE_REQ]}),
    .out_ready({mod_in_ready[C_DMA_REQ], mod_in_ready[C_MPSIMPLE_REQ]})
  );

  peripheral_noc_demux #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .CHANNELS  (4)
  ) u_inbuffer1 (
    .*,
    .in_flit    (noc_in_flit[1]),
    .in_last    (noc_in_last[1]),
    .in_valid   (noc_in_valid[1]),
    .in_ready   (noc_in_ready[1]),
    .out_flit   (inbuffer_flit[1]),
    .out_last   (inbuffer_last[1]),
    .out_valid  (inbuffer_valid[1]),
    .out_ready  (inbuffer_ready[1])
  );

  peripheral_noc_demux #(
    .FLIT_WIDTH(FLIT_WIDTH),
    .CHANNELS  (2),
    .MAPPING   ({48'h0, 8'h2, 8'h1})
  ) u_demux1 (
    .*,
    .in_flit  (inbuffer_flit[1]),
    .in_last  (inbuffer_last[1]),
    .in_valid (inbuffer_valid[1]),
    .in_ready (inbuffer_ready[1]),
    .out_flit ({mod_in_flit[C_DMA_RES], mod_in_flit[C_MPSIMPLE_RES]}),
    .out_last ({mod_in_last[C_DMA_RES], mod_in_last[C_MPSIMPLE_RES]}),
    .out_valid({mod_in_valid[C_DMA_RES], mod_in_valid[C_MPSIMPLE_RES]}),
    .out_ready({mod_in_ready[C_DMA_RES], mod_in_ready[C_MPSIMPLE_RES]})
  );
endmodule
