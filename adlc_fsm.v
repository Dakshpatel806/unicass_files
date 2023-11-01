module LDO_FSM (
  input wire clk,
  input wire rst,
  input wire load_change,
  input wire load_current,
  output wire coarse_loop,
  output wire medium_loop,
  output wire fine_loop
);

parameter FSM_STATE_START = 2'b00;
parameter FSM_STATE_COARSE_LOOP = 2'b01;
parameter FSM_STATE_MEDIUM_LOOP = 4'b10;
parameter FSM_STATE_FINE_LOOP = 8'b11;

reg [1:0] current_state, next_state;

always @* begin
  if (rst) begin
    current_state = FSM_STATE_START;
  end else begin
    current_state = next_state;
  end
end

always @(posedge clk) begin
  case (current_state)
    FSM_STATE_START:
      if (load_change) begin
        next_state = FSM_STATE_COARSE_LOOP;
      end else begin
        next_state = FSM_STATE_START;
      end
    FSM_STATE_COARSE_LOOP:
      if (load_change) begin
        next_state = FSM_STATE_START;
      end else if (load_current < threshold_coarse) begin
        next_state = FSM_STATE_COARSE_LOOP;
      end else if (load_current < threshold_medium) begin
        next_state = FSM_STATE_MEDIUM_LOOP;
      end else begin
        next_state = FSM_STATE_FINE_LOOP;
      end
    FSM_STATE_MEDIUM_LOOP:
      // Similar logic as COARSE_LOOP_STATE
      if (load_change) begin
        next_state = FSM_STATE_START;
      end else if (load_current < threshold_coarse) begin
        next_state = FSM_STATE_COARSE_LOOP;
      end else if (load_current < threshold_medium) begin
        next_state = FSM_STATE_MEDIUM_LOOP;
      end else begin
        next_state = FSM_STATE_FINE_LOOP;
      end
    FSM_STATE_FINE_LOOP:
      // Similar logic as COARSE_LOOP_STATE
      if (load_change) begin
        next_state = FSM_STATE_START;
      end else if (load_current < threshold_coarse) begin
        next_state = FSM_STATE_COARSE_LOOP;
      end else if (load_current < threshold_medium) begin
        next_state = FSM_STATE_MEDIUM_LOOP;
      end else begin
        next_state = FSM_STATE_FINE_LOOP;
      end
    default:
      next_state = FSM_STATE_START;
  endcase
end

assign coarse_loop = (current_state == FSM_STATE_COARSE_LOOP);
assign medium_loop = (current_state == FSM_STATE_MEDIUM_LOOP);
assign fine_loop = (current_state == FSM_STATE_FINE_LOOP);

endmodule
