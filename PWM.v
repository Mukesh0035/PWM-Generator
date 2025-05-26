module pwm_generator (
    input wire clk,              // System clock
    input wire rst,              // Asynchronous reset
    input wire [7:0] duty_cycle, // Duty cycle control (0–255)
    output reg pwm_out           // PWM output signal
);

    reg [7:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 8'd0;
        else
            counter <= counter + 1;
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            pwm_out <= 0;
        else
            pwm_out <= (counter < duty_cycle) ? 1 : 0;
    end

endmodule
