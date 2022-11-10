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
Comment1 "Copyright (c) 2022"
Comment2 "Designer: JMMS"
Comment3 "Reviewer:"
Comment4 "Approved:"
$EndDescr
Text GLabel 3525 1400 0    50   Input ~ 0
1
Text GLabel 3525 1500 0    50   Input ~ 0
2
Text GLabel 3525 1600 0    50   Input ~ 0
3
Text GLabel 3525 1700 0    50   Input ~ 0
4
Text GLabel 3525 1800 0    50   Input ~ 0
5
Text GLabel 3525 1900 0    50   Input ~ 0
6
$Comp
L Perovskite:Perovskite_CP_6_Cell U1
U 1 1 636879E9
P 3975 1150
F 0 "U1" H 4443 646 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 4443 555 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 3975 1150 50  0001 C CNN
F 3 "" H 3975 1150 50  0001 C CNN
	1    3975 1150
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U2
U 1 1 6368D231
P 3950 2900
F 0 "U2" H 4418 2396 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 4418 2305 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 3950 2900 50  0001 C CNN
F 3 "" H 3950 2900 50  0001 C CNN
	1    3950 2900
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U3
U 1 1 63690578
P 4025 5025
F 0 "U3" H 4493 4521 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 4493 4430 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 4025 5025 50  0001 C CNN
F 3 "" H 4025 5025 50  0001 C CNN
	1    4025 5025
	1    0    0    -1  
$EndComp
Text GLabel 3500 3150 0    50   Input ~ 0
7
Text GLabel 3500 3250 0    50   Input ~ 0
8
Text GLabel 3500 3350 0    50   Input ~ 0
9
Text GLabel 3500 3450 0    50   Input ~ 0
10
Text GLabel 3500 3550 0    50   Input ~ 0
11
Text GLabel 3500 3650 0    50   Input ~ 0
12
Text GLabel 3575 5275 0    50   Input ~ 0
13
Text GLabel 3575 5375 0    50   Input ~ 0
14
Text GLabel 3575 5475 0    50   Input ~ 0
15
Text GLabel 3575 5575 0    50   Input ~ 0
16
Text GLabel 3575 5675 0    50   Input ~ 0
17
Text GLabel 3575 5775 0    50   Input ~ 0
18
Text GLabel 7600 1350 0    50   Input ~ 0
1
Text GLabel 7600 1450 0    50   Input ~ 0
2
Text GLabel 7600 1550 0    50   Input ~ 0
3
Text GLabel 8100 1550 2    50   Input ~ 0
4
Text GLabel 8100 1450 2    50   Input ~ 0
5
Text GLabel 8100 1350 2    50   Input ~ 0
6
Text GLabel 7625 3125 0    50   Input ~ 0
7
Text GLabel 7625 3225 0    50   Input ~ 0
8
Text GLabel 7625 3325 0    50   Input ~ 0
9
Text GLabel 8125 3325 2    50   Input ~ 0
10
Text GLabel 8125 3225 2    50   Input ~ 0
11
Text GLabel 8125 3125 2    50   Input ~ 0
12
Text GLabel 7625 5275 0    50   Input ~ 0
13
Text GLabel 7625 5375 0    50   Input ~ 0
14
Text GLabel 7625 5475 0    50   Input ~ 0
15
Text GLabel 8125 5475 2    50   Input ~ 0
16
Text GLabel 8125 5375 2    50   Input ~ 0
17
Text GLabel 8125 5275 2    50   Input ~ 0
18
Text GLabel 3525 2000 0    50   Input ~ 0
CP
Text GLabel 3500 3750 0    50   Input ~ 0
CP
Text GLabel 3575 5875 0    50   Input ~ 0
CP
Text GLabel 7625 5900 0    50   Input ~ 0
SDA
Text GLabel 7625 6000 0    50   Input ~ 0
SCL
Text GLabel 8125 5800 2    50   Input ~ 0
GND
$Comp
L Sensor_Temperature:MCP9808_MSOP U4
U 1 1 6369EDDD
P 6125 1675
F 0 "U4" H 6550 1900 50  0000 L CNN
F 1 "MCP9808_MSOP" H 6525 1825 50  0000 L CNN
F 2 "MCP9804Castillated:CastillatedMCP9804" H 6125 1675 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5875 2125 50  0001 C CNN
	1    6125 1675
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U5
U 1 1 6369FACF
P 6125 3450
F 0 "U5" H 6575 3550 50  0000 L CNN
F 1 "MCP9808_MSOP" H 6500 3625 50  0000 L CNN
F 2 "MCP9804Castillated:CastillatedMCP9804" H 6125 3450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5875 3900 50  0001 C CNN
	1    6125 3450
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U6
U 1 1 636A02E7
P 6125 5550
F 0 "U6" H 6600 5650 50  0000 L CNN
F 1 "MCP9808_MSOP" H 6525 5725 50  0000 L CNN
F 2 "MCP9804Castillated:CastillatedMCP9804" H 6125 5550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5875 6000 50  0001 C CNN
	1    6125 5550
	1    0    0    -1  
