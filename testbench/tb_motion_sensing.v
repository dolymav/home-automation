`timescale 1ns / 1ps

module tb_motion_sensing;
    reg clk;
    reg reset;
    reg motion_sensor;
    reg manual_override;
    wire lights_on;

    // Instantiate the motion sensing module (replace `motion_sensing` with the actual module name)
    motion_sensing uut (
        .clk(clk),
        .reset(reset),
        .motion_sensor(motion_sensor),
        .manual_override(manual_override),
        .lights_on(lights_on)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; motion_sensor = 0; manual_override = 0;
        #10 reset = 0; motion_sensor = 1;
        #20 motion_sensor = 0;
        #30 motion_sensor = 1;
        #40 $stop;
    end
endmodule
