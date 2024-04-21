module reg_map 
  import bash_hash_params_pkg::*;
(
  input  logic                 clk_i,
  input  logic                 rst_i,
  input  logic                 en_i,
  input  logic [3:0]           we_i,
  input  logic [ADDRLEN-1:0]   addr_i,
  input  logic [XLEN-1:0]      wrdata_i, 
  output logic [XLEN-1:0]      rddata_o,
    
  input  logic                 active_i,
  input  logic                 rdy_i,
  output logic                 prep_o,
  output logic                 start_o,
 
  output logic [XLEN-1:0]      l_reg_o,
  output logic [(XLEN*32)-1:0] x_reg_o,
  input  logic [(XLEN*16)-1:0] y_reg_i  
);

logic [XLEN-1:0] x_reg [0:31];
logic [XLEN-1:0] y_reg [0:15];
logic [XLEN-1:0] l_reg;

always_ff @(posedge clk_i) begin
  if (!addr_i[7] & (&we_i) & en_i) begin 
    x_reg[addr_i[6:2]] <= wrdata_i;
  end
end

always_ff @(posedge clk_i) begin 
  if ((addr_i == L_ADDR) & (&we_i) & en_i)
    l_reg <= wrdata_i;
end

assign prep_o  = (addr_i == PREP_ADDR)  & (|we_i) & en_i;
assign start_o = (addr_i == START_ADDR) & (|we_i) & en_i;

assign rddata_o = y_reg[addr_i[5:2]]                   & {XLEN{addr_i[7]  & !addr_i[6] & en_i}}
                | x_reg[addr_i[6:2]]                   & {XLEN{!addr_i[7]              & en_i}}
                | l_reg                                & {XLEN{addr_i==L_ADDR          & en_i}}
                | {{XLEN/2{active_i}},{XLEN/2{rdy_i}}} & {XLEN{addr_i==RDY_ACTIVE_ADDR & en_i}};

generate
  for (genvar i=0; i<32; i=i+1) begin 
    assign x_reg_o[i*XLEN +: XLEN] = x_reg[i];
  end
  for (genvar j=0; j<16; j=j+1) begin 
    assign y_reg[j] = y_reg_i[j*XLEN +: XLEN];
  end
endgenerate

endmodule