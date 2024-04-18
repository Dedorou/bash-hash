module bash_f 
  import bash_hash_params_pkg::*;
(
  input  logic [SLEN-1:0] c_i,
  
  input  logic [SLEN-1:0] s0_i,
  input  logic [SLEN-1:0] s1_i,
  input  logic [SLEN-1:0] s2_i,
  input  logic [SLEN-1:0] s3_i,
  input  logic [SLEN-1:0] s4_i,
  input  logic [SLEN-1:0] s5_i,
  input  logic [SLEN-1:0] s6_i,
  input  logic [SLEN-1:0] s7_i,
  input  logic [SLEN-1:0] s8_i,
  input  logic [SLEN-1:0] s9_i,
  input  logic [SLEN-1:0] s10_i,
  input  logic [SLEN-1:0] s11_i,
  input  logic [SLEN-1:0] s12_i,
  input  logic [SLEN-1:0] s13_i,
  input  logic [SLEN-1:0] s14_i,
  input  logic [SLEN-1:0] s15_i,
  input  logic [SLEN-1:0] s16_i,
  input  logic [SLEN-1:0] s17_i,
  input  logic [SLEN-1:0] s18_i,
  input  logic [SLEN-1:0] s19_i,
  input  logic [SLEN-1:0] s20_i,
  input  logic [SLEN-1:0] s21_i,
  input  logic [SLEN-1:0] s22_i,
  input  logic [SLEN-1:0] s23_i,

  output logic [SLEN-1:0] s0_o,
  output logic [SLEN-1:0] s1_o,
  output logic [SLEN-1:0] s2_o,
  output logic [SLEN-1:0] s3_o,
  output logic [SLEN-1:0] s4_o,
  output logic [SLEN-1:0] s5_o,
  output logic [SLEN-1:0] s6_o,
  output logic [SLEN-1:0] s7_o,
  output logic [SLEN-1:0] s8_o,
  output logic [SLEN-1:0] s9_o,
  output logic [SLEN-1:0] s10_o,
  output logic [SLEN-1:0] s11_o,
  output logic [SLEN-1:0] s12_o,
  output logic [SLEN-1:0] s13_o,
  output logic [SLEN-1:0] s14_o,
  output logic [SLEN-1:0] s15_o,
  output logic [SLEN-1:0] s16_o,
  output logic [SLEN-1:0] s17_o,
  output logic [SLEN-1:0] s18_o,
  output logic [SLEN-1:0] s19_o,
  output logic [SLEN-1:0] s20_o,
  output logic [SLEN-1:0] s21_o,
  output logic [SLEN-1:0] s22_o,
  output logic [SLEN-1:0] s23_o
);

logic [SLEN-1:0] s_tmp_i [0:23];
logic [SLEN-1:0] s_tmp_o [0:23];

assign s_tmp_i[0]  = s0_i;
assign s_tmp_i[1]  = s1_i;
assign s_tmp_i[2]  = s2_i;
assign s_tmp_i[3]  = s3_i;
assign s_tmp_i[4]  = s4_i;
assign s_tmp_i[5]  = s5_i;
assign s_tmp_i[6]  = s6_i;
assign s_tmp_i[7]  = s7_i;
assign s_tmp_i[8]  = s8_i;
assign s_tmp_i[9]  = s9_i;
assign s_tmp_i[10] = s10_i;
assign s_tmp_i[11] = s11_i;
assign s_tmp_i[12] = s12_i;
assign s_tmp_i[13] = s13_i;
assign s_tmp_i[14] = s14_i;
assign s_tmp_i[15] = s15_i;
assign s_tmp_i[16] = s16_i;
assign s_tmp_i[17] = s17_i;
assign s_tmp_i[18] = s18_i;
assign s_tmp_i[19] = s19_i;
assign s_tmp_i[20] = s20_i;
assign s_tmp_i[21] = s21_i;
assign s_tmp_i[22] = s22_i;
assign s_tmp_i[23] = s23_i;

generate
  for(genvar i = 0; i < 8; i++) begin 
    bash_s #(
      .M1(M1_BASH_S[i]),
      .N1(N1_BASH_S[i]),
      .M2(M2_BASH_S[i]),
      .N2(N2_BASH_S[i])
    ) bash_s (
      .w0_i(s_tmp_i[i]),    
      .w1_i(s_tmp_i[i+8]),
      .w2_i(s_tmp_i[i+16]),
      .w0_o(s_tmp_o[i]),    
      .w1_o(s_tmp_o[i+8]),
      .w2_o(s_tmp_o[i+16])
    );
  end    
endgenerate

assign s0_o  = s_tmp_o[15];
assign s1_o  = s_tmp_o[10];
assign s2_o  = s_tmp_o[9];
assign s3_o  = s_tmp_o[12];
assign s4_o  = s_tmp_o[11];
assign s5_o  = s_tmp_o[14];
assign s6_o  = s_tmp_o[13];
assign s7_o  = s_tmp_o[8];
assign s8_o  = s_tmp_o[17];
assign s9_o  = s_tmp_o[16];
assign s10_o = s_tmp_o[19];
assign s11_o = s_tmp_o[18];
assign s12_o = s_tmp_o[21];
assign s13_o = s_tmp_o[20];
assign s14_o = s_tmp_o[23];
assign s15_o = s_tmp_o[22];
assign s16_o = s_tmp_o[6];
assign s17_o = s_tmp_o[3];
assign s18_o = s_tmp_o[0];
assign s19_o = s_tmp_o[5];
assign s20_o = s_tmp_o[2];
assign s21_o = s_tmp_o[7];
assign s22_o = s_tmp_o[4];
assign s23_o = s_tmp_o[1] ^ c_i;
 
endmodule

