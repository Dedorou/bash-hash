module top 
  import bash_hash_params_pkg::*;
(
  input  logic               s_axi_aclk,
  input  logic               s_axi_aresetn,
  
  input  logic [ADDRLEN-1:0] s_axi_awaddr,
  input  logic [2:0]         s_axi_awprot,
  input  logic               s_axi_awvalid,
  output logic               s_axi_awready,
             
  input  logic [XLEN-1:0]    s_axi_wdata,
  input  logic [3:0]         s_axi_wstrb,
  input  logic               s_axi_wvalid,
  output logic               s_axi_wready,
             
  output logic [1:0]         s_axi_bresp,
  output logic               s_axi_bvalid,
  input  logic               s_axi_bready,
             
  input  logic [ADDRLEN-1:0] s_axi_araddr,
  input  logic [2:0]         s_axi_arprot,
  input  logic               s_axi_arvalid,
  output logic               s_axi_arready,
             
  output logic [XLEN-1:0]    s_axi_rdata,
  output logic [1:0]         s_axi_rresp,
  output logic               s_axi_rvalid,
  input  logic               s_axi_rready
);

logic               clk;
logic               rst;
logic               axi2regmap_en;
logic [3:0]         axi2regmap_we;
logic [ADDRLEN-1:0] axi2regmap_addr;
logic [XLEN-1:0]    axi2regmap_wrdata;
logic [XLEN-1:0]    axi2regmap_rddata;

logic [XLEN-1:0]    regmap2hash_l;

logic [SLEN-1:0]    regmap2hash_x0;
logic [SLEN-1:0]    regmap2hash_x1;
logic [SLEN-1:0]    regmap2hash_x2;
logic [SLEN-1:0]    regmap2hash_x3;
logic [SLEN-1:0]    regmap2hash_x4;
logic [SLEN-1:0]    regmap2hash_x5;
logic [SLEN-1:0]    regmap2hash_x6;
logic [SLEN-1:0]    regmap2hash_x7;
logic [SLEN-1:0]    regmap2hash_x8;
logic [SLEN-1:0]    regmap2hash_x9;
logic [SLEN-1:0]    regmap2hash_x10;
logic [SLEN-1:0]    regmap2hash_x11;
logic [SLEN-1:0]    regmap2hash_x12;
logic [SLEN-1:0]    regmap2hash_x13;
logic [SLEN-1:0]    regmap2hash_x14;
logic [SLEN-1:0]    regmap2hash_x15;

logic [SLEN-1:0]    hash2regmap_y0;
logic [SLEN-1:0]    hash2regmap_y1;
logic [SLEN-1:0]    hash2regmap_y2;
logic [SLEN-1:0]    hash2regmap_y3;
logic [SLEN-1:0]    hash2regmap_y4;
logic [SLEN-1:0]    hash2regmap_y5;
logic [SLEN-1:0]    hash2regmap_y6;
logic [SLEN-1:0]    hash2regmap_y7;

logic [(SLEN*16)-1:0] regmap2hash_x;
logic [(SLEN*8)-1:0]  hash2regmap_y;

logic cu2hash_prep;
logic cu2hash_start;
logic cu2hash_work;
logic cu2hash_first;
logic cu2regmap_active;
logic cu2regmap_rdy;
logic regmap2cu_prep;
logic regmap2cu_start;

