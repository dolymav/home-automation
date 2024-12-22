module sensor (
    input wire door_open,
    input wire window_open,
    input wire clk,
    input wire rst,
    output reg alert
);

    // Define states for alert
    parameter NO_ALERT = 1'b0;
    parameter ALERT = 1'b1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            alert <= NO_ALERT; // Reset alert signal
        end else begin
            if (door_open || window_open) begin
                alert <= ALERT; 
            end else begin
                alert <= NO_ALERT; 
            end
        end
    end
endmodule
