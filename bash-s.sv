module bash_s (
input  logic [63 : 0] w0_i,
input  logic [63 : 0] w1_i,
input  logic [63 : 0] w2_i,
 
input  logic [5 : 0]  m1,
input  logic [5 : 0]  n1,
input  logic [5 : 0]  m2,
input  logic [5 : 0]  n2,

output logic [63 : 0] w0_o,
output logic [63 : 0] w1_o,
output logic [63 : 0] w2_o
);

function logic [63 : 0] oct_rev(logic [63 : 0] in);
  return {in[7 : 0], in[15 : 8],
          in[23 : 16], in[31 : 24], 
          in[39 : 32], in[47 : 40], 
          in[55 : 48], in[63 : 56]};  
endfunction

logic [63 : 0] w0_rot_m1;
logic [63 : 0] w0_rot_n1;
logic [63 : 0] w2_rot_m2;
logic [63 : 0] t1_rot_n2;

logic [63 : 0] t0;
logic [63 : 0] t1;

logic [63 : 0] w0;
logic [63 : 0] w1;
logic [63 : 0] w2;

logic [63 : 0] t0_or;
logic [63 : 0] t1_or;
logic [63 : 0] t2_and;

rotator rot_m1 (
  .data_i (oct_rev(w0_i)),
  .rot_i  (m1),
  .data_o (w0_rot_m1)
);

rotator rot_n1 (
  .data_i (oct_rev(w0)),
  .rot_i  (n1),
  .data_o (w0_rot_n1)
);

rotator rot_m2 (
  .data_i (oct_rev(w2_i)),
  .rot_i  (m2),
  .data_o (w2_rot_m2)
);

rotator rot_n2 (
  .data_i (oct_rev(t1)),
  .rot_i  (n2),
  .data_o (t1_rot_n2)
);

assign w0 = w0_i ^ w1_i ^ w2_i;
assign t1 = w1_i ^ oct_rev(w0_rot_n1);
assign w1 = oct_rev(w0_rot_m1) ^ t1;
assign w2 = w2_i ^ oct_rev(w2_rot_m2) ^ oct_rev(t1_rot_n2);
assign t0 = ~w2;

assign t1_or = w0 | w2;
assign t2_and = w0 & w1;
assign t0_or = t0 | w1;

assign w0_o = w0 ^ t0_or;
assign w1_o = w1 ^ t1_or;
assign w2_o = w2 ^ t2_and;

endmodule 
