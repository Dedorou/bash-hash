module rotator (
  input  logic [63 : 0] data_i,
  input  logic [5 : 0]  rot_i,

  output logic [63 : 0] data_o
);

logic [63 : 0] sh_layer_5;
logic [63 : 0] sh_layer_4;
logic [63 : 0] sh_layer_3;
logic [63 : 0] sh_layer_2;
logic [63 : 0] sh_layer_1;
logic [63 : 0] sh_layer_0;

assign sh_layer_5 = rot_i[5] ? {data_i[31 : 0],     data_i[63 : 32]}     : data_i;
assign sh_layer_4 = rot_i[4] ? {sh_layer_5[47 : 0], sh_layer_5[63 : 48]} : sh_layer_5;
assign sh_layer_3 = rot_i[3] ? {sh_layer_4[55 : 0], sh_layer_4[63 : 56]} : sh_layer_4;
assign sh_layer_2 = rot_i[2] ? {sh_layer_3[59 : 0], sh_layer_3[63 : 60]} : sh_layer_3;
assign sh_layer_1 = rot_i[1] ? {sh_layer_2[61 : 0], sh_layer_2[63 : 62]} : sh_layer_2;
assign sh_layer_0 = rot_i[0] ? {sh_layer_1[62 : 0], sh_layer_1[63]}      : sh_layer_1;

assign data_o = sh_layer_0;

endmodule