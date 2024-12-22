`timescale 1ns / 1ps

module tb_window_blinds_automation;

    // Inputs
    reg [7:0] light_level;
    reg open_signal;
    reg close_signal;
    reg clk;
    reg rst;

    // Outputs
    wire blinds_open;

    // Instantiate the Unit Under Test (UUT)
    window_blinds_automation uut (
        .light_level(light_level),
        .open_signal(open_signal),
        .close_signal(close_signal),
        .clk(clk),
        .rst(rst),
        .blinds_open(blinds_open)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        light_level = 0;
        open_signal = 0;
        close_signal = 0;
        clk = 0;
        rst = 0;

        // Reset the UUT
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Test cases
        // Test case 1: Open blinds with signal
        open_signal = 1;
        #10;
        open_signal = 0;
        #10;

        // Test case 2: Close blinds with signal
        close_signal = 1;
        #10;
        close_signal = 0;
        #10;

        // Test case 3: Light level above threshold
        light_level = 150;
        #10;
        
        // Test case 4: Light level below threshold
        light_level = 100;
        #10;

        // End simulation
        $stop;
    end

endmodule
