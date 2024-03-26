`include "bash_params.svh"

module bash_f_test (
input  logic clk,
input  logic [1535 : 0] data_i,
input  logic [63 : 0] c_i,
output logic [1535 : 0] data_o
);

logic [1535 : 0] data [0 : 24];
logic [63 : 0] c [0: 24];


assign c[0] = c_i;
assign data[0] = data_i;

generate
  for(genvar i = 0; i < 24 ; i++) begin
    bash_f_const bash_f_const (
      .data_i(c[i]),
      .data_o(c[i+1])
    );
    
    bash_f_stage #(
    ) bash_f_stage (
      .data_i(data[i]),
      .c(c[i]),
      .data_o(data[i + 1])
    );
  end
endgenerate

assign data_o = data[24];

endmodule
