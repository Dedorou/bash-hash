module bash_f_tb 
  import bash_hash_params_pkg::*;
  import tb_pkg::*;
();

logic clk = 1;
logic data_sel;

logic [SLEN-1:0] s0_i;
logic [SLEN-1:0] s1_i;
logic [SLEN-1:0] s2_i;
logic [SLEN-1:0] s3_i;
logic [SLEN-1:0] s4_i;
logic [SLEN-1:0] s5_i;
logic [SLEN-1:0] s6_i;
logic [SLEN-1:0] s7_i;
logic [SLEN-1:0] s8_i;
logic [SLEN-1:0] s9_i;
logic [SLEN-1:0] s10_i;
logic [SLEN-1:0] s11_i;
logic [SLEN-1:0] s12_i;
logic [SLEN-1:0] s13_i;
logic [SLEN-1:0] s14_i;
logic [SLEN-1:0] s15_i;
logic [SLEN-1:0] s16_i;
logic [SLEN-1:0] s17_i;
logic [SLEN-1:0] s18_i;
logic [SLEN-1:0] s19_i;
logic [SLEN-1:0] s20_i;
logic [SLEN-1:0] s21_i;
logic [SLEN-1:0] s22_i;
logic [SLEN-1:0] s23_i;

logic [SLEN-1:0] s0_o;
logic [SLEN-1:0] s1_o;
logic [SLEN-1:0] s2_o;
logic [SLEN-1:0] s3_o;
logic [SLEN-1:0] s4_o;
logic [SLEN-1:0] s5_o;
logic [SLEN-1:0] s6_o;
logic [SLEN-1:0] s7_o;
logic [SLEN-1:0] s8_o;
logic [SLEN-1:0] s9_o;
logic [SLEN-1:0] s10_o;
logic [SLEN-1:0] s11_o;
logic [SLEN-1:0] s12_o;
logic [SLEN-1:0] s13_o;
logic [SLEN-1:0] s14_o;
logic [SLEN-1:0] s15_o;
logic [SLEN-1:0] s16_o;
logic [SLEN-1:0] s17_o;
logic [SLEN-1:0] s18_o;
logic [SLEN-1:0] s19_o;
logic [SLEN-1:0] s20_o;
logic [SLEN-1:0] s21_o;
logic [SLEN-1:0] s22_o;
logic [SLEN-1:0] s23_o;

function logic compare(input logic [63:0] data_i [0:23]);
  logic equal = 1;
  begin
    for (integer i = 0; i < 24; i=i+1) begin
      if (data_i[i] != bash_f_o[i]) begin
        equal = 0;
        break;
      end
    end
    return equal;
  end
endfunction

bash_f_iter bash_f (
  .clk(clk),
  .data_sel(data_sel),
  .data_i({s0_i,  s1_i,  s2_i,  s3_i,  s4_i,  s5_i,  s6_i,  s7_i,
           s8_i,  s9_i,  s10_i, s11_i, s12_i, s13_i, s14_i, s15_i,
           s16_i, s17_i, s18_i, s19_i, s20_i, s21_i, s22_i, s23_i}),
  .data_o({s0_o,  s1_o,  s2_o,  s3_o,  s4_o,  s5_o,  s6_o,  s7_o,
           s8_o,  s9_o,  s10_o, s11_o, s12_o, s13_o, s14_o, s15_o,
           s16_o, s17_o, s18_o, s19_o, s20_o, s21_o, s22_o, s23_o})
);

always #50 clk = ~clk;

