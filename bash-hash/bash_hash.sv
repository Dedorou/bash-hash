module bash_hash 
  import bash_hash_params_pkg::*;
(
  input  logic            clk_i,
  input  logic            rst_i,
   
  input  logic            prep_i,
  input  logic            start_i,
  input  logic            work_i,
  input  logic            first_i,
  
  input  logic [XLEN-1:0] l_i,

  input  logic [SLEN-1:0] x0_i,
  input  logic [SLEN-1:0] x1_i,
  input  logic [SLEN-1:0] x2_i,
  input  logic [SLEN-1:0] x3_i,
  input  logic [SLEN-1:0] x4_i,
  input  logic [SLEN-1:0] x5_i,
  input  logic [SLEN-1:0] x6_i,
  input  logic [SLEN-1:0] x7_i,
  input  logic [SLEN-1:0] x8_i,
  input  logic [SLEN-1:0] x9_i,
  input  logic [SLEN-1:0] x10_i,
  input  logic [SLEN-1:0] x11_i,
  input  logic [SLEN-1:0] x12_i,
  input  logic [SLEN-1:0] x13_i,
  input  logic [SLEN-1:0] x14_i,
  input  logic [SLEN-1:0] x15_i,

  output logic [SLEN-1:0] y0_o,
  output logic [SLEN-1:0] y1_o,
  output logic [SLEN-1:0] y2_o,
  output logic [SLEN-1:0] y3_o,
  output logic [SLEN-1:0] y4_o,
  output logic [SLEN-1:0] y5_o,
  output logic [SLEN-1:0] y6_o,
  output logic [SLEN-1:0] y7_o
);

logic [SLEN-1:0] bash_f0_ff;
logic [SLEN-1:0] bash_f1_ff;
logic [SLEN-1:0] bash_f2_ff;
logic [SLEN-1:0] bash_f3_ff;
logic [SLEN-1:0] bash_f4_ff;
logic [SLEN-1:0] bash_f5_ff;
logic [SLEN-1:0] bash_f6_ff;
logic [SLEN-1:0] bash_f7_ff;
logic [SLEN-1:0] bash_f8_ff;
logic [SLEN-1:0] bash_f9_ff;
logic [SLEN-1:0] bash_f10_ff;
logic [SLEN-1:0] bash_f11_ff;
logic [SLEN-1:0] bash_f12_ff;
logic [SLEN-1:0] bash_f13_ff;
logic [SLEN-1:0] bash_f14_ff;
logic [SLEN-1:0] bash_f15_ff;
logic [SLEN-1:0] bash_f16_ff;
logic [SLEN-1:0] bash_f17_ff;
logic [SLEN-1:0] bash_f18_ff;
logic [SLEN-1:0] bash_f19_ff;
logic [SLEN-1:0] bash_f20_ff;
logic [SLEN-1:0] bash_f21_ff;
logic [SLEN-1:0] bash_f22_ff;
logic [SLEN-1:0] bash_f23_ff;

logic [SLEN-1:0] bash_f0_mux;
logic [SLEN-1:0] bash_f1_mux;
logic [SLEN-1:0] bash_f2_mux;
logic [SLEN-1:0] bash_f3_mux;
logic [SLEN-1:0] bash_f4_mux;
logic [SLEN-1:0] bash_f5_mux;
logic [SLEN-1:0] bash_f6_mux;
logic [SLEN-1:0] bash_f7_mux;
logic [SLEN-1:0] bash_f8_mux;
logic [SLEN-1:0] bash_f9_mux;
logic [SLEN-1:0] bash_f10_mux;
logic [SLEN-1:0] bash_f11_mux;
logic [SLEN-1:0] bash_f12_mux;
logic [SLEN-1:0] bash_f13_mux;
logic [SLEN-1:0] bash_f14_mux;
logic [SLEN-1:0] bash_f15_mux;
logic [SLEN-1:0] bash_f16_mux;
logic [SLEN-1:0] bash_f17_mux;
logic [SLEN-1:0] bash_f18_mux;
logic [SLEN-1:0] bash_f19_mux;
logic [SLEN-1:0] bash_f20_mux;
logic [SLEN-1:0] bash_f21_mux;
logic [SLEN-1:0] bash_f22_mux;
logic [SLEN-1:0] bash_f23_mux;

