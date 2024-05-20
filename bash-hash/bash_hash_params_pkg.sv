package bash_hash_params_pkg;

// AXI4-Lite controller 
  localparam XLEN            = 32;
  localparam ADDRLEN         = 16;

  localparam L_ADDR          = 8'hC0;
  localparam PREP_ADDR       = 8'hC4;
  localparam START_ADDR      = 8'hC8;
  localparam RDY_ACTIVE_ADDR = 8'hCC;

// Bash-Hash
  localparam SLEN = 64;

// Bash-S 
  localparam logic [5:0] M1_BASH_S [0:7] = {6'd8,  6'd56, 6'd8,  6'd56, 6'd8,  6'd56, 6'd8,  6'd56};
  localparam logic [5:0] N1_BASH_S [0:7] = {6'd53, 6'd51, 6'd37, 6'd3,  6'd21, 6'd19, 6'd5,  6'd35};
  localparam logic [5:0] M2_BASH_S [0:7] = {6'd14, 6'd34, 6'd46, 6'd2,  6'd14, 6'd34, 6'd46, 6'd2};
  localparam logic [5:0] N2_BASH_S [0:7] = {6'd1,  6'd7,  6'd49, 6'd23, 6'd33, 6'd39, 6'd17, 6'd55};

// Bash-F
  localparam [63:0] BASH_F_CONST = 64'hAED8E07F99E12BDC;
  localparam [63:0] BASH_F_INIT  = 64'hB194BAC80A08F53B;

endpackage : bash_hash_params_pkg