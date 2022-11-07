EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Perovskite Contact Board"
Date "2022-11-07"
Rev "Version 1"
Comp "Aerospace eXperimental Payloads"
Comment1 "Joel Murch-Shafer"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1025 1300 0    50   Input ~ 0
1
Text GLabel 1025 1400 0    50   Input ~ 0
2
Text GLabel 1025 1500 0    50   Input ~ 0
3
Text GLabel 1025 1600 0    50   Input ~ 0
4
Text GLabel 1025 1700 0    50   Input ~ 0
5
Text GLabel 1025 1800 0    50   Input ~ 0
6
$Comp
L Perovskite:Perovskite_CP_6_Cell U1
U 1 1 636879E9
P 1475 1050
F 0 "U1" H 1943 546 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 1943 455 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 1475 1050 50  0001 C CNN
F 3 "" H 1475 1050 50  0001 C CNN
	1    1475 1050
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U2
U 1 1 6368D231
P 1450 2800
F 0 "U2" H 1918 2296 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 1918 2205 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 1450 2800 50  0001 C CNN
F 3 "" H 1450 2800 50  0001 C CNN
	1    1450 2800
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U3
U 1 1 63690578
P 1525 4925
F 0 "U3" H 1993 4421 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 1993 4330 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 1525 4925 50  0001 C CNN
F 3 "" H 1525 4925 50  0001 C CNN
	1    1525 4925
	1    0    0    -1  
$EndComp
Text GLabel 1000 3050 0    50   Input ~ 0
7
Text GLabel 1000 3150 0    50   Input ~ 0
8
Text GLabel 1000 3250 0    50   Input ~ 0
9
Text GLabel 1000 3350 0    50   Input ~ 0
10
Text GLabel 1000 3450 0    50   Input ~ 0
11
Text GLabel 1000 3550 0    50   Input ~ 0
12
Text GLabel 1075 5175 0    50   Input ~ 0
13
Text GLabel 1075 5275 0    50   Input ~ 0
14
Text GLabel 1075 5375 0    50   Input ~ 0
15
Text GLabel 1075 5475 0    50   Input ~ 0
16
Text GLabel 1075 5575 0    50   Input ~ 0
17
Text GLabel 1075 5675 0    50   Input ~ 0
18
Text GLabel 5100 1250 0    50   Input ~ 0
1
Text GLabel 5100 1350 0    50   Input ~ 0
2
Text GLabel 5100 1450 0    50   Input ~ 0
3
Text GLabel 5600 1450 2    50   Input ~ 0
4
Text GLabel 5600 1350 2    50   Input ~ 0
5
Text GLabel 5600 1250 2    50   Input ~ 0
6
Text GLabel 5125 3025 0    50   Input ~ 0
7
Text GLabel 5125 3125 0    50   Input ~ 0
8
Text GLabel 5125 3225 0    50   Input ~ 0
9
Text GLabel 5625 3225 2    50   Input ~ 0
10
Text GLabel 5625 3125 2    50   Input ~ 0
11
Text GLabel 5625 3025 2    50   Input ~ 0
12
Text GLabel 5125 5175 0    50   Input ~ 0
13
Text GLabel 5125 5275 0    50   Input ~ 0
14
Text GLabel 5125 5375 0    50   Input ~ 0
15
Text GLabel 5625 5375 2    50   Input ~ 0
16
Text GLabel 5625 5275 2    50   Input ~ 0
17
Text GLabel 5625 5175 2    50   Input ~ 0
18
Text GLabel 1025 1900 0    50   Input ~ 0
CP
Text GLabel 1000 3650 0    50   Input ~ 0
CP
Text GLabel 1075 5775 0    50   Input ~ 0
CP
Text GLabel 5125 5800 0    50   Input ~ 0
SDA
Text GLabel 5125 5900 0    50   Input ~ 0
SCL
Text GLabel 5625 5700 2    50   Input ~ 0
GND
$Comp
L Sensor_Temperature:MCP9808_MSOP U4
U 1 1 6369EDDD
P 3625 1575
F 0 "U4" H 4050 1800 50  0000 L CNN
F 1 "MCP9808_MSOP" H 4025 1725 50  0000 L CNN
F 2 "MCP9804Castillated:CastillatedMCP9804" H 3625 1575 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 3375 2025 50  0001 C CNN
	1    3625 1575
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U5
U 1 1 6369FACF
P 3625 3350
F 0 "U5" H 4075 3450 50  0000 L CNN
F 1 "MCP9808_MSOP" H 4000 3525 50  0000 L CNN
F 2 "MCP9804Castillated:CastillatedMCP9804" H 3625 3350 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 3375 3800 50  0001 C CNN
	1    3625 3350
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U6
U 1 1 636A02E7
P 3625 5450
F 0 "U6" H 4100 5550 50  0000 L CNN
F 1 "MCP9808_MSOP" H 4025 5625 50  0000 L CNN
F 2 "MCP9804Castillated:CastillatedMCP9804" H 3625 5450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 3375 5900 50  0001 C CNN
	1    3625 5450
	1    0    0    -1  
