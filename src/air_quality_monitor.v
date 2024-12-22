module air_quality_monitor (
    input wire [7:0] air_quality,
    input wire clk,
    input wire rst,
    output reg purifier,
    output reg humidifier
);

    parameter PURIFIER_num = 100;
    parameter HUMIDIFIER_num = 30;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            purifier <= 0;
            humidifier <= 0;
        end else begin
            if (air_quality > PURIFIER_num) begin
                purifier <= 1;
            end else begin
                purifier <= 0;
            end
            if (air_quality < HUMIDIFIER_num) begin
                humidifier <= 1;
            end else begin
                humidifier <= 0;
            end
        end
    end
endmodule