assign regmap2hash_x0  = {regmap2hash_x[(XLEN*1)+:XLEN],  regmap2hash_x[(XLEN*0)+:XLEN]};
assign regmap2hash_x1  = {regmap2hash_x[(XLEN*3)+:XLEN],  regmap2hash_x[(XLEN*2)+:XLEN]};
assign regmap2hash_x2  = {regmap2hash_x[(XLEN*5)+:XLEN],  regmap2hash_x[(XLEN*4)+:XLEN]};
assign regmap2hash_x3  = {regmap2hash_x[(XLEN*7)+:XLEN],  regmap2hash_x[(XLEN*6)+:XLEN]};
assign regmap2hash_x4  = {regmap2hash_x[(XLEN*9)+:XLEN],  regmap2hash_x[(XLEN*8)+:XLEN]};
assign regmap2hash_x5  = {regmap2hash_x[(XLEN*11)+:XLEN], regmap2hash_x[(XLEN*10)+:XLEN]};
assign regmap2hash_x6  = {regmap2hash_x[(XLEN*13)+:XLEN], regmap2hash_x[(XLEN*12)+:XLEN]};
assign regmap2hash_x7  = {regmap2hash_x[(XLEN*15)+:XLEN], regmap2hash_x[(XLEN*14)+:XLEN]};
assign regmap2hash_x8  = {regmap2hash_x[(XLEN*17)+:XLEN], regmap2hash_x[(XLEN*16)+:XLEN]};
assign regmap2hash_x9  = {regmap2hash_x[(XLEN*19)+:XLEN], regmap2hash_x[(XLEN*18)+:XLEN]};
assign regmap2hash_x10 = {regmap2hash_x[(XLEN*21)+:XLEN], regmap2hash_x[(XLEN*20)+:XLEN]};
assign regmap2hash_x11 = {regmap2hash_x[(XLEN*23)+:XLEN], regmap2hash_x[(XLEN*22)+:XLEN]};
assign regmap2hash_x12 = {regmap2hash_x[(XLEN*25)+:XLEN], regmap2hash_x[(XLEN*24)+:XLEN]};
assign regmap2hash_x13 = {regmap2hash_x[(XLEN*27)+:XLEN], regmap2hash_x[(XLEN*26)+:XLEN]};
assign regmap2hash_x14 = {regmap2hash_x[(XLEN*29)+:XLEN], regmap2hash_x[(XLEN*28)+:XLEN]};
assign regmap2hash_x15 = {regmap2hash_x[(XLEN*31)+:XLEN], regmap2hash_x[(XLEN*30)+:XLEN]};

assign hash2regmap_y = {hash2regmap_y0, hash2regmap_y1, hash2regmap_y2, hash2regmap_y3,
                        hash2regmap_y4, hash2regmap_y5, hash2regmap_y6, hash2regmap_y7};

axi4_lite_slave_ctrl axi4_lite_slave_ctrl (
  .s_axi_aclk    (s_axi_aclk),
  .s_axi_aresetn (s_axi_aresetn),
  .s_axi_awaddr  (s_axi_awaddr),
  .s_axi_awprot  (s_axi_awprot),
  .s_axi_awvalid (s_axi_awvalid),
  .s_axi_awready (s_axi_awready),     
  .s_axi_wdata   (s_axi_wdata),
  .s_axi_wstrb   (s_axi_wstrb),
  .s_axi_wvalid  (s_axi_wvalid),
  .s_axi_wready  (s_axi_wready),      
  .s_axi_bresp   (s_axi_bresp),
  .s_axi_bvalid  (s_axi_bvalid),
  .s_axi_bready  (s_axi_bready),        
  .s_axi_araddr  (s_axi_araddr),
  .s_axi_arprot  (s_axi_arprot),
  .s_axi_arvalid (s_axi_arvalid),
  .s_axi_arready (s_axi_arready),    
  .s_axi_rdata   (s_axi_rdata),
  .s_axi_rresp   (s_axi_rresp),
  .s_axi_rvalid  (s_axi_rvalid),
  .s_axi_rready  (s_axi_rready),
  .bram_clk_a    (clk),
  .bram_rst_a    (rst),
  .bram_en_a     (axi2regmap_en),
  .bram_we_a     (axi2regmap_we),
  .bram_addr_a   (axi2regmap_addr),
  .bram_wrdata_a (axi2regmap_wrdata), 
  .bram_rddata_a (axi2regmap_rddata) 
);

bash_hash_cu bash_hash_cu (
  .clk_i         (clk),
  .rst_i         (rst),
  .prep_active_i (regmap2cu_prep),
  .start_active_i(regmap2cu_start),
  .prep_o        (cu2hash_prep), 
  .start_o       (cu2hash_start),
  .work_o        (cu2hash_work),
  .first_o       (cu2hash_first),
  .active_o      (cu2regmap_active),
  .rdy_o         (cu2regmap_rdy)
);

