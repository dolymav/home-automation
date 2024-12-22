module smart_thermostat (
    input wire clk,
    input wire reset,
    input wire [7:0] current_temp,
    input wire [7:0] set_temp,
    input wire [7:0] margin,
    output reg heating,
    output reg cooling
);

    typedef enum reg [1:0] {
        IDLE,
        HEATING,
        COOLING
    } state_t;

    state_t current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            heating <= 0;
            cooling <= 0;
        end else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        next_state = current_state;
        case (current_state)
            IDLE: begin
                heating = 0;
                cooling = 0;
                if (current_temp < set_temp - margin) begin
                    next_state = HEATING;
                end else if (current_temp > set_temp + margin) begin
                    next_state = COOLING;
                end
            end
            HEATING: begin
                heating = 1;
                cooling = 0;
                if (current_temp >= set_temp) begin
                    next_state = IDLE;
                end
            end
            COOLING: begin
                heating = 0;
                cooling = 1;
                if (current_temp <= set_temp) begin
                    next_state = IDLE;
                end
            end
        endcase
    end

endmodule