$EndComp
Text GLabel 2875 3050 0    50   Input ~ 0
SDA
Text GLabel 2875 3150 0    50   Input ~ 0
SCL
Text GLabel 2875 1275 0    50   Input ~ 0
SDA
Text GLabel 2875 1375 0    50   Input ~ 0
SCL
Text GLabel 2875 5150 0    50   Input ~ 0
SDA
Text GLabel 2875 5250 0    50   Input ~ 0
SCL
Text GLabel 3625 875  1    50   Input ~ 0
Vdd
$Comp
L Device:R R4
U 1 1 636A7063
P 3150 1025
F 0 "R4" H 3220 1071 50  0000 L CNN
F 1 "R" H 3220 980 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3080 1025 50  0001 C CNN
F 3 "~" H 3150 1025 50  0001 C CNN
	1    3150 1025
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 636A82B0
P 2950 1025
F 0 "R1" H 3020 1071 50  0000 L CNN
F 1 "R" H 3020 980 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2880 1025 50  0001 C CNN
F 3 "~" H 2950 1025 50  0001 C CNN
	1    2950 1025
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 875  3150 875 
Wire Wire Line
	3150 875  3625 875 
Wire Wire Line
	3625 875  3625 1075
Connection ~ 3150 875 
Wire Wire Line
	2950 1175 2950 1375
Wire Wire Line
	2950 1375 2875 1375
Wire Wire Line
	2875 1275 3150 1275
Connection ~ 2950 1375
Wire Wire Line
	2950 1375 3225 1375
Wire Wire Line
	3150 1175 3150 1275
Connection ~ 3150 1275
Wire Wire Line
	3150 1275 3225 1275
Text GLabel 3625 2650 1    50   Input ~ 0
Vdd
Wire Wire Line
	3625 2650 3625 2850
Text GLabel 3625 4750 1    50   Input ~ 0
Vdd
Wire Wire Line
	3625 4750 3625 4950
Text GLabel 3625 5950 3    50   Input ~ 0
GND
Text GLabel 3625 3850 3    50   Input ~ 0
GND
Text GLabel 3625 2075 3    50   Input ~ 0
GND
Text GLabel 3225 5650 0    50   Input ~ 0
GND
Text GLabel 3225 5550 0    50   Input ~ 0
GND
Text GLabel 3225 3650 0    50   Input ~ 0
GND
Text GLabel 3225 3450 0    50   Input ~ 0
GND
Text GLabel 3225 1875 0    50   Input ~ 0
GND
Text GLabel 3225 1775 0    50   Input ~ 0
GND
Text GLabel 3225 3550 0    50   Input ~ 0
Vdd
Text GLabel 3225 1675 0    50   Input ~ 0
Vdd
Text GLabel 3225 5750 0    50   Input ~ 0
Vdd
Text GLabel 4025 1575 2    50   Input ~ 0
Alert1
Text GLabel 4025 3350 2    50   Input ~ 0
Alert2
Text GLabel 4025 5450 2    50   Input ~ 0
Alert3
Text GLabel 5625 5800 2    50   Input ~ 0
Alert3
Text GLabel 5625 3675 2    50   Input ~ 0
Alert2
Text GLabel 5600 1900 2    50   Input ~ 0
Alert1
Wire Wire Line
	2875 3050 3225 3050
Wire Wire Line
	2875 3150 3225 3150
Wire Wire Line
	2875 5150 3225 5150
Wire Wire Line
	2875 5250 3225 5250
Text GLabel 5100 1800 0    50   Input ~ 0
CP
Text GLabel 5125 5700 0    50   Input ~ 0
CP
Text GLabel 5125 3575 0    50   Input ~ 0
CP
Text GLabel 5125 3675 0    50   Input ~ 0
SDA
Text GLabel 5125 3775 0    50   Input ~ 0
SCL
Text GLabel 5625 3575 2    50   Input ~ 0
GND
Text GLabel 5625 3775 2    50   Input ~ 0
Vdd
Text GLabel 5100 1900 0    50   Input ~ 0
SDA
Text GLabel 5100 2000 0    50   Input ~ 0
SCL
Text GLabel 5600 1800 2    50   Input ~ 0
GND
Text GLabel 5600 2000 2    50   Input ~ 0
Vdd
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J1
U 1 1 636A709B
P 5300 1350
F 0 "J1" H 5350 1667 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 5350 1576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5300 1350 50  0001 C CNN
F 3 "~" H 5300 1350 50  0001 C CNN
	1    5300 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J2
U 1 1 636A776C
P 5300 1900
F 0 "J2" H 5350 2217 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 5350 2126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5300 1900 50  0001 C CNN
F 3 "~" H 5300 1900 50  0001 C CNN
	1    5300 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J3
U 1 1 636A82B3
P 5325 3125
F 0 "J3" H 5375 3442 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 5375 3351 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5325 3125 50  0001 C CNN
F 3 "~" H 5325 3125 50  0001 C CNN
	1    5325 3125
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J4
U 1 1 636A8C93
P 5325 3675
F 0 "J4" H 5375 3992 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 5375 3901 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5325 3675 50  0001 C CNN
F 3 "~" H 5325 3675 50  0001 C CNN
	1    5325 3675
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J5
U 1 1 636A9471
P 5325 5275
F 0 "J5" H 5375 5592 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 5375 5501 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5325 5275 50  0001 C CNN
F 3 "~" H 5325 5275 50  0001 C CNN
	1    5325 5275
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J6
U 1 1 636A9F6D
P 5325 5800
F 0 "J6" H 5375 6117 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 5375 6026 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 5325 5800 50  0001 C CNN
F 3 "~" H 5325 5800 50  0001 C CNN
	1    5325 5800
	1    0    0    -1  
$EndComp
Text GLabel 5625 5900 2    50   Input ~ 0
Vdd
$EndSCHEMATC
