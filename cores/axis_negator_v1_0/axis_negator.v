
`timescale 1 ns / 1 ps

module axis_negator #
(
  parameter integer AXIS_TDATA_WIDTH = 32
)
(
  // System signals
  input  wire                        aclk,

  input  wire                        cfg_flag,

  // Slave side
  output wire                        s_axis_tready,
  input  wire [AXIS_TDATA_WIDTH-1:0] s_axis_tdata,
  input  wire                        s_axis_tvalid,

  // Master side
  input  wire                        m_axis_tready,
  output wire [AXIS_TDATA_WIDTH-1:0] m_axis_tdata,
  output wire                        m_axis_tvalid
);

  assign s_axis_tready = m_axis_tready;
  assign m_axis_tdata = cfg_flag ? -$signed(s_axis_tdata) : s_axis_tdata;
  assign m_axis_tvalid = s_axis_tvalid;

endmodule