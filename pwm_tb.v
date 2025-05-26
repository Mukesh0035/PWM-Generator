`timescale 1ns / 1ps

module pwm_tb;

    reg clk;
    reg rst;
    reg [7:0] duty_cycle;
    wire pwm_out;

    pwm_generator uut (
        .clk(clk),
        .rst(rst),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // Generate 10ns clock period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        duty_cycle = 0;

        // Reset pulse
        #20;
        rst = 0;

        // Change duty cycle over time
        #50  duty_cycle = 8'd64;   // 25%
        #200 duty_cycle = 8'd128;  // 50%
        #200 duty_cycle = 8'd192;  // 75%
        #200 duty_cycle = 8'd32;   // 12.5%
        #200 duty_cycle = 8'd255;  // ~100%
        #200 $finish;
    end

endmodule
