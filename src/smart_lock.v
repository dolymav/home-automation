module smart_lock (
    input wire [3:0] keypad,
    input wire remote_unlock,
    input wire remote_lock,
    input wire [3:0] temp_access_code,
    input wire clk,
    input wire rst,
    output reg lock_state
);

    parameter locked = 1'b0;
    parameter unlocked = 1'b1;
    parameter main_access_code = 4'b1010;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            lock_state <= locked;
        end else begin
            if (remote_unlock) begin
                lock_state <= unlocked;
            end else if (remote_lock) begin
                lock_state <= locked;
            end else if (keypad == main_access_code || keypad == temp_access_code) begin
                lock_state <= unlocked;
            end else begin
                lock_state <= locked;
            end
        end
    end
endmodule
