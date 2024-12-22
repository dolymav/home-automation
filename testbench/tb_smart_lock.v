`timescale 1ns / 1ps

module tb_smart_lock;

    // Inputs
    reg [3:0] keypad;
    reg remote_unlock;
    reg remote_lock;
    reg [3:0] temp_access_code;
    reg clk;
    reg rst;

    // Outputs
    wire lock_state;

    // Instantiate the Unit Under Test (UUT)
    smart_lock uut (
        .keypad(keypad),
        .remote_unlock(remote_unlock),
        .remote_lock(remote_lock),
        .temp_access_code(temp_access_code),
        .clk(clk),
        .rst(rst),
        .lock_state(lock_state)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        keypad = 0;
        remote_unlock = 0;
        remote_lock = 0;
        temp_access_code = 4'b0101;
        clk = 0;
        rst = 0;

        // Reset the UUT
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Test cases
        // Test case 1: Remote unlock
        remote_unlock = 1;
        #10;
        remote_unlock = 0;
        #10;

        // Test case 2: Remote lock
        remote_lock = 1;
        #10;
        remote_lock = 0;
        #10;

        // Test case 3: Correct main access code
        keypad = 4'b1010;
        #10;
        keypad = 0;
        #10;

        // Test case 4: Correct temporary access code
        keypad = temp_access_code;
        #10;
        keypad = 0;
        #10;

        // Test case 5: Incorrect access code
        keypad = 4'b1111;
        #10;
        keypad = 0;
        #10;

        // End simulation
        $stop;
    end

endmodule
