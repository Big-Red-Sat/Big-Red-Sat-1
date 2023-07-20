EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Single Perovskite Holder "
Date "2023-05-11"
Rev "A"
Comp "Aerospace eXperimental Payloads | UNL Aerospace Club"
Comment1 "Copyright (c) 2023"
Comment2 "Designer: WSA"
Comment3 "Reviewer: WSA"
Comment4 "Approved: WSA"
$EndDescr
$Comp
L Perovskite:Perovskite_CP_6_Cell U1
U 1 1 644C9095
P 5000 2800
F 0 "U1" H 4988 2815 50  0000 C CNN
F 1 "Perovskite_CP_6_Cell" H 4988 2724 50  0000 C CNN
F 2 "Perovskite:Perovskite" H 5000 2800 50  0001 C CNN
F 3 "" H 5000 2800 50  0001 C CNN
	1    5000 2800
	-1   0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U2
U 1 1 644CC35C
P 5050 4800
F 0 "U2" H 4900 5400 50  0000 C CNN
F 1 "MCP9808_MSOP" H 4650 5300 50  0000 C CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 5050 4800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 4800 5250 50  0001 C CNN
	1    5050 4800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J1
U 1 1 644CE009
P 7150 3350
F 0 "J1" H 7122 3324 50  0000 R CNN
F 1 "Conn_01x10_Male" H 7122 3233 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7150 3350 50  0001 C CNN
F 3 "~" H 7150 3350 50  0001 C CNN
	1    7150 3350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J2
U 1 1 644CEC70
P 7150 4750
F 0 "J2" H 7122 4724 50  0000 R CNN
F 1 "Conn_01x10_Male" H 7122 4633 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7150 4750 50  0001 C CNN
F 3 "~" H 7150 4750 50  0001 C CNN
	1    7150 4750
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 644D8A24
P 4050 4800
F 0 "C1" H 4165 4846 50  0000 L CNN
F 1 "0.1u" H 4165 4755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4088 4650 50  0001 C CNN
F 3 "~" H 4050 4800 50  0001 C CNN
	1    4050 4800
	1    0    0    -1  
$EndComp
Text GLabel 6950 2950 0    50   Input ~ 0
CELL_1
Text GLabel 6950 3050 0    50   Input ~ 0
CELL_2
Text GLabel 6950 3150 0    50   Input ~ 0
CELL_3
$Comp
L power:GND #PWR?
U 1 1 64AAD583
P 6950 3350
F 0 "#PWR?" H 6950 3100 50  0001 C CNN
F 1 "GND" V 6955 3222 50  0000 R CNN
F 2 "" H 6950 3350 50  0001 C CNN
F 3 "" H 6950 3350 50  0001 C CNN
	1    6950 3350
	0    1    1    0   
$EndComp
NoConn ~ 6950 3250
NoConn ~ 6950 3750
Text GLabel 6950 3850 0    50   Input ~ 0
COMMON_2
Text GLabel 6950 3650 0    50   Input ~ 0
SDA
Text GLabel 6950 3550 0    50   Input ~ 0
SCL
Text GLabel 6950 3450 0    50   Input ~ 0
ALERT
Text GLabel 6950 4350 0    50   Input ~ 0
COMMON_1
NoConn ~ 6950 4450
Text GLabel 6950 4550 0    50   Input ~ 0
CELL_6
Text GLabel 6950 4650 0    50   Input ~ 0
CELL_5
Text GLabel 6950 4750 0    50   Input ~ 0
CELL_4
NoConn ~ 6950 4850
Text GLabel 6950 4950 0    50   Input ~ 0
A2
Text GLabel 6950 5050 0    50   Input ~ 0
A1
Text GLabel 6950 5150 0    50   Input ~ 0
A0
$Comp
L power:+3V3 #PWR?
U 1 1 64AB5BF6
P 6950 5250
F 0 "#PWR?" H 6950 5100 50  0001 C CNN
F 1 "+3V3" V 6965 5378 50  0000 L CNN
F 2 "" H 6950 5250 50  0001 C CNN
F 3 "" H 6950 5250 50  0001 C CNN
	1    6950 5250
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 64AB7D92
P 4050 4650
F 0 "#PWR?" H 4050 4500 50  0001 C CNN
F 1 "+3V3" H 4065 4823 50  0000 C CNN
F 2 "" H 4050 4650 50  0001 C CNN
F 3 "" H 4050 4650 50  0001 C CNN
	1    4050 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64AB86BF
P 4050 4950
F 0 "#PWR?" H 4050 4700 50  0001 C CNN
F 1 "GND" H 4055 4777 50  0000 C CNN
F 2 "" H 4050 4950 50  0001 C CNN
F 3 "" H 4050 4950 50  0001 C CNN
	1    4050 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 64AB8FC1
P 5050 4300
F 0 "#PWR?" H 5050 4150 50  0001 C CNN
F 1 "+3V3" H 5065 4473 50  0000 C CNN
F 2 "" H 5050 4300 50  0001 C CNN
F 3 "" H 5050 4300 50  0001 C CNN
	1    5050 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64AB952A
P 5050 5300
F 0 "#PWR?" H 5050 5050 50  0001 C CNN
F 1 "GND" H 5055 5127 50  0000 C CNN
F 2 "" H 5050 5300 50  0001 C CNN
F 3 "" H 5050 5300 50  0001 C CNN
	1    5050 5300
	1    0    0    -1  
$EndComp
Text GLabel 5450 4500 2    50   Input ~ 0
SDA
Text GLabel 5450 4600 2    50   Input ~ 0
SCL
Text GLabel 5450 5100 2    50   Input ~ 0
A2
Text GLabel 5450 5000 2    50   Input ~ 0
A1
Text GLabel 5450 4900 2    50   Input ~ 0
A0
Text GLabel 4650 4800 0    50   Input ~ 0
ALERT
Text GLabel 5450 3050 2    50   Input ~ 0
CELL_1
Text GLabel 5450 3150 2    50   Input ~ 0
CELL_2
Text GLabel 5450 3250 2    50   Input ~ 0
CELL_3
Text GLabel 5450 3550 2    50   Input ~ 0
CELL_6
Text GLabel 5450 3450 2    50   Input ~ 0
CELL_5
Text GLabel 5450 3350 2    50   Input ~ 0
CELL_4
Text GLabel 5450 3650 2    50   Input ~ 0
COMMON_1
Text GLabel 5450 3750 2    50   Input ~ 0
COMMON_2
$EndSCHEMATC
