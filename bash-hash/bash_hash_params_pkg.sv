package bash_hash_params_pkg;

// AXI4-Lite controller 
  localparam XLEN    = 32;
  localparam ADDRLEN = 6;

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

  logic [SLEN-1:0] bash_f_ff_0;
logic [SLEN-1:0] bash_f_ff_1;
logic [SLEN-1:0] bash_f_ff_2;
logic [SLEN-1:0] bash_f_ff_3;
logic [SLEN-1:0] bash_f_ff_4;
logic [SLEN-1:0] bash_f_ff_5;
logic [SLEN-1:0] bash_f_ff_6;
logic [SLEN-1:0] bash_f_ff_7;
logic [SLEN-1:0] bash_f_ff_8;
logic [SLEN-1:0] bash_f_ff_9;
logic [SLEN-1:0] bash_f_ff_10;
logic [SLEN-1:0] bash_f_ff_11;
logic [SLEN-1:0] bash_f_ff_12;
logic [SLEN-1:0] bash_f_ff_13;
logic [SLEN-1:0] bash_f_ff_14;
logic [SLEN-1:0] bash_f_ff_15;
logic [SLEN-1:0] bash_f_ff_16;
logic [SLEN-1:0] bash_f_ff_17;
logic [SLEN-1:0] bash_f_ff_18;
logic [SLEN-1:0] bash_f_ff_19;
logic [SLEN-1:0] bash_f_ff_20;
logic [SLEN-1:0] bash_f_ff_21;
logic [SLEN-1:0] bash_f_ff_22;
logic [SLEN-1:0] bash_f_ff_23;


endpackage : bash_hash_params_pkg