`timescale 1ns / 1ps

module tb_sensor;

    // Inputs
    reg door_open;
    reg window_open;
    reg clk;
    reg rst;

    // Outputs
    wire alert;

    // Instantiate the Unit Under Test (UUT)
    sensor uut (
        .door_open(door_open),
        .window_open(window_open),
        .clk(clk),
        .rst(rst),
        .alert(alert)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        door_open = 0;
        window_open = 0;
        clk = 0;
        rst = 0;

        // Reset the UUT
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Test cases
        // Test case 1: Door open
        door_open = 1;
        #10;
        door_open = 0;
        #10;

        // Test case 2: Window open
        window_open = 1;
        #10;
        window_open = 0;
        #10;

        // Test case 3: Both door and window open
        door_open = 1;
        window_open = 1;
        #10;
        door_open = 0;
        window_open = 0;
        #10;

        // Test case 4: No door or window open
        #10;

        // End simulation
        $stop;
    end

endmodule
