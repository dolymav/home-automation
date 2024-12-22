`timescale 1ns / 1ps

module tb_smart_lighting;
    reg clk;
    reg reset;
    reg motion_detected;
    reg manual_override;
    wire light_on;

    smart_lighting uut (
        .clk(clk),
        .reset(reset),
        .motion_detected(motion_detected),
        .manual_override(manual_override),
        .light_on(light_on)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; motion_detected = 0; manual_override = 0;
        #10 reset = 0; motion_detected = 1;
        #20 motion_detected = 0;
        #30 motion_detected = 1;
        #40 $stop;
    end
endmodule
