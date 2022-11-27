EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Perovskite Contact Board"
Date "2022-11-26"
Rev "Version 1"
Comp "Aerospace eXperimental Payloads | UNL Aerospace Club"
Comment1 "Copyright (c) 2022"
Comment2 "Designer: JMMS"
Comment3 "Reviewer: WSA"
Comment4 "Approved: WSA"
$EndDescr
Text GLabel 4900 1650 0    50   Input ~ 0
CELL_1
Text GLabel 4900 1750 0    50   Input ~ 0
CELL_2
Text GLabel 4900 1850 0    50   Input ~ 0
CELL_3
Text GLabel 4900 1950 0    50   Input ~ 0
CELL_4
Text GLabel 4900 2050 0    50   Input ~ 0
CELL_5
Text GLabel 4900 2150 0    50   Input ~ 0
CELL_6
$Comp
L Perovskite:Perovskite_CP_6_Cell U1
U 1 1 636879E9
P 5350 1400
F 0 "U1" H 5300 1400 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 4950 1325 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 5350 1400 50  0001 C CNN
F 3 "" H 5350 1400 50  0001 C CNN
	1    5350 1400
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U2
U 1 1 6368D231
P 5375 3100
F 0 "U2" H 5325 3100 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 4975 3025 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 5375 3100 50  0001 C CNN
F 3 "" H 5375 3100 50  0001 C CNN
	1    5375 3100
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U3
U 1 1 63690578
P 5375 5000
F 0 "U3" H 5325 4975 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 5000 4900 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 5375 5000 50  0001 C CNN
F 3 "" H 5375 5000 50  0001 C CNN
	1    5375 5000
	1    0    0    -1  
$EndComp
Text GLabel 4925 3350 0    50   Input ~ 0
CELL_7
Text GLabel 4925 3450 0    50   Input ~ 0
CELL_8
Text GLabel 4925 3550 0    50   Input ~ 0
CELL_9
Text GLabel 4925 3650 0    50   Input ~ 0
CELL_10
Text GLabel 4925 3750 0    50   Input ~ 0
CELL_11
Text GLabel 4925 3850 0    50   Input ~ 0
CELL_12
Text GLabel 4925 5250 0    50   Input ~ 0
CELL_13
Text GLabel 4925 5350 0    50   Input ~ 0
CELL_14
Text GLabel 4925 5450 0    50   Input ~ 0
CELL_15
Text GLabel 4925 5550 0    50   Input ~ 0
CELL_16
Text GLabel 4925 5650 0    50   Input ~ 0
CELL_17
Text GLabel 4925 5750 0    50   Input ~ 0
CELL_18
Text GLabel 8450 2550 0    50   Input ~ 0
CELL_1
Text GLabel 8450 2350 0    50   Input ~ 0
CELL_2
Text GLabel 8450 2150 0    50   Input ~ 0
CELL_3
Text GLabel 8450 1500 0    50   Input ~ 0
CELL_4
Text GLabel 8450 1300 0    50   Input ~ 0
CELL_5
Text GLabel 8450 1100 0    50   Input ~ 0
CELL_6
Text GLabel 8450 3500 0    50   Input ~ 0
CELL_7
Text GLabel 8450 3100 0    50   Input ~ 0
CELL_8
Text GLabel 8450 2900 0    50   Input ~ 0
CELL_9
Text GLabel 8450 3850 0    50   Input ~ 0
CELL_10
Text GLabel 8450 4050 0    50   Input ~ 0
CELL_11
Text GLabel 8450 4250 0    50   Input ~ 0
CELL_12
Text GLabel 8450 6200 0    50   Input ~ 0
CELL_13
Text GLabel 8450 6000 0    50   Input ~ 0
CELL_14
Text GLabel 8450 5600 0    50   Input ~ 0
CELL_15
Text GLabel 8450 4650 0    50   Input ~ 0
CELL_16
Text GLabel 8450 5050 0    50   Input ~ 0
CELL_17
Text GLabel 8450 5250 0    50   Input ~ 0
CELL_18
Text GLabel 8450 4950 0    50   Input ~ 0
SDA_3
Text GLabel 8450 4750 0    50   Input ~ 0
SCL_3
$Comp
L Sensor_Temperature:MCP9808_MSOP U5
U 1 1 6369FACF
P 6850 3650
F 0 "U5" H 6925 4125 50  0000 L CNN
F 1 "MCP9808_MSOP" H 6925 4225 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 6850 3650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 6600 4100 50  0001 C CNN
	1    6850 3650
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U6
U 1 1 636A02E7
P 6850 5500
F 0 "U6" H 6925 6000 50  0000 L CNN
F 1 "MCP9808_MSOP" H 6925 6100 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 6850 5500 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 6600 5950 50  0001 C CNN
	1    6850 5500
	1    0    0    -1  
