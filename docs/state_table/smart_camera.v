module smart_camera (
    input wire motion_detected,
    input wire remote_control,
    input wire clk,
    input wire rst,
    output reg [1:0] camera_angle
);

    parameter stop = 2'b00;
    parameter left = 2'b01;
    parameter right = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            camera_angle <= stop;
        end else begin
            if (motion_detected) begin
                camera_angle <= left;
            end else if (remote_control) begin
                camera_angle <= right;
            end else begin
                camera_angle <= stop;
            end
        end
    end
endmodule
