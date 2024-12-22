module motion_sensing (
    input wire clk,
    input wire reset,
    input wire motion_sensor,
    input wire manual_override,
    output reg lights_on
);

    // State definitions
    typedef enum reg [1:0] {
        IDLE,
        MOTION_DETECTED,
        TIMER_ACTIVE
    } state_t;

    state_t current_state, next_state;

    // State transition and output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            lights_on <= 0;
        end else begin
            current_state <= next_state;
            case (current_state)
                IDLE: if (motion_sensor) next_state <= MOTION_DETECTED;
                MOTION_DETECTED: begin
                    lights_on <= 1;
                    next_state <= TIMER_ACTIVE;
                end
                TIMER_ACTIVE: if (!motion_sensor) next_state <= IDLE;
            endcase
        end
    end

    // Timer logic (simple example using a counter)
    reg [31:0] timer;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            timer <= 0;
        end else if (current_state == TIMER_ACTIVE) begin
            timer <= timer + 1;
            if (timer == 1000000) begin // Adjust value for desired timeout
                lights_on <= 0;
                next_state <= IDLE;
                timer <= 0;
            end
        end else begin
            timer <= 0;
        end
    end

endmodule
