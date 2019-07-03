/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

module mux_Synth(selector, clk, pop_delay_VC0, data_VC0, data_VC1, data_out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  input clk;
  input [3:0] data_VC0;
  input [3:0] data_VC1;
  output [3:0] data_out;
  input pop_delay_VC0;
  input selector;
  NOR _16_ (
    .A(selector),
    .B(data_VC0[0]),
    .Y(_00_)
  );
  NOT _17_ (
    .A(data_VC1[0]),
    .Y(_01_)
  );
  NAND _18_ (
    .A(selector),
    .B(_01_),
    .Y(_02_)
  );
  NAND _19_ (
    .A(_02_),
    .B(pop_delay_VC0),
    .Y(_03_)
  );
  NOR _20_ (
    .A(_03_),
    .B(_00_),
    .Y(data_out[0])
  );
  NOR _21_ (
    .A(data_VC0[1]),
    .B(selector),
    .Y(_04_)
  );
  NOT _22_ (
    .A(data_VC1[1]),
    .Y(_05_)
  );
  NAND _23_ (
    .A(_05_),
    .B(selector),
    .Y(_06_)
  );
  NAND _24_ (
    .A(_06_),
    .B(pop_delay_VC0),
    .Y(_07_)
  );
  NOR _25_ (
    .A(_07_),
    .B(_04_),
    .Y(data_out[1])
  );
  NOR _26_ (
    .A(data_VC0[2]),
    .B(selector),
    .Y(_08_)
  );
  NOT _27_ (
    .A(data_VC1[2]),
    .Y(_09_)
  );
  NAND _28_ (
    .A(_09_),
    .B(selector),
    .Y(_10_)
  );
  NAND _29_ (
    .A(_10_),
    .B(pop_delay_VC0),
    .Y(_11_)
  );
  NOR _30_ (
    .A(_11_),
    .B(_08_),
    .Y(data_out[2])
  );
  NOR _31_ (
    .A(data_VC0[3]),
    .B(selector),
    .Y(_12_)
  );
  NOT _32_ (
    .A(data_VC1[3]),
    .Y(_13_)
  );
  NAND _33_ (
    .A(_13_),
    .B(selector),
    .Y(_14_)
  );
  NAND _34_ (
    .A(_14_),
    .B(pop_delay_VC0),
    .Y(_15_)
  );
  NOR _35_ (
    .A(_15_),
    .B(_12_),
    .Y(data_out[3])
  );
endmodule