$EndComp
Text GLabel 6450 3350 0    50   Input ~ 0
SDA_2
Text GLabel 6450 3450 0    50   Input ~ 0
SCL_2
Text GLabel 6450 5200 0    50   Input ~ 0
SDA_3
Text GLabel 6450 5300 0    50   Input ~ 0
SCL_3
Text GLabel 7200 1850 2    50   Input ~ 0
ALERT1
Text GLabel 7250 3650 2    50   Input ~ 0
ALERT2
Text GLabel 7250 5500 2    50   Input ~ 0
ALERT3
Text GLabel 8450 5700 0    50   Input ~ 0
ALERT3
Text GLabel 8450 3000 0    50   Input ~ 0
ALERT2
Text GLabel 8450 2450 0    50   Input ~ 0
ALERT1
Text GLabel 8450 3950 0    50   Input ~ 0
SDA_2
Text GLabel 8450 3750 0    50   Input ~ 0
SCL_2
Text GLabel 8450 1400 0    50   Input ~ 0
SDA
Text GLabel 8450 1600 0    50   Input ~ 0
SCL
$Comp
L Connector_Generic:Conn_01x08 J1
U 1 1 636D4303
P 8650 1300
F 0 "J1" H 8730 1292 50  0000 L CNN
F 1 "Conn_01x08" H 8730 1201 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical_SMD_Pin1Left" H 8650 1300 50  0001 C CNN
F 3 "~" H 8650 1300 50  0001 C CNN
	1    8650 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 636D541F
P 8650 2150
F 0 "J2" H 8730 2142 50  0000 L CNN
F 1 "Conn_01x08" H 8730 2051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical_SMD_Pin1Left" H 8650 2150 50  0001 C CNN
F 3 "~" H 8650 2150 50  0001 C CNN
	1    8650 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 636D5BFB
P 8650 3100
F 0 "J3" H 8730 3092 50  0000 L CNN
F 1 "Conn_01x08" H 8730 3001 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical_SMD_Pin1Left" H 8650 3100 50  0001 C CNN
F 3 "~" H 8650 3100 50  0001 C CNN
	1    8650 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J5
U 1 1 636D877C
P 8650 4950
F 0 "J5" H 8730 4942 50  0000 L CNN
F 1 "Conn_01x08" H 8730 4851 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical_SMD_Pin1Left" H 8650 4950 50  0001 C CNN
F 3 "~" H 8650 4950 50  0001 C CNN
	1    8650 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J6
U 1 1 636D8782
P 8650 5800
F 0 "J6" H 8730 5792 50  0000 L CNN
F 1 "Conn_01x08" H 8730 5701 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical_SMD_Pin1Left" H 8650 5800 50  0001 C CNN
F 3 "~" H 8650 5800 50  0001 C CNN
	1    8650 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 636DAE21
P 6850 6150
F 0 "#PWR0114" H 6850 5900 50  0001 C CNN
F 1 "GND" H 6855 5977 50  0000 C CNN
F 2 "" H 6850 6150 50  0001 C CNN
F 3 "" H 6850 6150 50  0001 C CNN
	1    6850 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 636DB638
