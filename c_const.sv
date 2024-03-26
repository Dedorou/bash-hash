module bash_f_const (
  input  logic [63 : 0] data_i,
  output logic [63 : 0] data_o
);

localparam [63 : 0] C_CONST = 64'hAED8E07F99E12BDC;

logic [63 : 0] data_i_byte_rev;
logic [63 : 0] data_i_sh;
logic [63 : 0] data_i_sh_byte_rev;

assign data_i_byte_rev    = {<<8{data_i}};
assign data_i_sh          = {1'b0, data_i_byte_rev[63 : 1]};
assign data_i_sh_byte_rev = {<<8{data_i_sh}};
assign data_o             = data_i[56] ? data_i_sh_byte_rev ^ C_CONST : data_i_sh_byte_rev;

endmodule