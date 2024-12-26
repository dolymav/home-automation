//Smart Lights: Use smart switches to control lights remotely.
module SmartLightController (switch,light);
 input wire switch;
 output reg light;
    always @(*) begin
        light = switch;
    end

endmodule


//Motion Sensing: Lights automatically turn on/off based on movement in rooms or corridors.
module motion_sensor(motion_detected,clk,light,rst);
 input wire motion_detected;
   input wire clk;       
          input wire rst;   
             output reg light;
always @(posedge clk or posedge rst) begin
    if (rst) begin
        light <= 0; 
    end else begin
        if (motion_detected) begin
            light <= 1; 
        end else begin
            light <= 0; 
        end
    end
end

endmodule


//Smart Thermostat: Automate your heating and cooling systems to adjust temperature based on time of day or weather forecasts.
module smart_therm19ostat(
       time_of_day, weather_forecast, clk, rst, heating, cooling);
input wire [4:0] time_of_day; 
    input wire [7:0] weather_forecast; 
    input wire clk;              
    input wire rst;                
    output reg heating;             
    output reg cooling;    

parameter HEAT =19 ; 
parameter COOL = 25; 

always @(posedge clk or posedge rst) begin
    if (rst) begin
        heating <= 0; 
        cooling <= 0;
    end else begin
        if (time_of_day >= 6 && time_of_day <= 22) begin 
            if (weather_forecast < HEAT) begin
                heating <= 1; 
                cooling <= 0; 
            end else if (weather_forecast > COOL) begin
                heating <= 0; 
                cooling <= 1; 
            end else begin
                heating <= 0; 
                cooling <= 0; 
            end
        end else begin
            heating <= 0; 
            cooling <= 0; 
        end
    end
end

endmodule


//Air Quality Monitoring: Automate air purifiers or humidifiers based on air quality readings. 
module air_quality_monitor(air_quality, clk, rst, purifier, humidifier);
 input wire [7:0] air_quality ;
    input wire clk;               
    input wire rst;             
    output reg purifier;         
    output reg humidifier;    
 
parameter PURIFIER_num= 100;  
parameter HUMIDIFIER_num= 30; 

always @(posedge clk or posedge rst) begin
    if (rst) begin
        purifier <= 0; 
        humidifier <= 0; 
    end else begin
        if (air_quality > PURIFIER_num) begin
            purifier <= 1;  
        end else begin
            purifier <= 0; 
   end
        if (air_quality < HUMIDIFIER_num) begin
            humidifier <= 1; 
        end else begin
            humidifier <= 0; 
        end
    end
end

endmodule


//Window Blinds Automation: Use smart motors to adjust window blinds or shades remotely.
module window_blinds_automation(remote_signal, clk, rst, motor_control);
 input wire remote_signal ;    
    input wire clk;              
    input wire rst;               
    output reg [1:0] motor_control; 

parameter stop = 2'b00;
parameter open = 2'b01;
parameter close = 2'b10;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        motor_control <= stop; 
    end else begin
        case (remote_signal)
            1'b0: motor_control <= close; 
            1'b1: motor_control <= open;  
            default: motor_control <= stop; 
        endcase
    end
end

endmodule


//Smart Cameras: Integrate surveillance cameras with motion detection and remote monitoring.
module smart_camera(motion_detected, remote_control, clk, rst, camera_angle);
input wire motion_detected;
input wire remote_control;
input wire clk;
input wire rst;
output reg [1:0] camera_angle;

parameter stop= 2'b00;
parameter left= 2'b01;
parameter right= 2'b10;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        camera_angle <= stop; 
    end else begin
        if (motion_detected) begin
            camera_angle <= left; 
        end else if (remote_control) begin
            camera_angle <= right; 
        end else begin
            camera_angle <= stop; 
        end
    end
end

endmodule


//Door Locks: Install smart locks that allow keyless entry, remote locking/unlocking, and even temporary access codes for guests.
module smart_lock(keypad, remote_unlock, remote_lock, temp_access_code, clk, rst, lock_state);
input wire [3:0] keypad;     
input wire remote_unlock;
input wire remote_lock;
input wire [3:0] temp_access_code;
input wire clk;                     
input wire rst;
output reg lock_state;  

parameter lockeed= 1'b0;
parameter unlocked= 1'b1;

parameter main_access_code= 4'b1010;    
parameter temp_access_code = 4'b0101;    

always @(posedge clk or posedge rst) begin
    if (rst) begin
        lock_state <= locked; 
    end else begin
        if (remote_unlock) begin
            lock_state <= unlocked; 
        end else if (remote_lock) begin
            lock_state <= locked; 
        end else if (keypad ==  main_access_code || keypad == temp_access_code) begin
            lock_state <= unlocked; 
        end else begin
            lock_state <= locked; 
        end
    end