P 6850 4250
F 0 "#PWR0115" H 6850 4000 50  0001 C CNN
F 1 "GND" H 6855 4077 50  0000 C CNN
F 2 "" H 6850 4250 50  0001 C CNN
F 3 "" H 6850 4250 50  0001 C CNN
	1    6850 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 636DC750
P 6800 2400
F 0 "#PWR0118" H 6800 2150 50  0001 C CNN
F 1 "GND" H 6805 2227 50  0000 C CNN
F 2 "" H 6800 2400 50  0001 C CNN
F 3 "" H 6800 2400 50  0001 C CNN
	1    6800 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J4
U 1 1 636D68B2
P 8650 3950
F 0 "J4" H 8730 3942 50  0000 L CNN
F 1 "Conn_01x08" H 8730 3851 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical_SMD_Pin1Left" H 8650 3950 50  0001 C CNN
F 3 "~" H 8650 3950 50  0001 C CNN
	1    8650 3950
	1    0    0    -1  
$EndComp
Text Notes 2550 1825 0    197  ~ 0
Perovskite 1
Text Notes 2550 3575 0    197  ~ 0
Perovskite 2
Text Notes 2550 5325 0    197  ~ 0
Perovskite 3
Wire Notes Line
	9200 2675 2325 2675
Wire Notes Line
	2325 900  9200 900 
Wire Notes Line
	9200 6400 2325 6400
Wire Notes Line
	2325 4525 9200 4525
Wire Notes Line
	9200 900  9200 6400
Wire Notes Line
	2325 900  2325 6400
Wire Wire Line
	8450 1850 8000 1850
Wire Wire Line
	8450 1950 8000 1950
Wire Wire Line
	8000 1850 8000 1950
Connection ~ 8000 1950
Wire Wire Line
	8450 2050 8000 2050
Wire Wire Line
	8450 2250 8000 2250
Wire Wire Line
	8000 2250 8000 2050
Connection ~ 8000 2050
Wire Wire Line
	8450 5900 8000 5900
Wire Wire Line
	8000 5900 8000 5800
Wire Wire Line
	8450 5800 8000 5800
Connection ~ 8000 5800
Wire Wire Line
	8000 5800 8000 5500
Wire Wire Line
	8450 5500 8000 5500
Connection ~ 8000 5500
Wire Wire Line
	8450 5150 8000 5150
Wire Wire Line
	8450 4850 8000 4850
Wire Wire Line
	8000 4850 8000 5150
Connection ~ 8000 5150
Wire Wire Line
	8450 4150 8000 4150
Wire Wire Line
	8000 4150 8000 3300
Wire Wire Line
	8000 2800 8450 2800
Wire Wire Line
	8450 3200 8000 3200
Connection ~ 8000 3200
Wire Wire Line
	8450 3300 8000 3300
Connection ~ 8000 3300
Wire Wire Line
	8000 3300 8000 3200
Text GLabel 4925 5850 0    50   Input ~ 0
CP_3
Text GLabel 8450 3650 0    50   Input ~ 0
CP_2
Text GLabel 4925 3950 0    50   Input ~ 0
CP_2
Text GLabel 8450 1700 0    50   Input ~ 0
CP_3
Text GLabel 8450 1000 0    50   Input ~ 0
CP
Text GLabel 4900 2250 0    50   Input ~ 0
CP
$Comp
L Sensor_Temperature:MCP9808_MSOP U4
U 1 1 6369EDDD
P 6800 1850
F 0 "U4" H 6875 2325 50  0000 L CNN
F 1 "MCP9808_MSOP" H 6875 2425 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 6800 1850 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 6550 2300 50  0001 C CNN
	1    6800 1850
	1    0    0    -1  
$EndComp
Text GLabel 6400 1550 0    50   Input ~ 0
SDA
Text GLabel 6400 1650 0    50   Input ~ 0
SCL
Wire Wire Line
	8450 1200 6800 1200
Wire Wire Line
	6800 1200 6800 1350
Wire Wire Line
	6800 1200 6150 1200
Wire Wire Line
	6150 1200 6150 1950