logic [SLEN-1:0] bash_f0_o;
logic [SLEN-1:0] bash_f1_o;
logic [SLEN-1:0] bash_f2_o;
logic [SLEN-1:0] bash_f3_o;
logic [SLEN-1:0] bash_f4_o;
logic [SLEN-1:0] bash_f5_o;
logic [SLEN-1:0] bash_f6_o;
logic [SLEN-1:0] bash_f7_o;
logic [SLEN-1:0] bash_f8_o;
logic [SLEN-1:0] bash_f9_o;
logic [SLEN-1:0] bash_f10_o;
logic [SLEN-1:0] bash_f11_o;
logic [SLEN-1:0] bash_f12_o;
logic [SLEN-1:0] bash_f13_o;
logic [SLEN-1:0] bash_f14_o;
logic [SLEN-1:0] bash_f15_o;
logic [SLEN-1:0] bash_f16_o;
logic [SLEN-1:0] bash_f17_o;
logic [SLEN-1:0] bash_f18_o;
logic [SLEN-1:0] bash_f19_o;
logic [SLEN-1:0] bash_f20_o;
logic [SLEN-1:0] bash_f21_o;
logic [SLEN-1:0] bash_f22_o;
logic [SLEN-1:0] bash_f23_o;

logic [SLEN-1:0] bash_f_c_o;
logic [SLEN-1:0] bash_f_c_ff;
logic [SLEN-1:0] bash_f_c_mux;

assign bash_f_c_mux = (BASH_F_INIT & {SLEN{start_i}})
                    | (bash_f_c_o  & {SLEN{work_i}});

always_ff @(posedge clk_i) begin 
  if (start_i | work_i) begin 
    bash_f_c_ff <= bash_f_c_mux;
  end
end

bash_f_c bash_f_c (
  .c_i(bash_f_c_ff),
  .c_o(bash_f_c_o)
);

logic l_192_en;
logic l_256_en;

assign l_192_en = ~(l_i[1] ^  l_i[0]);
assign l_256_en = ~(l_i[1] & ~l_i[0]);


assign bash_f0_mux  = (x0_i      & {SLEN{start_i}})
                    | (bash_f0_o & {SLEN{work_i}});
assign bash_f1_mux  = (x1_i      & {SLEN{start_i}})
                    | (bash_f1_o & {SLEN{work_i}});
assign bash_f2_mux  = (x2_i      & {SLEN{start_i}})
                    | (bash_f2_o & {SLEN{work_i}});
assign bash_f3_mux  = (x3_i      & {SLEN{start_i}})
                    | (bash_f3_o & {SLEN{work_i}});
assign bash_f4_mux  = (x4_i      & {SLEN{start_i}})
                    | (bash_f4_o & {SLEN{work_i}});
assign bash_f5_mux  = (x5_i      & {SLEN{start_i}})
                    | (bash_f5_o & {SLEN{work_i}});
assign bash_f6_mux  = (x6_i      & {SLEN{start_i}})
                    | (bash_f6_o & {SLEN{work_i}});
assign bash_f7_mux  = (x7_i      & {SLEN{start_i}})
                    | (bash_f7_o & {SLEN{work_i}});

assign bash_f8_mux  = (x8_i       & {SLEN{start_i & l_192_en}})
                    | (bash_f8_o  & {SLEN{work_i  & ~first_i}});
assign bash_f9_mux  = (x9_i       & {SLEN{start_i & l_192_en}})
                    | (bash_f9_o  & {SLEN{work_i  & ~first_i}});
assign bash_f10_mux = (x10_i      & {SLEN{start_i & l_192_en}})
                    | (bash_f10_o & {SLEN{work_i  & ~first_i}});
assign bash_f11_mux = (x11_i      & {SLEN{start_i & l_192_en}})
                    | (bash_f11_o & {SLEN{work_i  & ~first_i}});

assign bash_f12_mux = (x12_i      & {SLEN{start_i & l_256_en}})
                    | (bash_f12_o & {SLEN{work_i  & ~first_i}});
assign bash_f13_mux = (x13_i      & {SLEN{start_i & l_256_en}})
                    | (bash_f13_o & {SLEN{work_i  & ~first_i}});
assign bash_f14_mux = (x14_i      & {SLEN{start_i & l_256_en}})
                    | (bash_f14_o & {SLEN{work_i  & ~first_i}});
assign bash_f15_mux = (x15_i      & {SLEN{start_i & l_256_en}})
                    | (bash_f15_o & {SLEN{work_i  & ~first_i}});

