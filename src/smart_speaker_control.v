module smart_speaker_control(
    input wire voice_command,    
    input wire clk,              
    input wire rst,             
    output reg [3:0] device_state 
);

reg LIGHTS_ON =0;
reg APPLIANCES_ON =0;
reg DEVICES_OFF =0;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        device_state <= DEVICES_OFF; 
    end else begin
        case (voice_command)
            1'b11: device_state <= LIGHTS_ON;      
            1'10: device_state <= APPLIANCES_ON;  
            1'b00: device_state <= DEVICES_OFF;    
            default: device_state <= DEVICES_OFF; 
        endcase
    end
end

endmodule
