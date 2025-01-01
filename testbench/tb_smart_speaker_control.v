module tb_smart_speaker_control;
  reg voice_command, clk, rst;
  wire [3:0] device_state;

  smart_speaker_control uut (
    .voice_command(voice_command),
    .clk(clk),
    .rst(rst),
    .device_state(device_state)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1; voice_command = 2'b00;
    #10 rst = 0;
    #10 voice_command = 2'b01;
    #10 voice_command = 2'b10;
    #10 voice_command = 2'b00;
    #10 $finish;
  end
endmodule
