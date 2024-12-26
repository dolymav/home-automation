module robot_vacuum_scheduler(
    input wire [4:0] hour,        
    input wire [5:0] minute,      
    input wire enable,            
    input wire clk,               
    input wire rst,               
    output reg start_cleaning     
);

reg [4:0] scheduled_hour = 5'd10; 
reg [5:0] scheduled_minute = 6'd0; 

always @(posedge clk or posedge rst) begin
    if (rst) begin
        start_cleaning <= 1'b0;   
    end else if (enable) begin
        if (hour == scheduled_hour && minute == scheduled_minute) begin
            start_cleaning <= 1'b1; 
        end else begin
            start_cleaning <= 1'b0; 
        end
    end else begin
        start_cleaning <= 1'b0;   
    end
end

endmodule
