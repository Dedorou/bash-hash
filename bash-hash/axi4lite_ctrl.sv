module axi4_lite_slave_ctrl 
  import bash_hash_params_pkg::*;
(
  input  logic                   s_axi_aclk,
  input  logic                   s_axi_aresetn,
  
  input  logic [ADDRLEN -1 : 0]  s_axi_awaddr,
  input  logic [2 : 0]           s_axi_awprot,
  input  logic                   s_axi_awvalid,
  output logic                   s_axi_awready,
             
  input  logic [31 : 0]          s_axi_wdata,
  input  logic [3 : 0]           s_axi_wstrb,
  input  logic                   s_axi_wvalid,
  output logic                   s_axi_wready,
             
  output logic [1 : 0]           s_axi_bresp,
  output logic                   s_axi_bvalid,
  input  logic                   s_axi_bready,
             
  input  logic [ADDRLEN -1 : 0]  s_axi_araddr,
  input  logic [2 : 0]           s_axi_arprot,
  input  logic                   s_axi_arvalid,
  output logic                   s_axi_arready,
             
  output logic [31 : 0]          s_axi_rdata,
  output logic [1 : 0]           s_axi_rresp,
  output logic                   s_axi_rvalid,
  input  logic                   s_axi_rready,
             
  output logic                   bram_clk_a,
  output logic                   bram_rst_a,
  output logic                   bram_en_a,
  output logic [3 : 0]           bram_we_a,
  output logic [ADDRLEN -1 : 0]  bram_addr_a,
  output logic [31 : 0]          bram_wrdata_a, 
  input  logic [31 : 0]          bram_rddata_a 
);

logic awaddr_handshake;
logic wdata_handshake;
logic araddr_handshake;

logic axi_awready;
logic axi_wready;
logic axi_bvalid;
logic axi_arready;
logic axi_rvalid;

assign bram_clk_a    = s_axi_aclk;
assign bram_rst_a    = ~s_axi_aresetn; 
assign bram_en_a     = (s_axi_arvalid & ~axi_arready) | ((s_axi_wvalid & ~axi_wready) & (~axi_awready & s_axi_awvalid));
assign bram_we_a     = s_axi_wstrb;

assign bram_addr_a   = (s_axi_arvalid) ? s_axi_araddr : s_axi_awaddr;
assign bram_wrdata_a = s_axi_wdata;
assign s_axi_rdata   = bram_rddata_a;  


//responces (always 0???)
assign s_axi_bresp = 'h0;
assign s_axi_rresp = 'h0;

//write data ready
initial axi_wready = 0;
always_ff @(posedge s_axi_aclk  ) begin
  if (~s_axi_aresetn | s_axi_wready) begin
    axi_wready <= 0;
  end else if (~s_axi_wready & s_axi_wvalid & s_axi_awvalid /*& ~s_axi_arvalid*/) begin
    axi_wready <= 1;
  end
end

assign s_axi_wready = axi_wready;

//write address ready
initial axi_awready = 0;
always_ff @(posedge s_axi_aclk  ) begin
  if (~s_axi_aresetn | s_axi_awready) begin 
    axi_awready <= 0;
  end else if (~s_axi_awready & s_axi_awvalid & s_axi_wvalid /*& ~s_axi_arvalid*/) begin 
    axi_awready <= 1;
  end
end

assign s_axi_awready = axi_awready;


always_ff @(posedge s_axi_aclk ) begin
  if (~s_axi_aresetn | (awaddr_handshake & wdata_handshake)) begin   
    awaddr_handshake <= 0;
    wdata_handshake <= 0;
  end else begin 
    if (s_axi_awvalid & s_axi_awready) begin 
      awaddr_handshake <= 1;
    end
    if (s_axi_wvalid & s_axi_wready) begin 
      wdata_handshake <= 1;
    end
  end
end

//write resp
initial axi_bvalid = 0;
always_ff @(posedge s_axi_aclk  ) begin
  if (~s_axi_aresetn | (s_axi_bvalid & s_axi_bready & awaddr_handshake & wdata_handshake)) begin 
    axi_bvalid <= 0;
  end else if (s_axi_awready & s_axi_wready) begin 
    axi_bvalid <= 1;
  end
end

assign s_axi_bvalid = axi_bvalid;


//detecting end of reset cycle 
logic axi_aresetn;
logic axi_aresetn_d = 1'b0;

always_ff @(posedge s_axi_aclk) begin
  axi_aresetn_d <= s_axi_aresetn;
end

assign axi_aresetn = (s_axi_aresetn & ~axi_aresetn_d) ? 1'b1 : 1'b0;


//read
initial axi_arready = 0;
always_ff @(posedge s_axi_aclk ) begin
  if (~s_axi_aresetn | (s_axi_arvalid & axi_arready)) begin 
    axi_arready <= 0;
  end else if (s_axi_rready | axi_aresetn) begin 
    axi_arready <= 1;
  end else begin  
    axi_arready <= axi_arready;
  end
end

assign araddr_handshake = (s_axi_arvalid & s_axi_arready);
assign s_axi_arready    = axi_arready;

initial axi_rvalid = 0;
always_ff @(posedge s_axi_aclk ) begin
  if (~s_axi_aresetn) begin 
    axi_rvalid <= 0;
  end else if (araddr_handshake) begin 
    axi_rvalid <= 1;
  end else if (s_axi_rready) begin
    axi_rvalid <= 0;
  end
end

assign s_axi_rvalid = axi_rvalid;

endmodule