initial begin
  $display("Bash-s test");

  s0_i  = bash_f_i[0];
  s1_i  = bash_f_i[1];
  s2_i  = bash_f_i[2];
  s3_i  = bash_f_i[3];
  s4_i  = bash_f_i[4];
  s5_i  = bash_f_i[5];
  s6_i  = bash_f_i[6];
  s7_i  = bash_f_i[7];
  s8_i  = bash_f_i[8];
  s9_i  = bash_f_i[9];
  s10_i = bash_f_i[10];
  s11_i = bash_f_i[11];
  s12_i = bash_f_i[12];
  s13_i = bash_f_i[13];
  s14_i = bash_f_i[14];
  s15_i = bash_f_i[15];
  s16_i = bash_f_i[16];
  s17_i = bash_f_i[17];
  s18_i = bash_f_i[18];
  s19_i = bash_f_i[19];
  s20_i = bash_f_i[20];
  s21_i = bash_f_i[21];
  s22_i = bash_f_i[22];
  s23_i = bash_f_i[23];

  data_sel = 0;

  $display("Input data:");

  $display("s0=0x%0h", s0_i);
  $display("s1=0x%0h", s1_i);
  $display("s2=0x%0h", s2_i);
  $display("s3=0x%0h", s3_i);
  $display("s4=0x%0h", s4_i);
  $display("s5=0x%0h", s5_i);
  $display("s6=0x%0h", s6_i);
  $display("s7=0x%0h", s7_i);
  $display("s8=0x%0h", s8_i);
  $display("s9=0x%0h", s9_i);
  $display("s10=0x%0h", s10_i);
  $display("s11=0x%0h", s11_i);
  $display("s12=0x%0h", s12_i);
  $display("s13=0x%0h", s13_i);
  $display("s14=0x%0h", s14_i);
  $display("s15=0x%0h", s15_i);
  $display("s16=0x%0h", s16_i);
  $display("s17=0x%0h", s17_i);
  $display("s18=0x%0h", s18_i);
  $display("s19=0x%0h", s19_i);
  $display("s20=0x%0h", s20_i);
  $display("s21=0x%0h", s21_i);
  $display("s22=0x%0h", s22_i);
  $display("s23=0x%0h", s23_i);

  #100;
  
  $monitor("time=%0t, s0=0x%0h", $time, s0_o);
  $monitor("time=%0t, s1=0x%0h", $time, s1_o);
  $monitor("time=%0t, s2=0x%0h", $time, s2_o);
  $monitor("time=%0t, s3=0x%0h", $time, s3_o);
  $monitor("time=%0t, s4=0x%0h", $time, s4_o);
  $monitor("time=%0t, s5=0x%0h", $time, s5_o);
  $monitor("time=%0t, s6=0x%0h", $time, s6_o);
  $monitor("time=%0t, s7=0x%0h", $time, s7_o);
  $monitor("time=%0t, s8=0x%0h", $time, s8_o);
  $monitor("time=%0t, s9=0x%0h", $time, s9_o);
  $monitor("time=%0t, s10=0x%0h", $time, s10_o);
  $monitor("time=%0t, s11=0x%0h", $time, s11_o);
  $monitor("time=%0t, s12=0x%0h", $time, s12_o);
  $monitor("time=%0t, s13=0x%0h", $time, s13_o);
  $monitor("time=%0t, s14=0x%0h", $time, s14_o);
  $monitor("time=%0t, s15=0x%0h", $time, s15_o);
  $monitor("time=%0t, s16=0x%0h", $time, s16_o);
  $monitor("time=%0t, s17=0x%0h", $time, s17_o);
  $monitor("time=%0t, s18=0x%0h", $time, s18_o);
  $monitor("time=%0t, s19=0x%0h", $time, s19_o);
  $monitor("time=%0t, s20=0x%0h", $time, s20_o);
  $monitor("time=%0t, s21=0x%0h", $time, s21_o);
  $monitor("time=%0t, s22=0x%0h", $time, s22_o);
  $monitor("time=%0t, s23=0x%0h", $time, s23_o);

  #100;
  data_sel = 1;
  #(100*23);
  $display("Output data:");
  $display("s0=0x%0h", s0_i);
  $display("s1=0x%0h", s1_o);
  $display("s2=0x%0h", s2_o);
  $display("s3=0x%0h", s3_o);
  $display("s4=0x%0h", s4_o);
  $display("s5=0x%0h", s5_o);
  $display("s6=0x%0h", s6_o);
  $display("s7=0x%0h", s7_o);
  $display("s8=0x%0h", s8_o);
  $display("s9=0x%0h", s9_o);
  $display("s10=0x%0h", s10_o);
  $display("s11=0x%0h", s11_o);
  $display("s12=0x%0h", s12_o);
  $display("s13=0x%0h", s13_o);
  $display("s14=0x%0h", s14_o);
  $display("s15=0x%0h", s15_o);
  $display("s16=0x%0h", s16_o);
  $display("s17=0x%0h", s17_o);
  $display("s18=0x%0h", s18_o);
  $display("s19=0x%0h", s19_o);
  $display("s20=0x%0h", s20_o);
  $display("s21=0x%0h", s21_o);
  $display("s22=0x%0h", s22_o);
  $display("s23=0x%0h", s23_o);

  $display("Should be:");
  $display("s0=0x%0h", bash_f_o[0]);
  $display("s1=0x%0h", bash_f_o[1]);
  $display("s2=0x%0h", bash_f_o[2]);
  $display("s3=0x%0h", bash_f_o[3]);
  $display("s4=0x%0h", bash_f_o[4]);
  $display("s5=0x%0h", bash_f_o[5]);
  $display("s6=0x%0h", bash_f_o[6]);
  $display("s7=0x%0h", bash_f_o[7]);
  $display("s8=0x%0h", bash_f_o[8]);
  $display("s9=0x%0h", bash_f_o[9]);
  $display("s10=0x%0h", bash_f_o[10]);
  $display("s11=0x%0h", bash_f_o[11]);
  $display("s12=0x%0h", bash_f_o[12]);
  $display("s13=0x%0h", bash_f_o[13]);
  $display("s14=0x%0h", bash_f_o[14]);
  $display("s15=0x%0h", bash_f_o[15]);
  $display("s16=0x%0h", bash_f_o[16]);
  $display("s17=0x%0h", bash_f_o[17]);
  $display("s18=0x%0h", bash_f_o[18]);
  $display("s19=0x%0h", bash_f_o[19]);
  $display("s20=0x%0h", bash_f_o[20]);
  $display("s21=0x%0h", bash_f_o[21]);
  $display("s22=0x%0h", bash_f_o[22]);
  $display("s23=0x%0h", bash_f_o[23]);
  if (compare({s0_o,  s1_o,  s2_o,  s3_o,  s4_o,  s5_o,  s6_o,  s7_o,
               s8_o,  s9_o,  s10_o, s11_o, s12_o, s13_o, s14_o, s15_o,
               s16_o, s17_o, s18_o, s19_o, s20_o, s21_o, s22_o, s23_o})) begin 
    $display("Test passed");
  end else begin 
    $display("Test failed");
  end
  data_sel = 0;
end

endmodule