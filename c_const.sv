module bash_f_const (
  input  logic          clk,
  input  logic [63 : 0] data_i,
  output logic [63 : 0] data_o
);

localparam [63 : 0] C_CONST = 64'hAED8E07F99E12BDC;

logic [63 : 0] c_byte_rev;
logic [63 : 0] c_sh;
logic [63 : 0] c_sh_byte_rev;
logic [63 : 0] c;

assign c_byte_rev      = {<<8{data_i}};
assign c_sh            = {1'b0, c_byte_rev[63 : 1]};
assign c_sh_byte_rev = {<<8{c_sh}};
assign c               = data_i[56] ? c_sh_byte_rev ^ C_CONST : c_sh_byte_rev;

always_ff @(posedge clk) begin 
  data_o <= c;
end

endmodule