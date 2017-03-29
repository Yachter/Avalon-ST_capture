// (C) 2001-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/altera_trace_channel_mapper/altera_trace_channel_mapper.sv.terp#1 $
// $Revision: #1 $
// $Date: 2009/06/08 $
// $Author: adraper $

// -------------------------------------------------------
// Altera Trace Channel Mapper
//
// Parameters
//   DATA_WIDTH    : 32
//   EMPTY_WIDTH   : 2
//   IN_CHANNEL    : 2
//   OUT_CHANNEL   : 2
//   MAPPING       : 0 1 2
//
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module DE1_SoC_QSYS_trace_system_0_tracesys_capture_remap
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Input
    // -------------------
    output in_ready,
    input in_valid,
    input [32-1:0] in_data,
    input in_startofpacket,
    input in_endofpacket,
    input [2-1:0] in_empty,
    input [2-1:0] in_channel,

    // -------------------
    // Output
    // -------------------
    input out_ready,
    output out_valid,
    output reg [32-1:0] out_data,
    output reg out_startofpacket,
    output reg out_endofpacket,
    output [2-1:0] out_empty,
    output [2-1:0] out_channel
);

assign in_ready = out_ready;

assign out_valid = in_valid;
assign out_data = in_data;
assign out_startofpacket = in_startofpacket;
assign out_endofpacket = in_endofpacket;
assign out_empty = in_empty;

always @(in_channel) begin

    case (in_channel)
        0: out_channel <= 2'd0;    
        1: out_channel <= 2'd1;    
        2: out_channel <= 2'd2;    
        default: out_channel <= 2'd0;
    endcase

end

endmodule

