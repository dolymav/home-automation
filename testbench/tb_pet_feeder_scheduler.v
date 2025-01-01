module tb_pet_feeder_scheduler;
  reg [4:0] hour;
  reg [5:0] minute;
  reg enable, clk, rst;
  wire dispense_food;

  pet_feeder_scheduler uut (
    .hour(hour),
    .minute(minute),
    .enable(enable),
    .clk(clk),
    .rst(rst),
    .dispense_food(dispense_food)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1; enable = 0; hour = 0; minute = 0;
    #10 rst = 0;
    #10 enable = 1; hour = 7; minute = 30;
    #20 enable = 0;
    #10 hour = 8; minute = 0;
    #10 $finish;
  end
endmodule
