module tb_security_alert;
  reg intruder_detected, system_compromised, clk, rst;
  wire app_alert, email_alert, sms_alert;

  security_alert uut (
    .intruder_detected(intruder_detected),
    .system_compromised(system_compromised),
    .clk(clk),
    .rst(rst),
    .app_alert(app_alert),
    .email_alert(email_alert),
    .sms_alert(sms_alert)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1; intruder_detected = 0; system_compromised = 0;
    #10 rst = 0;
    #10 intruder_detected = 1;
    #10 system_compromised = 1;
    #10 intruder_detected = 0; system_compromised = 0;
    #10 $finish;
  end
endmodule
