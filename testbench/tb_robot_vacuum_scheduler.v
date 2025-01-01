module tb_robot_vacuum_scheduler;
  reg [4:0] hour;
  reg [5:0] minute;
  reg enable, clk, rst;
  wire start_cleaning;

  robot_vacuum_scheduler uut (
    .hour(hour),
    .minute(minute),
    .enable(enable),
    .clk(clk),
    .rst(rst),
    .start_cleaning(start_cleaning)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1; enable = 0; hour = 0; minute = 0;
    #10 rst = 0;
    #10 enable = 1; hour = 10; minute = 0;
    #20 enable = 0;
    #10 hour = 11; minute = 0;
    #10 $finish;
  end
endmodule
