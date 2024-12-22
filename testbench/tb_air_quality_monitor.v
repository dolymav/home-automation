`timescale 1ns / 1ps

module tb_air_quality_monitor;

    // Inputs
    reg [7:0] air_quality;
    reg clk;
    reg rst;

    // Outputs
    wire purifier;
    wire humidifier;

    // Instantiate the Unit Under Test (UUT)
    air_quality_monitor uut (
        .air_quality(air_quality),
        .clk(clk),
        .rst(rst),
        .purifier(purifier),
        .humidifier(humidifier)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        air_quality = 0;
        clk = 0;
        rst = 0;

        // Reset the UUT
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Test cases
        // Test case 1: air_quality below HUMIDIFIER_num
        air_quality = 20;
        #10;
        
        // Test case 2: air_quality between HUMIDIFIER_num and PURIFIER_num
        air_quality = 50;
        #10;

        // Test case 3: air_quality above PURIFIER_num
        air_quality = 120;
        #10;

        // End simulation
        $stop;
    end

endmodule
