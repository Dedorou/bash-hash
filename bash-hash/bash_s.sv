module bash_s 
  import bash_hash_params_pkg::*;
#(
  parameter [5 : 0] M1 = 56,
  parameter [5 : 0] N1 = 51,
  parameter [5 : 0] M2 = 34,
  parameter [5 : 0] N2 = 7
)(
  input  logic [SLEN-1:0] w0_i,
  input  logic [SLEN-1:0] w1_i,
  input  logic [SLEN-1:0] w2_i,

  output logic [SLEN-1:0] w0_o,
  output logic [SLEN-1:0] w1_o,
  output logic [SLEN-1:0] w2_o
);

logic [SLEN-1:0] w0_i_byte_rev;
logic [SLEN-1:0] w0_byte_rev;
logic [SLEN-1:0] w2_i_byte_rev;
logic [SLEN-1:0] t1_byte_rev;

logic [SLEN-1:0] w0_rot_m1;
logic [SLEN-1:0] w0_rot_n1;
logic [SLEN-1:0] w2_rot_m2;
logic [SLEN-1:0] t1_rot_n2;

logic [SLEN-1:0] w0_rot_m1_byte_rev;
logic [SLEN-1:0] w0_rot_n1_byte_rev;
logic [SLEN-1:0] w2_rot_m2_byte_rev;
logic [SLEN-1:0] t1_rot_n2_byte_rev;

logic [SLEN-1:0] t0;
logic [SLEN-1:0] t1;

logic [SLEN-1:0] w0;
logic [SLEN-1:0] w1;
logic [SLEN-1:0] w2;

logic [SLEN-1:0] t0_or;
logic [SLEN-1:0] t1_or;
logic [SLEN-1:0] t2_and;

assign w0_i_byte_rev = {<<8{w0_i}};
assign w0_byte_rev   = {<<8{w0}};
assign w2_i_byte_rev = {<<8{w2_i}};
assign t1_byte_rev   = {<<8{t1}};

assign w0_rot_m1 = {w0_i_byte_rev[SLEN-1-M1:0], w0_i_byte_rev[SLEN-1:SLEN-M1]};
assign w0_rot_n1 = {w0_byte_rev[SLEN-1-N1:0],   w0_byte_rev[SLEN-1:SLEN-N1]};
assign w2_rot_m2 = {w2_i_byte_rev[SLEN-1-M2:0], w2_i_byte_rev[SLEN-1:SLEN-M2]};
assign t1_rot_n2 = {t1_byte_rev[SLEN-1-N2:0],   t1_byte_rev[SLEN-1:SLEN-N2]};

assign w0_rot_m1_byte_rev = {<<8{w0_rot_m1}};
assign w0_rot_n1_byte_rev = {<<8{w0_rot_n1}};
assign w2_rot_m2_byte_rev = {<<8{w2_rot_m2}};
assign t1_rot_n2_byte_rev = {<<8{t1_rot_n2}};

assign w0 = w0_i ^ w1_i ^ w2_i;
assign t1 = w1_i ^ w0_rot_n1_byte_rev;
assign w1 = w0_rot_m1_byte_rev ^ t1;
assign w2 = w2_i ^ w2_rot_m2_byte_rev ^ t1_rot_n2_byte_rev;
assign t0 = ~w2;

assign t1_or = w0 | w2;
assign t2_and = w0 & w1;
assign t0_or = t0 | w1;

assign w0_o = w0 ^ t0_or;
assign w1_o = w1 ^ t1_or;
assign w2_o = w2 ^ t2_and;

endmodule 