assign bash_f16_mux = (bash_f16_o & {SLEN{work_i}});
assign bash_f17_mux = (bash_f17_o & {SLEN{work_i}});
assign bash_f18_mux = (bash_f18_o & {SLEN{work_i}});
assign bash_f19_mux = (bash_f19_o & {SLEN{work_i}});
assign bash_f20_mux = (bash_f20_o & {SLEN{work_i}});
assign bash_f21_mux = (bash_f21_o & {SLEN{work_i}});
assign bash_f22_mux = (bash_f22_o & {SLEN{work_i}});

assign bash_f23_mux = (64'h2000000000000000 & {SLEN{prep_i}})
                    | (bash_f23_o & {SLEN{work_i}});


always_ff @(posedge clk_i) begin
  if (start_i | work_i) begin 
    bash_f0_ff  <= bash_f0_mux;
    bash_f1_ff  <= bash_f1_mux;
    bash_f2_ff  <= bash_f2_mux;
    bash_f3_ff  <= bash_f3_mux;
    bash_f4_ff  <= bash_f4_mux;
    bash_f5_ff  <= bash_f5_mux;
    bash_f6_ff  <= bash_f6_mux;
    bash_f7_ff  <= bash_f7_mux;
    bash_f8_ff  <= bash_f8_mux;
    bash_f9_ff  <= bash_f9_mux;
    bash_f10_ff <= bash_f10_mux;
    bash_f11_ff <= bash_f11_mux;
    bash_f12_ff <= bash_f12_mux;
    bash_f13_ff <= bash_f13_mux;
    bash_f14_ff <= bash_f14_mux;
    bash_f15_ff <= bash_f15_mux;
  end
  if (prep_i | work_i) begin 
    bash_f16_ff <= bash_f16_mux;
    bash_f17_ff <= bash_f17_mux;
    bash_f18_ff <= bash_f18_mux;
    bash_f19_ff <= bash_f19_mux;
    bash_f20_ff <= bash_f20_mux;
    bash_f21_ff <= bash_f21_mux;
    bash_f22_ff <= bash_f22_mux;
    bash_f23_ff <= bash_f23_mux;  
  end
end

bash_f bash_f(
  .c_i  (bash_f_c_ff),
  .s0_i (bash_f0_ff),
  .s1_i (bash_f1_ff),
  .s2_i (bash_f2_ff),
  .s3_i (bash_f3_ff),
  .s4_i (bash_f4_ff),
  .s5_i (bash_f5_ff),
  .s6_i (bash_f6_ff),
  .s7_i (bash_f7_ff),
  .s8_i (bash_f8_ff),
  .s9_i (bash_f9_ff),
  .s10_i(bash_f10_ff),
  .s11_i(bash_f11_ff),
  .s12_i(bash_f12_ff),
  .s13_i(bash_f13_ff),
  .s14_i(bash_f14_ff),
  .s15_i(bash_f15_ff),
  .s16_i(bash_f16_ff),
  .s17_i(bash_f17_ff),
  .s18_i(bash_f18_ff),
  .s19_i(bash_f19_ff),
  .s20_i(bash_f20_ff),
  .s21_i(bash_f21_ff),
  .s22_i(bash_f22_ff),
  .s23_i(bash_f23_ff),
  .s0_o (bash_f0_o),
  .s1_o (bash_f1_o),
  .s2_o (bash_f2_o),
  .s3_o (bash_f3_o),
  .s4_o (bash_f4_o),
  .s5_o (bash_f5_o),
  .s6_o (bash_f6_o),
  .s7_o (bash_f7_o),
  .s8_o (bash_f8_o),
  .s9_o (bash_f9_o),
  .s10_o(bash_f10_o),
  .s11_o(bash_f11_o),
  .s12_o(bash_f12_o),
  .s13_o(bash_f13_o),
  .s14_o(bash_f14_o),
  .s15_o(bash_f15_o),
  .s16_o(bash_f16_o),
  .s17_o(bash_f17_o),
  .s18_o(bash_f18_o),
  .s19_o(bash_f19_o),
  .s20_o(bash_f20_o),
  .s21_o(bash_f21_o),
  .s22_o(bash_f22_o),
  .s23_o(bash_f23_o)
);

assign y0_o = bash_f0_ff;
assign y1_o = bash_f1_ff;
assign y2_o = bash_f2_ff;
assign y3_o = bash_f3_ff;
assign y4_o = bash_f4_ff;
assign y5_o = bash_f5_ff;
assign y6_o = bash_f6_ff;
assign y7_o = bash_f7_ff;

endmodule

