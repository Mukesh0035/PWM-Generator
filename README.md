# PWM Generator (Verilog)

## Overview

This project implements a **Pulse Width Modulation (PWM)** signal generator using Verilog HDL. The PWM signal's **duty cycle** is adjustable in real time using an 8-bit input value. This module is ideal for applications like motor control, LED dimming, and digital-to-analog signal emulation.

---

## Features

- Adjustable duty cycle via 8-bit input (`0`–`255`)
- Clock-driven operation
- Easy to synthesize on FPGA or simulate with testbench
- Clean and modular design

---

## Input/Output Ports

| Port        | Direction | Description                       |
|-------------|-----------|-----------------------------------|
| `clk`       | Input     | Clock signal                      |
| `rst`       | Input     | Asynchronous reset                |
| `duty_cycle`| Input     | 8-bit value to control duty cycle |
| `pwm_out`   | Output    | PWM signal output                 |

---

## How It Works

The module uses a counter (0–255). The PWM output is high (`1`) when the counter is **less than** the duty cycle value. Otherwise, it is low (`0`). This directly maps the input value to a duty cycle:

- `duty_cycle = 64` → 25% duty cycle
- `duty_cycle = 128` → 50% duty cycle
- `duty_cycle = 255` → ~100% duty cycle

