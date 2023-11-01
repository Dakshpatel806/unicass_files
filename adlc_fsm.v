// Code your design here
module LDO_FSM (
    input wire clk,            // Clock input
    input wire rst,            // Reset input
    input wire load_change,    // Load Change input
    input wire dither_enable,  // Dithering Enable input
    input wire load_current,   // Load current input
    output wire coarse_loop,   // Coarse Loop control signal
    output wire medium_loop,   // Medium Loop control signal
    output wire fine_loop,     // Fine Loop control signal
    output wire steady_state   // Steady State control signal
);

// Define FSM states
typedef enum logic [1:0] {
    START_STATE = 2'b00,
  COARSE_LOOP_STATE = 2'b01,
  MEDIUM_LOOP_STATE = 4'b10,
  FINE_LOOP_STATE = 8'b11,
  STEADY_STATE = 2'b10
} fsm_state_t;

// Define FSM registers
reg [1:0] current_state, next_state;

// FSM state transition and output logic
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        current_state <= START_STATE;
    end else begin
        current_state <= next_state;
    end
end

always_ff @(posedge clk) begin
    case (current_state)
        START_STATE:
            if (load_change) begin
                next_state = COARSE_LOOP_STATE;
            end else if (dither_enable) begin
                next_state = STEADY_STATE;
            end else begin
                next_state = START_STATE;
            end
        COARSE_LOOP_STATE:
            if (load_change) begin
                next_state = START_STATE;
            end else if (load_current < threshold_coarse) begin
                next_state = COARSE_LOOP_STATE;
            end else if (load_current < threshold_medium) begin
                next_state = MEDIUM_LOOP_STATE;
            end else begin
                next_state = FINE_LOOP_STATE;
            end
        MEDIUM_LOOP_STATE:
            // Similar logic as COARSE_LOOP_STATE
           if (load_change) begin
                next_state = START_STATE;
            end else if (load_current < threshold_coarse) begin
                next_state = COARSE_LOOP_STATE;
            end else if (load_current < threshold_medium) begin
                next_state = MEDIUM_LOOP_STATE;
            end else begin
                next_state = FINE_LOOP_STATE;
            end
        FINE_LOOP_STATE:
            // Similar logic as COARSE_LOOP_STATE
           if (load_change) begin
                next_state = START_STATE;
            end else if (load_current < threshold_coarse) begin
                next_state = COARSE_LOOP_STATE;
            end else if (load_current < threshold_medium) begin
                next_state = MEDIUM_LOOP_STATE;
            end else begin
                next_state = FINE_LOOP_STATE;
            end
        STEADY_STATE:
            if (load_change) begin
                next_state = START_STATE;
            end else if (!dither_enable) begin
                next_state = COARSE_LOOP_STATE;
            end else begin
                next_state = STEADY_STATE;
            end
        default:
            next_state = START_STATE;
    endcase
end

// Output control signals based on FSM state
assign coarse_loop = (current_state == COARSE_LOOP_STATE);
assign medium_loop = (current_state == MEDIUM_LOOP_STATE);
assign fine_loop = (current_state == FINE_LOOP_STATE);
assign steady_state = (current_state == STEADY_STATE);

endmodule
