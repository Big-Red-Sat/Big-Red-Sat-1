EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Payload Perovskite Holder "
Date "2023-08-12"
Rev "A"
Comp "Aerospace eXperimental Payloads | UNL Aerospace Club"
Comment1 "Copyright (c) 2023"
Comment2 "Designer: WSA"
Comment3 "Reviewer: WSA"
Comment4 "Approved: WSA"
$EndDescr
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
Text GLabel 6950 2950 0    50   Input ~ 0
CELL_1
Text GLabel 6950 3050 0    50   Input ~ 0
CELL_2
Text GLabel 6950 3150 0    50   Input ~ 0
CELL_3
$Comp
L power:GND #PWR0101
U 1 1 64AAD583
P 6950 3350
F 0 "#PWR0101" H 6950 3100 50  0001 C CNN
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
L power:+3V3 #PWR0102
U 1 1 64AB5BF6
P 6950 5250
F 0 "#PWR0102" H 6950 5100 50  0001 C CNN
F 1 "+3V3" V 6965 5378 50  0000 L CNN
F 2 "" H 6950 5250 50  0001 C CNN
F 3 "" H 6950 5250 50  0001 C CNN
	1    6950 5250
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0105
U 1 1 64AB8FC1
P 5050 3850
F 0 "#PWR0105" H 5050 3700 50  0001 C CNN
F 1 "+3V3" H 5065 4023 50  0000 C CNN
F 2 "" H 5050 3850 50  0001 C CNN
F 3 "" H 5050 3850 50  0001 C CNN
	1    5050 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 64AB952A
P 4850 5000
F 0 "#PWR0106" H 4850 4750 50  0001 C CNN
F 1 "GND" H 4855 4827 50  0000 C CNN
F 2 "" H 4850 5000 50  0001 C CNN
F 3 "" H 4850 5000 50  0001 C CNN
	1    4850 5000
	1    0    0    -1  
$EndComp
Text GLabel 4600 4400 2    50   Input ~ 0
SDA
Text GLabel 4600 4500 2    50   Input ~ 0
SCL
Text GLabel 4600 4200 2    50   Input ~ 0
CELL_1
Text GLabel 4600 4100 2    50   Input ~ 0
CELL_2
Text GLabel 4600 4000 2    50   Input ~ 0
CELL_3
Text GLabel 4600 3900 2    50   Input ~ 0
CELL_6
Text GLabel 4600 3800 2    50   Input ~ 0
CELL_5
Text GLabel 4600 3700 2    50   Input ~ 0
CELL_4
Text GLabel 5450 4250 2    50   Input ~ 0
COMMON_1
Text GLabel 5450 4350 2    50   Input ~ 0
COMMON_2
$Comp
L Connector:Conn_01x11_Male J3
U 1 1 64D788EF
P 4400 4200
F 0 "J3" H 4508 4789 50  0000 C CNN
F 1 "Conn_01x11_Male" H 4508 4790 50  0001 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x11_P1.27mm_Vertical" H 4400 4200 50  0001 C CNN
F 3 "~" H 4400 4200 50  0001 C CNN
	1    4400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4250 5400 4250
Wire Wire Line
	5400 4250 5400 4300
Wire Wire Line
	5400 4350 5450 4350
Wire Wire Line
	5400 4300 4600 4300
Connection ~ 5400 4300
Wire Wire Line
	5400 4300 5400 4350
Wire Wire Line
	4600 4600 4850 4600
Wire Wire Line
	4850 4600 4850 5000
Wire Wire Line
	4600 4700 5050 4700
Wire Wire Line
	5050 4700 5050 3850
$EndSCHEMATC
