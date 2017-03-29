// --------------------------------------------------------------------------------
//| Avalon Streaming Channel Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
module DE1_SoC_QSYS_trace_system_0_fabric_h2t_channel_adap (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      output reg         in_ready,
      input              in_valid,
      input      [ 7: 0] in_data,
      input      [ 7: 0] in_channel,
      input              in_startofpacket,
      input              in_endofpacket,
      // Interface: out
      input              out_ready,
      output reg         out_valid,
      output reg [ 7: 0] out_data,
      output reg [ 1: 0] out_channel,
      output reg         out_startofpacket,
      output reg         out_endofpacket
);



   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
      in_ready = out_ready;
      out_valid = in_valid;
      out_data = in_data;
      out_startofpacket = in_startofpacket;
      out_endofpacket = in_endofpacket;

      out_channel = in_channel[ 1: 0];
      // Suppress channels that are higher than the destination's max_channel.
      if (in_channel > 3) begin
         out_valid = 0;
         // Simulation Message goes here.
      end
   end

endmodule

