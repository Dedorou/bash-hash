module bash_f_iter (
  input  logic          clk,
  input  logic          data_sel,
  input  logic [1535:0] data_i,

  output logic [1535:0] data_o
);

localparam [63:0] C_CONST = 64'hB194BAC80A08F53B;

logic [1535:0] bash_f_i;
logic [1535:0] bash_f_o;

logic [63:0] bash_f_c_i;
logic [63:0] bash_f_c_o;

assign bash_f_i   = ({1536{data_sel}}  & bash_f_o)
                  | ({1536{~data_sel}} & data_i);

assign bash_f_c_i = ({1536{data_sel}}  & bash_f_c_o)
                  | ({1536{~data_sel}} & C_CONST);


bash_f_const_old bash_f_const_old (
  .clk   (clk),
  .data_i(bash_f_c_i),
  .data_o(bash_f_c_o)
);
    
bash_f_stage bash_f_stage (
  .clk   (clk),
  .data_i(bash_f_i),
  .c     (bash_f_c_i),
  .data_o(bash_f_o)
);

assign data_o = bash_f_o;

endmodule