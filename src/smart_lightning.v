module smart_lighting (
    input clk,            // Clock signal
    input reset,          // Reset signal
    input motion_detected,// Motion sensor signal
    input manual_override,// Manual switch
    output reg light_on   // Light control
);
    typedef enum reg [1:0] {
        OFF = 2'b00,
        MOTION_DETECTED = 2'b01,
        LIGHT_ON = 2'b10
    } state_t;

    state_t current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= OFF;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            OFF: 
                next_state = motion_detected ? MOTION_DETECTED : OFF;
            MOTION_DETECTED: 
                next_state = LIGHT_ON;
            LIGHT_ON: 
                next_state = motion_detected ? LIGHT_ON : OFF;
            default: 
                next_state = OFF;
        endcase
    end

    always @(*) begin
        light_on = (current_state == LIGHT_ON);
    end
endmodule
