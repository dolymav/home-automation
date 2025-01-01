module tb_smart_appliances_control;
  reg fridge_cmd, oven_cmd, coffee_maker_cmd, washer_cmd, dishwasher_cmd, clk, rst;
  wire fridge_status, oven_status, coffee_maker_status, washer_status, dishwasher_status;

  smart_appliances_control uut (
    .fridge_cmd(fridge_cmd),
    .oven_cmd(oven_cmd),
    .coffee_maker_cmd(coffee_maker_cmd),
    .washer_cmd(washer_cmd),
    .dishwasher_cmd(dishwasher_cmd),
    .clk(clk),
    .rst(rst),
    .fridge_status(fridge_status),
    .oven_status(oven_status),
    .coffee_maker_status(coffee_maker_status),
    .washer_status(washer_status),
    .dishwasher_status(dishwasher_status)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1; fridge_cmd = 0; oven_cmd = 0; coffee_maker_cmd = 0; washer_cmd = 0; dishwasher_cmd = 0;
    #10 rst = 0;
    #10 fridge_cmd = 1; oven_cmd = 1; coffee_maker_cmd = 1; washer_cmd = 1; dishwasher_cmd = 1;
    #10 fridge_cmd = 0; oven_cmd = 0; coffee_maker_cmd = 0; washer_cmd = 0; dishwasher_cmd = 0;
    #10 $finish;
  end
endmodule
