# SPI Protocol Verification using Verilog

# SPI Protocol Implementation and Verification

This project demonstrates the implementation and verification of the SPI (Serial Peripheral Interface) protocol using Verilog. SPI is a high-speed, synchronous serial communication protocol commonly used for data exchange between microcontrollers and peripheral devices like sensors, displays, and memory chips.

## What is SPI?
SPI is a full-duplex communication protocol that uses four main signals:
- **SCLK (Serial Clock)**: Synchronizes data transfer between devices.
- **MOSI (Master Out Slave In)**: Transfers data from the master to the slave.
- **MISO (Master In Slave Out)**: Transfers data from the slave to the master.
- **CS (Chip Select)**: Selects the slave device for communication.

Key characteristics of SPI:
- Simple and efficient for short-distance communication.
- Supports multiple slaves with individual chip select lines.
- Provides high-speed data transfer compared to protocols like I²C.

## Project Overview
- **SPI Module**: Implements the SPI protocol with a 12-bit data transfer capability.
- **Testbench**: Verifies the functionality of the SPI module through simulation.