end

endmodule

//Sensors: Use door/window sensors that alert you when they’re opened. 

module door_window_sensor(
    input wire door_open,      
    input wire window_open,     
    input wire clk,             
    input wire rst,             
    output reg alert            
);

// Define states for alert
parameter NO_ALERT = 1'b0;
parameter ALERT = 1'b1;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        alert <= NO_ALERT; // Reset alert signal
    end else begin
        if (door_open || window_open) begin
            alert <= ALERT; 
        end else begin
            alert <= NO_ALERT; 
        end
    end
end

endmodule

//Security Alerts: Automated alerts via mobile app, email, or SMS if an intruder is detected or when security is compromised.

module security_alert(
    input wire intruder_detected,  
    input wire system_compromised, 
    input wire clk,                
    input wire rst,                
    output reg app_alert,          
    output reg email_alert,        
    output reg sms_alert           
);

parameter NO_ALERT = 1'b0;
parameter ALERT = 1'b1;

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

//Smart Speakers: Use voice assistants like Alexa, Google Assistant, or Siri to control lights, appliances, and other devices in your home.

module smart_speaker_control(
    input wire voice_command,    
    input wire clk,              
    input wire rst,             
    output reg [3:0] device_state 
);

parameter LIGHTS_ON = 4'b0001;
parameter APPLIANCES_ON = 4'b0010;
parameter DEVICES_OFF = 4'b0000;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        device_state <= DEVICES_OFF; 
    end else begin
        case (voice_command)
            1'b1: device_state <= LIGHTS_ON;      
            1'b2: device_state <= APPLIANCES_ON;  
            1'b0: device_state <= DEVICES_OFF;    
            default: device_state <= DEVICES_OFF; 
        endcase
    end
end

endmodule

//Smart Appliances: Integrate smart refrigerators, ovens, coffee makers, washing machines, dishwashers, etc. into your system. 

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

parameter OFF = 1'b0;
parameter ON = 1'b1;

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

//Robot Vacuums: Schedule robot vacuums to clean your floors at specific times.

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

//Automated Pet Feeders: Program a pet feeder to dispense food at specific times.

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



//Integrations:


//App Control: Use a mobile app or a centralized smart home hub to control all of your devices in one place.
module app_control( app_signal, clk, rst, device_state );
input wire app_signal;        
input wire clk;                
input wire rst;             
output reg [3:0] device_state; 

parameter device_1 = 4'b0001;
parameter device_2 = 4'b0010;
parameter device_3 = 4'b0100;
parameter device_4 = 4'b1000;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        device_state <= 4'b0000; 
    end else begin
        device_state <= app_signal; 
    end
end

endmodule


//AI & Machine Learning: Integrate AI to learn your routines and habits over time, making the system more intuitive and predictive.
module ai_integration(
    input wire [3:0] sensor_data,     
    input wire clk,                   
    input wire rst,                   
    output reg [3:0] ai_decision      
);

parameter IDLE = 4'b0000;
parameter ROUTINE_1 = 4'b0001;
parameter ROUTINE_2 = 4'b0010;
parameter ROUTINE_3 = 4'b0100;
parameter ROUTINE_4 = 4'b1000;


always @(posedge clk or posedge rst) begin
    if (rst) begin
        ai_decision <= IDLE; 
    end else begin
        ai_decision <= sensor_data; 
    end
end

endmodule

//Home Robot Assistants: Integrate robots that can perform tasks like cleaning, delivery, or even social interaction.
module robot_assistant(
    input wire task_signal,    
    input wire clk,            
    input wire rst,             
    output reg [3:0] robot_task 
);

parameter IDLE = 4'b0000;
parameter CLEAN = 4'b0001;
parameter DELIVER = 4'b0010;
parameter INTERACT = 4'b0100;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        robot_task <= IDLE;  
    end else begin
        robot_task <= task_signal; 
    end
end

endmodule

//Security & Privacy Enhancements: Implement facial recognition or voice verification for highly secure areas of the house.
module security_enhancement(
    input wire [7:0] biometric_data, 
    input wire clk,                 
    input wire rst,                 
    output reg access_granted        
);

parameter DENIED = 1'b0;
parameter GRANTED = 1'b1;


parameter FACE_CODE = 8'b10101010;
parameter VOICE_CODE = 8'b01010101;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        access_granted <= DENIED;
    end else begin
        if (biometric_data == FACE_CODE || biometric_data == VOICE_CODE) begin
            access_granted <= GRANTED; 
        end else begin
            access_granted <= DENIED; 
        end
    end
end

endmodule
