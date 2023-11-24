# Big Red Sat-1

## Introduction 

This repository contains the original designs for the Big Red Sat-1 1U cube satellite, conceived, designed, and launched by a multi-disciplinary team of middle schoolers and high schoolers from the Nebraska public school system, as well as undergraduate students and graduate students from the University of Nebraska-Lincoln.  

The goal of this scientific mission is to characterize the performance and degradation of experimental perovskite solar cells from the National Renewable Energy Laboratory while in low earth orbit.  To accomplish this, a custom precision curve tracer was designed along with a low-Ohm analog multiplexer that was integrated with Near Space Launch's 1U FastBus CubeSat Platform, which incorporates an electrical power system and Iridium satellite communication system for telemetry.  

Electrical connections to the perovskite solar cell samples were made using pogo-pins, with the temperature of each sample being collected with a high-precision temperature sensor affixed to their back face with EP30-2 epoxy.  The enclosure was designed to be airtight to prevent degradation due to humidity and oxygen, so a pressure and humidity sensor were included to monitor changes in this performance.  Since the final samples had a coverslip epoxied to protect the perovskite layer, the airtight property was considered a redundancy.

## Prototyping Designs

- [Prototype digital potentiometer curve tracer](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Prototyping/singular_SIV)
- [Prototype resistor ladder curve tracer in LaunchPad form factor](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Prototyping/resistor_ladder_curve_tracer)
- [Prototype analog multiplexer in LaunchPad form factor](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Prototyping/perovskite_switcher/v2)

## Original Designs

- [Flight computer with curve tracer and analog multiplexer](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Flight%20Hardware/flight_computer/v3)
- [Secondary payload with IMU and relay](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Flight%20Hardware/secondary_payload)
- [Tag-Connect programming and data interface](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Flight%20Hardware/Tag%20Connector)
- [Perovskite contact temperature and humiditiy sensor](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Flight%20Hardware/perovskite_contact_board/V7)
- [Perovskite pogo pin board](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Flight%20Hardware/perovskite_contact_board/V6/bot)
- [Perovskite payload enclosure](https://github.com/wsarce/Big-Red-Sat-1/tree/main/Flight%20Payload/Mechanical%20Design)

## Satellite Exploded View Render

https://github.com/wsarce/Big-Red-Sat-1/assets/22334349/7d4744a6-e3ca-4aac-ab56-a3370dd9aef9

