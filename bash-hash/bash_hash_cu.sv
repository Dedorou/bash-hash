module bash_hash_cu (
input  logic clk_i,
input  logic rst_i,

input  logic prep_active_i,
input  logic start_active_i,

output logic prep_o,
output logic start_o,
output logic work_o,
output logic first_o,

output logic active_o,
output logic rdy_o
);
 
logic [4:0] cnt;
logic       set_cnt;

always_ff @(posedge clk_i) begin 
  if (set_cnt | rst_i) begin 
    cnt <= 5'd22;
  end else if (work_o) begin 
    cnt <= cnt - 1;
  end
end 

typedef enum {
  IDLE,
  PREP,
  START,
  WORK, 
  WAIT
} states;

states state, next_state;

always_ff @(posedge clk_i) begin
  if (rst_i) begin
    state <= IDLE;
  end
  else begin
    state <= next_state;
  end
end

always_comb begin
  case (state)
    IDLE : begin
      start_o  = 0;
      work_o   = 0;
      first_o  = 0;
      active_o = 0;
      set_cnt  = 0;
      if (prep_active_i) begin 
        rdy_o    = 1;
        prep_o   = 1;
        
        next_state = PREP;
      end else begin 
        rdy_o    = 0; 
        prep_o   = 0;
        
        next_state = IDLE;
      end
    end
    PREP : begin 
      prep_o   = 0;
      work_o   = 0;
      active_o = 0;
      rdy_o    = 1;
      set_cnt  = 0;
      if (start_active_i) begin 
        start_o = 1;
        first_o = 1;
        
        next_state = START;
      end else begin  
        if (prep_active_i) begin 
          prep_o = 1;
        end
        start_o = 0;
        first_o = 0;
        
        next_state = PREP;
      end
    end
    START : begin
      prep_o   = 0;
      start_o  = 0;
      first_o  = 0;
      work_o   = 1;
      active_o = 1;
      rdy_o    = 0;
      set_cnt  = 1;
      
      next_state = WORK;
    end 
    WORK : begin 
      prep_o   = 0;
      first_o  = 0;
      start_o  = 0;
      work_o   = 1;
      active_o = 1;
      rdy_o    = 0;
      set_cnt  = 0;
      if (prep_active_i) begin 
        prep_o     = 1;
        
        next_state = PREP;
      end else if (cnt == 5'b0) begin 
        next_state = WAIT;
      end else begin 
        next_state = WORK;
      end  
    end
    WAIT : begin 
      prep_o   = 0;
      first_o  = 0;
      start_o  = 0;
      work_o   = 0;
      active_o = 0;
      rdy_o    = 1;
      set_cnt  = 0;
      if (prep_active_i) begin 
        prep_o     = 1;
        
        next_state = PREP;
      end else if (start_active_i) begin 
        start_o    = 1;
        
        next_state = START;
      end else begin 
        next_state = WAIT;
      end
    end
    default: begin
      prep_o   = 0;
      start_o  = 0;
      work_o   = 0;
      first_o  = 0;
      active_o = 0;
      rdy_o    = 0;
      set_cnt  = 0;
      
      next_state = IDLE;
    end
  endcase
end

endmodule