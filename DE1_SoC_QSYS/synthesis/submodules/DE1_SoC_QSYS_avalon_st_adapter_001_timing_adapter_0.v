// --------------------------------------------------------------------------------
//| Avalon Streaming Timing Adapter
// --------------------------------------------------------------------------------
// altera message_level level1

`timescale 1ns / 100ps
module DE1_SoC_QSYS_avalon_st_adapter_001_timing_adapter_0 (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      output reg         in_ready,
      input              in_valid,
      input      [23: 0] in_data,
      input              in_startofpacket,
      input              in_endofpacket,
      input      [ 1: 0] in_empty,
      // Interface: out
      input              out_ready,
      output reg         out_valid,
      output reg [23: 0] out_data,
      output reg         out_startofpacket,
      output reg         out_endofpacket,
      output reg [ 1: 0] out_empty
);




   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------

   reg  [27: 0] in_payload;
   reg  [27: 0] out_payload;
   reg  [ 1: 0] ready;


   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data,in_startofpacket,in_endofpacket,in_empty};
     {out_data,out_startofpacket,out_endofpacket,out_empty} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
     ready[1] = out_ready;
     out_valid = in_valid && ready[0];
     out_payload = in_payload;
     in_ready = ready[0];
   end


   always @(posedge clk or negedge reset_n) begin
      if (!reset_n) begin
        ready[1-1:0] <= 0;
      end else begin
        ready[1-1:0] <= ready[1:1];
      end 
   end


endmodule

