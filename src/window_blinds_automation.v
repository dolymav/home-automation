module window_blinds_automation (
    input wire [7:0] light_level,
    input wire open_signal,
    input wire close_signal,
    input wire clk,
    input wire rst,
    output reg blinds_open
);

    parameter LIGHT_THRESHOLD = 128;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            blinds_open <= 0;
        end else begin
            if (open_signal) begin
                blinds_open <= 1;
            end else if (close_signal) begin
                blinds_open <= 0;
            end else if (light_level > LIGHT_THRESHOLD) begin
                blinds_open <= 1;
            end else begin
                blinds_open <= 0;
            end
        end
    end
endmodule
