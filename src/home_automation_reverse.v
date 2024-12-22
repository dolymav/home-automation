//smart lights
module SmartLightController (switch, light);
    input wire switch;
    output wire light;

    assign light = switch; 
endmodule

//motion sensing
module motion_sensor (
    input wire motion_detected,
    input wire rst,
    output wire light
);
    assign light = (rst) ? 0 : motion_detected;

endmodule

//smart thermostat
module smart_thermostat (
    input wire [4:0] time_of_day, 
    input wire [7:0] weather_forecast, 
    input wire rst, 
    output wire heating, 
    output wire cooling
);

    parameter HEAT = 19; 
    parameter COOL = 25;

    assign heating = (!rst && (time_of_day >= 6 && time_of_day <= 22) && (weather_forecast < HEAT)) ? 1 : 0;
    assign cooling = (!rst && (time_of_day >= 6 && time_of_day <= 22) && (weather_forecast > COOL)) ? 1 : 0;

endmodule

//air quality monitoring

module air_quality_monitor (
    input wire [7:0] air_quality,
    input wire rst,
    output wire purifier,
    output wire humidifier
);

    parameter PURIFIER_num = 100;  
    parameter HUMIDIFIER_num = 30;

    assign purifier = (!rst && air_quality > PURIFIER_num) ? 1 : 0;
    assign humidifier = (!rst && air_quality < HUMIDIFIER_num) ? 1 : 0;

endmodule

//window blinds automation
module window_blinds_automation (
    input wire remote_signal,
    input wire rst,
    output wire [1:0] motor_control
);

    parameter stop = 2'b00;
    parameter open = 2'b01;
    parameter close = 2'b10;

    assign motor_control = (rst) ? stop :
                           (remote_signal) ? open :
                           close;

endmodule

//smart cameras
module smart_camera (
    input wire motion_detected,
    input wire remote_control,
    input wire rst,
    output wire [1:0] camera_angle
);

    parameter stop = 2'b00;
    parameter left = 2'b01;
    parameter right = 2'b10;

    assign camera_angle = (rst) ? stop :
                          (motion_detected) ? left :
                          (remote_control) ? right :
                          stop;

endmodule

//door locks
module smart_lock (
    input wire [3:0] keypad,
    input wire remote_unlock,
    input wire remote_lock,
    input wire [3:0] temp_access_code,
    input wire rst,
    output wire lock_state
);

    parameter locked = 1'b0;
    parameter unlocked = 1'b1;
    parameter main_access_code = 4'b1010;

    assign lock_state = (rst) ? locked :
                        (remote_unlock) ? unlocked :
                        (remote_lock) ? locked :
                        ((keypad == main_access_code || keypad == temp_access_code) ? unlocked : locked);

endmodule

//define states for alerts
module door_window_sensor (
    input wire door_open,
    input wire window_open,
    input wire rst,
    output wire alert
);

    parameter NO_ALERT = 1'b0;
    parameter ALERT = 1'b1;

    assign alert = (rst) ? NO_ALERT :
                   (door_open || window_open) ? ALERT :
                   NO_ALERT;

endmodule

//security alerts
module security_alert (
    input wire intruder_detected,
    input wire system_compromised,
    input wire rst,
    output wire app_alert,
    output wire email_alert,
    output wire sms_alert
);

    parameter NO_ALERT = 1'b0;
    parameter ALERT = 1'b1;

    assign app_alert = (rst) ? NO_ALERT : (intruder_detected || system_compromised) ? ALERT : NO_ALERT;
    assign email_alert = (rst) ? NO_ALERT : (intruder_detected || system_compromised) ? ALERT : NO_ALERT;
    assign sms_alert = (rst) ? NO_ALERT : (intruder_detected || system_compromised) ? ALERT : NO_ALERT;

endmodule


//smart speakers
module smart_speaker_control (
    input wire [1:0] voice_command,
    input wire rst,
    output wire [3:0] device_state
);

    parameter LIGHTS_ON = 4'b0001;
    parameter APPLIANCES_ON = 4'b0010;
    parameter DEVICES_OFF = 4'b0000;

    assign device_state = (rst) ? DEVICES_OFF :
                          (voice_command == 2'b01) ? LIGHTS_ON :
                          (voice_command == 2'b10) ? APPLIANCES_ON :
                          DEVICES_OFF;

endmodule


//smart appliances
module smart_appliances_control (
    input wire fridge_cmd,
    input wire oven_cmd,
    input wire coffee_maker_cmd,
    input wire washer_cmd,
    input wire dishwasher_cmd,
    input wire rst,
    output wire fridge_status,
    output wire oven_status,
    output wire coffee_maker_status,
    output wire washer_status,
    output wire dishwasher_status
);

    parameter OFF = 1'b0;

    assign fridge_status = (rst) ? OFF : fridge_cmd;
    assign oven_status = (rst) ? OFF : oven_cmd;
    assign coffee_maker_status = (rst) ? OFF : coffee_maker_cmd;
    assign washer_status = (rst) ? OFF : washer_cmd;
    assign dishwasher_status = (rst) ? OFF : dishwasher_cmd;

endmodule


//robot vacuums
module robot_vacuum_scheduler (
    input wire [4:0] hour,
    input wire [5:0] minute,
    input wire enable,
    input wire rst,
    output wire start_cleaning
);

    parameter SCHEDULED_HOUR = 5'd10;
    parameter SCHEDULED_MINUTE = 6'd0;

    assign start_cleaning = (rst) ? 1'b0 :
                            (enable && hour == SCHEDULED_HOUR && minute == SCHEDULED_MINUTE) ? 1'b1 : 
                            1'b0;

endmodule

//automated pet feeders
module pet_feeder_scheduler (
    input wire [4:0] hour,
    input wire [5:0] minute,
    input wire enable,
    input wire rst,
    output wire dispense_food
);

    parameter SCHEDULED_HOUR = 5'd7;
    parameter SCHEDULED_MINUTE = 6'd30;

    assign dispense_food = (rst) ? 1'b0 :
                           (enable && hour == SCHEDULED_HOUR && minute == SCHEDULED_MINUTE) ? 1'b1 :
                           1'b0;

endmodule



//Integrations

//app control
module app_control (
    input wire [3:0] app_signal,
    input wire rst,
    output wire [3:0] device_state
);

    assign device_state = (rst) ? 4'b0000 : app_signal;

endmodule

//ai & machine learning
module ai_integration (
    input wire [3:0] sensor_data,
    input wire rst,
    output wire [3:0] ai_decision
);

    parameter IDLE = 4'b0000;

    assign ai_decision = (rst) ? IDLE : sensor_data; // Replace with actual AI logic if needed.

endmodule

//home robots assistants
module robot_assistant (
    input wire [3:0] task_signal,
    input wire rst,
    output wire [3:0] robot_task
);

    parameter IDLE = 4'b0000;
    assign robot_task = (rst) ? IDLE : task_signal;

endmodule

//security & privacy enchancements
module security_enhancement (
    input wire [7:0] biometric_data,
    input wire rst,
    output wire access_granted
);

    parameter DENIED = 1'b0;
    parameter GRANTED = 1'b1;

    parameter FACE_CODE = 8'b10101010;
    parameter VOICE_CODE = 8'b01010101;

    assign access_granted = (rst) ? DENIED :
                            (biometric_data == FACE_CODE || biometric_data == VOICE_CODE) ? GRANTED :
                            DENIED;

endmodule