Wire Wire Line
	6150 1950 6400 1950
Connection ~ 6800 1200
Wire Wire Line
	6400 2050 6350 2050
Wire Wire Line
	6350 2050 6350 2150
Wire Wire Line
	6400 2150 6350 2150
Connection ~ 6350 2150
Wire Wire Line
	6350 2150 6350 2400
Wire Wire Line
	6800 2400 6800 2350
$Comp
L power:GND #PWR0101
U 1 1 63849F8B
P 6350 2400
F 0 "#PWR0101" H 6350 2150 50  0001 C CNN
F 1 "GND" H 6355 2227 50  0000 C CNN
F 2 "" H 6350 2400 50  0001 C CNN
F 3 "" H 6350 2400 50  0001 C CNN
	1    6350 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6384AE9A
P 8000 2400
F 0 "#PWR0102" H 8000 2150 50  0001 C CNN
F 1 "GND" H 8005 2227 50  0000 C CNN
F 2 "" H 8000 2400 50  0001 C CNN
F 3 "" H 8000 2400 50  0001 C CNN
	1    8000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2400 8000 2250
Wire Wire Line
	8000 1950 8000 2050
Connection ~ 8000 2250
Wire Wire Line
	8000 2800 8000 3200
$Comp
L power:GND #PWR0103
U 1 1 6384C4C7
P 8000 4250
F 0 "#PWR0103" H 8000 4000 50  0001 C CNN
F 1 "GND" H 8005 4077 50  0000 C CNN
F 2 "" H 8000 4250 50  0001 C CNN
F 3 "" H 8000 4250 50  0001 C CNN
	1    8000 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4250 8000 4150
Connection ~ 8000 4150
Wire Wire Line
	6850 3150 6850 2950
Wire Wire Line
	6850 2950 6100 2950
Wire Wire Line
	6100 2950 6100 3750
Wire Wire Line
	6100 3850 6450 3850
$Comp
L power:GND #PWR0104
U 1 1 63850003
P 6400 4250
F 0 "#PWR0104" H 6400 4000 50  0001 C CNN
F 1 "GND" H 6405 4077 50  0000 C CNN
F 2 "" H 6400 4250 50  0001 C CNN
F 3 "" H 6400 4250 50  0001 C CNN
	1    6400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3950 6400 3950
Wire Wire Line
	6400 3950 6400 4250
Wire Wire Line
	6850 4150 6850 4250
Wire Wire Line
	8450 3400 7900 3400
Wire Wire Line
	7900 3400 7900 2950
Wire Wire Line
	7900 2950 6850 2950
Connection ~ 6850 2950
Wire Wire Line
	8000 5150 8000 5500
$Comp
L power:GND #PWR0105
U 1 1 63853FBE
P 8000 6150
F 0 "#PWR0105" H 8000 5900 50  0001 C CNN
F 1 "GND" H 8005 5977 50  0000 C CNN
F 2 "" H 8000 6150 50  0001 C CNN
F 3 "" H 8000 6150 50  0001 C CNN
	1    8000 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 6150 8000 5900
Connection ~ 8000 5900
Wire Wire Line
	8450 5350 7900 5350
Wire Wire Line
	7900 5350 7900 4800
Wire Wire Line
	7900 4800 6850 4800
Wire Wire Line
	6850 4800 6850 5000
Wire Wire Line
	6850 4800 6150 4800
Wire Wire Line
	6150 4800 6150 5600
Connection ~ 6850 4800
Wire Wire Line
	6150 5800 6450 5800
Wire Wire Line
	6850 6000 6850 6150
Wire Wire Line
	6100 3750 6450 3750
Connection ~ 6100 3750
Wire Wire Line
	6100 3750 6100 3850
Wire Wire Line
	6150 5600 6450 5600
Connection ~ 6150 5600
Wire Wire Line
	6150 5600 6150 5700
Wire Wire Line
	6150 5700 6450 5700
Connection ~ 6150 5700
Wire Wire Line
	6150 5700 6150 5800
$EndSCHEMATC
