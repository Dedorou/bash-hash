module bash_s_param #(
parameter [5 : 0] m1 = 56,
parameter [5 : 0] n1 = 51,
parameter [5 : 0] m2 = 34,
parameter [5 : 0] n2 = 7
)(
input  logic [63 : 0] w0_i,
input  logic [63 : 0] w1_i,
input  logic [63 : 0] w2_i,

output logic [63 : 0] w0_o,
output logic [63 : 0] w1_o,
output logic [63 : 0] w2_o
);

logic [63 : 0] w0_i_byte_rev;
logic [63 : 0] w0_byte_rev;
logic [63 : 0] w2_i_byte_rev;
logic [63 : 0] t1_byte_rev;

logic [63 : 0] w0_rot_m1;
logic [63 : 0] w0_rot_n1;
logic [63 : 0] w2_rot_m2;
logic [63 : 0] t1_rot_n2;

logic [63 : 0] w0_rot_m1_byte_rev;
logic [63 : 0] w0_rot_n1_byte_rev;
logic [63 : 0] w2_rot_m2_byte_rev;
logic [63 : 0] t1_rot_n2_byte_rev;

logic [63 : 0] t0;
logic [63 : 0] t1;

logic [63 : 0] w0;
logic [63 : 0] w1;
logic [63 : 0] w2;

logic [63 : 0] t0_or;
logic [63 : 0] t1_or;
logic [63 : 0] t2_and;

assign w0_i_byte_rev = {<<8{w0_i}};
assign w0_byte_rev   = {<<8{w0}};
assign w2_i_byte_rev = {<<8{w2_i}};
assign t1_byte_rev   = {<<8{t1}};

assign w0_rot_m1 = {w0_i_byte_rev[63 - m1 : 0], w0_i_byte_rev[63 : 64 - m1]};
assign w0_rot_n1 = {w0_byte_rev[63 - n1 : 0],   w0_byte_rev[63 : 64 - n1]};
assign w2_rot_m2 = {w2_i_byte_rev[63 - m2 : 0], w2_i_byte_rev[63 : 64 - m2]};
assign t1_rot_n2 = {t1_byte_rev[63 - n2 : 0],   t1_byte_rev[63 : 64 - n2]};

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
