`timescale 1ns / 1ps

module smart_camera_tb;

    // Inputs
    reg motion_detected;
    reg remote_control;
    reg clk;
    reg rst;

    // Outputs
    wire [1:0] camera_angle;

    // Instantiate the Unit Under Test (UUT)
    smart_camera uut (
        .motion_detected(motion_detected),
        .remote_control(remote_control),
        .clk(clk),
        .rst(rst),
        .camera_angle(camera_angle)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        motion_detected = 0;
        remote_control = 0;
        clk = 0;
        rst = 0;

        // Reset the UUT
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Test cases
        // Test case 1: Motion detected
        motion_detected = 1;
        #10;
        motion_detected = 0;
        #10;

        // Test case 2: Remote control activated
        remote_control = 1;
        #10;
        remote_control = 0;
        #10;

        // Test case 3: No motion or remote control
        #10;

        // End simulation
        $stop;
    end

endmodule
