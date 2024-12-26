module security_alert(
    input wire intruder_detected,  
    input wire system_compromised, 
    input wire clk,                
    input wire rst,                
    output reg app_alert,          
    output reg email_alert,        
    output reg sms_alert           
);

reg NO_ALERT =0;
reg ALERT =0;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        app_alert <= NO_ALERT;    
        email_alert <= NO_ALERT;
        sms_alert <= NO_ALERT;
    end else begin
        if (intruder_detected || system_compromised) begin
            app_alert <= ALERT;   
            email_alert <= ALERT;
            sms_alert <= ALERT;
        end else begin
            app_alert <= NO_ALERT; 
            email_alert <= NO_ALERT;
            sms_alert <= NO_ALERT;
        end
    end
end

endmodule
