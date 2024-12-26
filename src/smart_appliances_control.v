module smart_appliances_control(
    input wire fridge_cmd,        
    input wire oven_cmd,          
    input wire coffee_maker_cmd,  
    input wire washer_cmd,       
    input wire dishwasher_cmd,    
    input wire clk,               
    input wire rst,               
    output reg fridge_status,     
    output reg oven_status,       
    output reg coffee_maker_status,
    output reg washer_status,     
    output reg dishwasher_status  
);

reg OFF =0;
reg ON = 1;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        fridge_status <= OFF;     
        oven_status <= OFF;
        coffee_maker_status <= OFF;
        washer_status <= OFF;
        dishwasher_status <= OFF;
    end else begin
        fridge_status <= fridge_cmd;          
        oven_status <= oven_cmd;              
        coffee_maker_status <= coffee_maker_cmd;
        washer_status <= washer_cmd;          
        dishwasher_status <= dishwasher_cmd;  
    end
end

endmodule
