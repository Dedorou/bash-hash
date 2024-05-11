module bash_s_tb 
  import bash_hash_params_pkg::*;
  import tb_pkg::*;
();

logic [SLEN-1:0] w0_i;
logic [SLEN-1:0] w1_i;
logic [SLEN-1:0] w2_i;

logic [SLEN-1:0] w0_o;
logic [SLEN-1:0] w1_o;
logic [SLEN-1:0] w2_o;

bash_s #(
  .M1(bash_s_param[0]),
  .N1(bash_s_param[1]),
  .M2(bash_s_param[2]),
  .N2(bash_s_param[3])
) dut (
  .w0_i(w0_i),
  .w1_i(w1_i),
  .w2_i(w2_i),
  .w0_o(w0_o),
  .w1_o(w1_o),
  .w2_o(w2_o)
);

initial begin
  $display("Bash-s test");
  w0_i = bash_s_i[0];
  w1_i = bash_s_i[1];
  w2_i = bash_s_i[2];
  $display("Input data: w0=0x%0h, w1=0x%0h, w1=0x%0h", w0_i, w1_i, w2_i);
  #10;
  $display("Output data: w0=0x%0h, w1=0x%0h, w1=0x%0h", w0_o, w1_o, w2_o);
  $display("Should be: w0=0x%0h, w1=0x%0h, w1=0x%0h", bash_s_o[0], bash_s_o[1], bash_s_o[2]);
  if ((w0_o == bash_s_o[0]) & (w1_o == bash_s_o[1]) & (w2_o == bash_s_o[2])) begin 
    $display("Test passed");
  end else begin 
    $display("Test failed");
  end
end

endmodule