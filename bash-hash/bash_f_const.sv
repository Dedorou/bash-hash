module bash_f_c 
  import bash_hash_params_pkg::*;
(
  input  logic [SLEN-1:0] c_i,
  output logic [SLEN-1:0] c_o
);

logic [SLEN-1:0] c_byte_rev;
logic [SLEN-1:0] c_sh;
logic [SLEN-1:0] c_sh_byte_rev;
logic [SLEN-1:0] c;

assign c_byte_rev    = {<<8{c_i}};
assign c_sh          = {1'b0, c_byte_rev[SLEN-1:1]};
assign c_sh_byte_rev = {<<8{c_sh}};
assign c             = c_i[56] ? c_sh_byte_rev ^ BASH_F_CONST : c_sh_byte_rev;

assign c_o = c;

endmodule