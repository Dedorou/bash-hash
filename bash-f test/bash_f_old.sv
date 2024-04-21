`include "bash_params.svh"

module bash_f_stage #(
//parameter [63 : 0] c = 64'h7bc9de0dceb2e860
)(
input  logic            clk,
input  logic [63 : 0]   c,
input  logic [1535 : 0] data_i,

output logic [1535 : 0] data_o
);

logic [63 : 0] s_i [0 : 23];
logic [63 : 0] s_o [0 : 23];
logic [63 : 0] s_o_true [0 : 23];

generate
  for(genvar j = 0; j < 24; j++) begin
    assign s_i[23 - j] = data_i[63 + (j * 64) : (j * 64)];
  end
endgenerate

generate
  for (genvar i = 0; i < 8; i++) begin 
    bash_s #(
      .M1(M1_bash[i]),
      .N1(N1_bash[i]),
      .M2(M2_bash[i]),
      .N2(N2_bash[i])
    ) bash_s (
      .w0_i(s_i[i]),    
      .w1_i(s_i[i + 8]),
      .w2_i(s_i[i + 16]),
      .w0_o(s_o[i]),    
      .w1_o(s_o[i + 8]),
      .w2_o(s_o[i + 16])
    );
  end    
endgenerate

always_ff @(posedge clk) begin
  data_o <= {s_o[15], s_o[10], s_o[9],  s_o[12], s_o[11], s_o[14],
             s_o[13], s_o[8],  s_o[17], s_o[16], s_o[19], s_o[18],
             s_o[21], s_o[20], s_o[23], s_o[22], s_o[6],  s_o[3],
             s_o[0],  s_o[5],  s_o[2],  s_o[7],  s_o[4],  s_o[1] ^ c};  
end

assign s_o_true[0]  = s_o[15];
assign s_o_true[1]  = s_o[10];
assign s_o_true[2]  = s_o[9];
assign s_o_true[3]  = s_o[12];
assign s_o_true[4]  = s_o[11];
assign s_o_true[5]  = s_o[14];
assign s_o_true[6]  = s_o[13];
assign s_o_true[7]  = s_o[8];
assign s_o_true[8]  = s_o[17];
assign s_o_true[9]  = s_o[16];
assign s_o_true[10] = s_o[19];
assign s_o_true[11] = s_o[18];
assign s_o_true[12] = s_o[21];
assign s_o_true[13] = s_o[20];
assign s_o_true[14] = s_o[23];
assign s_o_true[15] = s_o[22];
assign s_o_true[16] = s_o[6];
assign s_o_true[17] = s_o[3];
assign s_o_true[18] = s_o[0];
assign s_o_true[19] = s_o[5];
assign s_o_true[20] = s_o[2];
assign s_o_true[21] = s_o[7];
assign s_o_true[22] = s_o[4];
assign s_o_true[23] = s_o[1] ^ c;
endmodule
//8a80b92f4046b0b973634ee851bcc77eec0c5b1e9f1e6f38d31ff8d18d726e80a65194c0ec2c8a42a6b27b739f8a4a592f9e8d6c2b75d796285bf179484749d452c38401b625a6cfa1c6be5e8f4e68aa0fc5a6c2d4a13b484bebec615fde723282c8a6c9246355f94e599c6e7b6b079a83cb9e8b0d4eb273da84581a2dad6e36...
//
//B194BAC80A08F53B366D008E584A5DE48504FA9D1BB6C7AC252E72C202FDCE0D5BE3D61217B96181FE6786AD716B890B5CB0C0FF33C356B835C405AED8E07F99E12BDC1AE28257EC703FCCF095EE8DF1C1AB76389FE678CAF7C6F860D5BB9C4FF33C657B637C306ADD4EA7799EB23D313E98B56E27D3BCCF591E181F4C5AB793E9DEE72C8F0C0FA62DDB49F46F73964706075316ED247A3739CBA38303A98BF692BD9B1CE5D141015445FBC95E4D0EF2682080AA227D642F2687F93490405511