$EndComp
Text GLabel 5375 3150 0    50   Input ~ 0
SDA
Text GLabel 5375 3250 0    50   Input ~ 0
SCL
Text GLabel 5375 1375 0    50   Input ~ 0
SDA
Text GLabel 5375 1475 0    50   Input ~ 0
SCL
Text GLabel 5375 5250 0    50   Input ~ 0
SDA
Text GLabel 5375 5350 0    50   Input ~ 0
SCL
$Comp
L Device:R R4
U 1 1 636A7063
P 5650 1125
F 0 "R4" H 5720 1171 50  0000 L CNN
F 1 "R" H 5720 1080 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5580 1125 50  0001 C CNN
F 3 "~" H 5650 1125 50  0001 C CNN
	1    5650 1125
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 636A82B0
P 5450 1125
F 0 "R1" H 5520 1171 50  0000 L CNN
F 1 "R" H 5520 1080 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5380 1125 50  0001 C CNN
F 3 "~" H 5450 1125 50  0001 C CNN
	1    5450 1125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 975  5650 975 
Wire Wire Line
	5650 975  6125 975 
Wire Wire Line
	6125 975  6125 1175
Connection ~ 5650 975 
Wire Wire Line
	5450 1275 5450 1475
Wire Wire Line
	5450 1475 5375 1475
Wire Wire Line
	5375 1375 5650 1375
Connection ~ 5450 1475
Wire Wire Line
	5450 1475 5725 1475
Wire Wire Line
	5650 1275 5650 1375
Connection ~ 5650 1375
Wire Wire Line
	5650 1375 5725 1375
Text GLabel 6125 2750 1    50   Input ~ 0
Vdd
Wire Wire Line
	6125 2750 6125 2950
Text GLabel 6125 4850 1    50   Input ~ 0
Vdd
Wire Wire Line
	6125 4850 6125 5050
Text GLabel 6125 6050 3    50   Input ~ 0
GND
Text GLabel 6125 3950 3    50   Input ~ 0
GND
Text GLabel 6125 2175 3    50   Input ~ 0
GND
Text GLabel 5725 5750 0    50   Input ~ 0
GND
Text GLabel 5725 5650 0    50   Input ~ 0
GND
Text GLabel 5725 3750 0    50   Input ~ 0
GND
Text GLabel 5725 3550 0    50   Input ~ 0
GND
Text GLabel 5725 1975 0    50   Input ~ 0
GND
Text GLabel 5725 1875 0    50   Input ~ 0
GND
Text GLabel 5725 3650 0    50   Input ~ 0
Vdd
Text GLabel 5725 1775 0    50   Input ~ 0
Vdd
Text GLabel 5725 5850 0    50   Input ~ 0
Vdd
Text GLabel 6525 1675 2    50   Input ~ 0
Alert1
Text GLabel 6525 3450 2    50   Input ~ 0
Alert2
Text GLabel 6525 5550 2    50   Input ~ 0
Alert3
Text GLabel 8125 5900 2    50   Input ~ 0
Alert3
Text GLabel 8125 3775 2    50   Input ~ 0
Alert2
Text GLabel 8100 2000 2    50   Input ~ 0
Alert1
Wire Wire Line
	5375 3150 5725 3150
Wire Wire Line
	5375 3250 5725 3250
Wire Wire Line
	5375 5250 5725 5250
Wire Wire Line
	5375 5350 5725 5350
Text GLabel 7600 1900 0    50   Input ~ 0
CP
Text GLabel 7625 5800 0    50   Input ~ 0
CP
Text GLabel 7625 3675 0    50   Input ~ 0
CP
Text GLabel 7625 3775 0    50   Input ~ 0
SDA
Text GLabel 7625 3875 0    50   Input ~ 0
SCL
Text GLabel 8125 3675 2    50   Input ~ 0
GND
Text GLabel 8125 3875 2    50   Input ~ 0
Vdd
Text GLabel 7600 2000 0    50   Input ~ 0
SDA
Text GLabel 7600 2100 0    50   Input ~ 0
SCL
Text GLabel 8100 1900 2    50   Input ~ 0
GND
Text GLabel 8100 2100 2    50   Input ~ 0
Vdd
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J1
U 1 1 636A709B
P 7800 1450
F 0 "J1" H 7850 1767 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 7850 1676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 7800 1450 50  0001 C CNN
F 3 "~" H 7800 1450 50  0001 C CNN
	1    7800 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J2
U 1 1 636A776C
P 7800 2000
F 0 "J2" H 7850 2317 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 7850 2226 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 7800 2000 50  0001 C CNN
F 3 "~" H 7800 2000 50  0001 C CNN
	1    7800 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J3
U 1 1 636A82B3
P 7825 3225
F 0 "J3" H 7875 3542 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 7875 3451 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 7825 3225 50  0001 C CNN
F 3 "~" H 7825 3225 50  0001 C CNN
	1    7825 3225
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J4
U 1 1 636A8C93
P 7825 3775
F 0 "J4" H 7875 4092 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 7875 4001 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 7825 3775 50  0001 C CNN
F 3 "~" H 7825 3775 50  0001 C CNN
	1    7825 3775
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J5
U 1 1 636A9471
P 7825 5375
F 0 "J5" H 7875 5692 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 7875 5601 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 7825 5375 50  0001 C CNN
F 3 "~" H 7825 5375 50  0001 C CNN
	1    7825 5375
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise J6
U 1 1 636A9F6D
P 7825 5900
F 0 "J6" H 7875 6217 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 7875 6126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical_SMD" H 7825 5900 50  0001 C CNN
F 3 "~" H 7825 5900 50  0001 C CNN
	1    7825 5900
	1    0    0    -1  
$EndComp
Text GLabel 8125 6000 2    50   Input ~ 0
Vdd
Text GLabel 6125 975  1    50   Input ~ 0
Vdd
$EndSCHEMATC
