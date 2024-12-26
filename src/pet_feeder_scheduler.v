module pet_feeder_scheduler(
    input wire [4:0] hour,        
    input wire [5:0] minute,      
    input wire enable,            
    input wire clk,               
    input wire rst,               
    output reg dispense_food      
);

reg [4:0] scheduled_hour = 5'd7;  
reg [5:0] scheduled_minute = 6'd30;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        dispense_food <= 1'b0;    
    end else if (enable) begin
        if (hour == scheduled_hour && minute == scheduled_minute) begin
            dispense_food <= 1'b1; 
        end else begin
            dispense_food <= 1'b0; 
        end
    end else begin
        dispense_food <= 1'b0;    
    end
end

endmodule