bash_hash bash_hash(
  .clk_i   (clk),
  .prep_i  (cu2hash_prep),
  .start_i (cu2hash_start),
  .work_i  (cu2hash_work),
  .first_i (cu2hash_first),
  .l_i     (regmap2hash_l),
  .x0_i    (regmap2hash_x0),
  .x1_i    (regmap2hash_x1),
  .x2_i    (regmap2hash_x2),
  .x3_i    (regmap2hash_x3),
  .x4_i    (regmap2hash_x4),
  .x5_i    (regmap2hash_x5),
  .x6_i    (regmap2hash_x6),
  .x7_i    (regmap2hash_x7),
  .x8_i    (regmap2hash_x8),
  .x9_i    (regmap2hash_x9),
  .x10_i   (regmap2hash_x10),
  .x11_i   (regmap2hash_x11),
  .x12_i   (regmap2hash_x12),
  .x13_i   (regmap2hash_x13),
  .x14_i   (regmap2hash_x14),
  .x15_i   (regmap2hash_x15),
  .y0_o    (hash2regmap_y0),
  .y1_o    (hash2regmap_y1),
  .y2_o    (hash2regmap_y2),
  .y3_o    (hash2regmap_y3),
  .y4_o    (hash2regmap_y4),
  .y5_o    (hash2regmap_y5),
  .y6_o    (hash2regmap_y6),
  .y7_o    (hash2regmap_y7)
);

reg_map reg_map (
  .clk_i    (clk),
  .rst_i    (rst),
  .en_i     (axi2regmap_en),
  .we_i     (axi2regmap_we),
  .addr_i   (axi2regmap_addr),
  .wrdata_i (axi2regmap_wrdata), 
  .rddata_o (axi2regmap_rddata),
  .active_i (cu2regmap_active),
  .rdy_i    (cu2regmap_rdy),
  .prep_o   (regmap2cu_prep),
  .start_o  (regmap2cu_start),
  .x_reg_o  (regmap2hash_x),
  .l_reg_o  (regmap2hash_l),
  .y_reg_i  (hash2regmap_y)  
);

endmodule


//{regmap2hash_x[(XLEN*30)+:XLEN], regmap2hash_x[(XLEN*31)+:XLEN]};
//{regmap2hash_x[(XLEN*28)+:XLEN], regmap2hash_x[(XLEN*29)+:XLEN]};
//{regmap2hash_x[(XLEN*26)+:XLEN], regmap2hash_x[(XLEN*27)+:XLEN]};
//{regmap2hash_x[(XLEN*24)+:XLEN], regmap2hash_x[(XLEN*25)+:XLEN]};
//{regmap2hash_x[(XLEN*22)+:XLEN], regmap2hash_x[(XLEN*23)+:XLEN]};
//{regmap2hash_x[(XLEN*20)+:XLEN], regmap2hash_x[(XLEN*21)+:XLEN]};
//{regmap2hash_x[(XLEN*18)+:XLEN], regmap2hash_x[(XLEN*19)+:XLEN]};
//{regmap2hash_x[(XLEN*16)+:XLEN], regmap2hash_x[(XLEN*17)+:XLEN]};
//{regmap2hash_x[(XLEN*14)+:XLEN], regmap2hash_x[(XLEN*15)+:XLEN]};
//{regmap2hash_x[(XLEN*12)+:XLEN], regmap2hash_x[(XLEN*13)+:XLEN]};
//{regmap2hash_x[(XLEN*10)+:XLEN], regmap2hash_x[(XLEN*11)+:XLEN]};
//{regmap2hash_x[(XLEN*8)+:XLEN],  regmap2hash_x[(XLEN*9)+:XLEN]};
//{regmap2hash_x[(XLEN*6)+:XLEN],  regmap2hash_x[(XLEN*7)+:XLEN]};
//{regmap2hash_x[(XLEN*4)+:XLEN],  regmap2hash_x[(XLEN*5)+:XLEN]};
//{regmap2hash_x[(XLEN*2)+:XLEN],  regmap2hash_x[(XLEN*3)+:XLEN]};
//{regmap2hash_x[(XLEN*0)+:XLEN],  regmap2hash_x[(XLEN*1)+:XLEN]};