// DE1_SoC_QSYS_trace_system_0_link_link.v

// This file was auto-generated from altera_jtag_debug_link_internal_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 13.1 182 at 2017.03.14.18:12:30

`timescale 1 ps / 1 ps
module DE1_SoC_QSYS_trace_system_0_link_link (
		input  wire       clk_clk,           //         clk.clk
		output wire       debug_reset_reset, // debug_reset.reset
		output wire [7:0] h2t_channel,       //         h2t.channel
		input  wire       h2t_ready,         //            .ready
		output wire       h2t_valid,         //            .valid
		output wire [7:0] h2t_data,          //            .data
		output wire       h2t_startofpacket, //            .startofpacket
		output wire       h2t_endofpacket,   //            .endofpacket
		output wire       t2h_ready,         //         t2h.ready
		input  wire       t2h_valid,         //            .valid
		input  wire [7:0] t2h_data,          //            .data
		input  wire [7:0] t2h_channel,       //            .channel
		input  wire       t2h_startofpacket, //            .startofpacket
		input  wire       t2h_endofpacket,   //            .endofpacket
		output wire       mgmt_valid,        //        mgmt.valid
		output wire [7:0] mgmt_channel,      //            .channel
		output wire       mgmt_data          //            .data
	);

	wire        jtag_src_valid;             // jtag:source_valid -> h2t_timing:in_valid
	wire  [7:0] jtag_src_data;              // jtag:source_data -> h2t_timing:in_data
	wire        h2t_timing_out_valid;       // h2t_timing:out_valid -> h2t_fifo:in_valid
	wire  [7:0] h2t_timing_out_data;        // h2t_timing:out_data -> h2t_fifo:in_data
	wire        h2t_timing_out_ready;       // h2t_fifo:in_ready -> h2t_timing:out_ready
	wire        h2t_fifo_out_valid;         // h2t_fifo:out_valid -> b2p:in_valid
	wire  [7:0] h2t_fifo_out_data;          // h2t_fifo:out_data -> b2p:in_data
	wire        h2t_fifo_out_ready;         // b2p:in_ready -> h2t_fifo:out_ready
	wire        p2b_out_bytes_stream_valid; // p2b:out_valid -> t2h_fifo:in_valid
	wire  [7:0] p2b_out_bytes_stream_data;  // p2b:out_data -> t2h_fifo:in_data
	wire        p2b_out_bytes_stream_ready; // t2h_fifo:in_ready -> p2b:out_ready
	wire        t2h_fifo_out_valid;         // t2h_fifo:out_valid -> jtag:sink_valid
	wire  [7:0] t2h_fifo_out_data;          // t2h_fifo:out_data -> jtag:sink_data
	wire        t2h_fifo_out_ready;         // jtag:sink_ready -> t2h_fifo:out_ready

	altera_avalon_st_jtag_interface #(
		.PURPOSE              (2),
		.UPSTREAM_FIFO_SIZE   (0),
		.DOWNSTREAM_FIFO_SIZE (6),
		.MGMT_CHANNEL_WIDTH   (8),
		.USE_PLI              (0),
		.PLI_PORT             (50000)
	) jtag (
		.clk          (clk_clk),            //        clock.clk
		.reset_n      (~debug_reset_reset), //  clock_reset.reset_n
		.source_data  (jtag_src_data),      //          src.data
		.source_valid (jtag_src_valid),     //             .valid
		.sink_data    (t2h_fifo_out_data),  //         sink.data
		.sink_valid   (t2h_fifo_out_valid), //             .valid
		.sink_ready   (t2h_fifo_out_ready), //             .ready
		.resetrequest (),                   // resetrequest.reset
		.debug_reset  (debug_reset_reset),  //  debug_reset.reset
		.mgmt_valid   (mgmt_valid),         //         mgmt.valid
		.mgmt_channel (mgmt_channel),       //             .channel
		.mgmt_data    (mgmt_data)           //             .data
	);

	DE1_SoC_QSYS_trace_system_0_link_link_h2t_timing h2t_timing (
		.clk       (clk_clk),              //   clk.clk
		.reset_n   (~debug_reset_reset),   // reset.reset_n
		.in_valid  (jtag_src_valid),       //    in.valid
		.in_data   (jtag_src_data),        //      .data
		.out_valid (h2t_timing_out_valid), //   out.valid
		.out_data  (h2t_timing_out_data),  //      .data
		.out_ready (h2t_timing_out_ready)  //      .ready
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (64),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) h2t_fifo (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (debug_reset_reset),                    // clk_reset.reset
		.in_data           (h2t_timing_out_data),                  //        in.data
		.in_valid          (h2t_timing_out_valid),                 //          .valid
		.in_ready          (h2t_timing_out_ready),                 //          .ready
		.out_data          (h2t_fifo_out_data),                    //       out.data
		.out_valid         (h2t_fifo_out_valid),                   //          .valid
		.out_ready         (h2t_fifo_out_ready),                   //          .ready
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_startofpacket  (1'b0),                                 // (terminated)
		.in_endofpacket    (1'b0),                                 // (terminated)
		.out_startofpacket (),                                     // (terminated)
		.out_endofpacket   (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	altera_avalon_st_bytes_to_packets #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (1)
	) b2p (
		.clk               (clk_clk),            //                clk.clk
		.reset_n           (~debug_reset_reset), //          clk_reset.reset_n
		.out_channel       (h2t_channel),        // out_packets_stream.channel
		.out_ready         (h2t_ready),          //                   .ready
		.out_valid         (h2t_valid),          //                   .valid
		.out_data          (h2t_data),           //                   .data
		.out_startofpacket (h2t_startofpacket),  //                   .startofpacket
		.out_endofpacket   (h2t_endofpacket),    //                   .endofpacket
		.in_ready          (h2t_fifo_out_ready), //    in_bytes_stream.ready
		.in_valid          (h2t_fifo_out_valid), //                   .valid
		.in_data           (h2t_fifo_out_data)   //                   .data
	);

	altera_avalon_st_packets_to_bytes #(
		.CHANNEL_WIDTH (8),
		.ENCODING      (1)
	) p2b (
		.clk              (clk_clk),                    //               clk.clk
		.reset_n          (~debug_reset_reset),         //         clk_reset.reset_n
		.in_ready         (t2h_ready),                  // in_packets_stream.ready
		.in_valid         (t2h_valid),                  //                  .valid
		.in_data          (t2h_data),                   //                  .data
		.in_channel       (t2h_channel),                //                  .channel
		.in_startofpacket (t2h_startofpacket),          //                  .startofpacket
		.in_endofpacket   (t2h_endofpacket),            //                  .endofpacket
		.out_ready        (p2b_out_bytes_stream_ready), //  out_bytes_stream.ready
		.out_valid        (p2b_out_bytes_stream_valid), //                  .valid
		.out_data         (p2b_out_bytes_stream_data)   //                  .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (8),
		.FIFO_DEPTH          (64),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) t2h_fifo (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (debug_reset_reset),                    // clk_reset.reset
		.in_data           (p2b_out_bytes_stream_data),            //        in.data
		.in_valid          (p2b_out_bytes_stream_valid),           //          .valid
		.in_ready          (p2b_out_bytes_stream_ready),           //          .ready
		.out_data          (t2h_fifo_out_data),                    //       out.data
		.out_valid         (t2h_fifo_out_valid),                   //          .valid
		.out_ready         (t2h_fifo_out_ready),                   //          .ready
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_startofpacket  (1'b0),                                 // (terminated)
		.in_endofpacket    (1'b0),                                 // (terminated)
		.out_startofpacket (),                                     // (terminated)
		.out_endofpacket   (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

endmodule
