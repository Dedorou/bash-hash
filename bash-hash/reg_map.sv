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
    if (rst_i) begin 
      for (integer i = 0; i < 32; i = i + 1) begin 
        x_reg[i] <= '0;
      end
    end else if (!addr_i[9] & (|we_i) & en_i) begin 
      x_reg[addr_i[8:4]] <= wrdata_i;
    end
  end

  always_ff @(posedge clk_i) begin 
    if (rst_i) begin 
      l_reg <= 0;
    end if ((addr_i[9:4] == 6'b110000) & (&we_i) & en_i)
      l_reg <= wrdata_i;
  end

  assign l_reg_o = l_reg;
  assign prep_o  = (addr_i[9:4] == 6'b110001)  & (|we_i) & en_i;
  assign start_o = (addr_i[9:4] == 6'b110010) & (|we_i)  & en_i;

  logic [XLEN-1:0] rddata_reg;

  assign rddata_reg = y_reg[addr_i[7:4]]                   & {XLEN{addr_i[9]  & !addr_i[8]}}
                    | x_reg[addr_i[8:4]]                   & {XLEN{!addr_i[9]             }}
                    | l_reg                                & {XLEN{addr_i[9:4]==6'b110000 }}
                    | {{XLEN/2{active_i}},{XLEN/2{rdy_i}}} & {XLEN{addr_i[9:4]==6'b110011}};

  always_ff @(posedge clk_i) begin 
    rddata_o <= rddata_reg;
  end

  generate
    for (genvar i=0; i<32; i=i+1) begin 
      assign x_reg_o[i*XLEN +: XLEN] = x_reg[i];
    end
    for (genvar j=0; j<16; j=j+1) begin 
      assign y_reg[j] = y_reg_i[j*XLEN +: XLEN];
    end
  endgenerate

  endmodule