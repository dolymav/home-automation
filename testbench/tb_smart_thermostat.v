`timescale 1ns / 1ps

module tb_smart_thermostat;
    reg clk;
    reg reset;
    reg [7:0] current_temp;
    reg [7:0] set_temp;
    reg [7:0] margin;
    wire heating;
    wire cooling;

    smart_thermostat uut (
        .clk(clk),
        .reset(reset),
        .current_temp(current_temp),
        .set_temp(set_temp),
        .margin(margin),
        .heating(heating),
        .cooling(cooling)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        current_temp = 20;
        set_temp = 22;
        margin = 2;

        #10 reset = 0;
        #20 current_temp = 18;
        #30 current_temp = 22;
        #40 current_temp = 24;
        #50 current_temp = 22;
        #60 $stop;
    end
endmodule
