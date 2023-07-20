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
Comment4 "Approved: "
$EndDescr
Text GLabel 5050 1550 0    50   Input ~ 0
CELL_1
Text GLabel 5050 1650 0    50   Input ~ 0
CELL_2
Text GLabel 5050 1750 0    50   Input ~ 0
CELL_3
Text GLabel 5050 1850 0    50   Input ~ 0
CELL_4
Text GLabel 5050 1950 0    50   Input ~ 0
CELL_5
Text GLabel 5050 2050 0    50   Input ~ 0
CELL_6
$Comp
L Perovskite:Perovskite_CP_6_Cell U1
U 1 1 636879E9
P 5500 1300
F 0 "U1" H 5450 1300 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 5100 1225 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 5500 1300 50  0001 C CNN
F 3 "" H 5500 1300 50  0001 C CNN
	1    5500 1300
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U2
U 1 1 6368D231
P 5525 3000
F 0 "U2" H 5475 3000 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 5125 2925 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 5525 3000 50  0001 C CNN
F 3 "" H 5525 3000 50  0001 C CNN
	1    5525 3000
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U3
U 1 1 63690578
P 5525 4900
F 0 "U3" H 5475 4875 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 5150 4800 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 5525 4900 50  0001 C CNN
F 3 "" H 5525 4900 50  0001 C CNN
	1    5525 4900
	1    0    0    -1  
$EndComp
Text GLabel 5075 3250 0    50   Input ~ 0
CELL_7
Text GLabel 5075 3350 0    50   Input ~ 0
CELL_8
Text GLabel 5075 3450 0    50   Input ~ 0
CELL_9
Text GLabel 5075 3550 0    50   Input ~ 0
CELL_10
Text GLabel 5075 3650 0    50   Input ~ 0
CELL_11
Text GLabel 5075 3750 0    50   Input ~ 0
CELL_12
Text GLabel 5075 5150 0    50   Input ~ 0
CELL_13
Text GLabel 5075 5250 0    50   Input ~ 0
CELL_14
Text GLabel 5075 5350 0    50   Input ~ 0
CELL_15
Text GLabel 5075 5450 0    50   Input ~ 0
CELL_16
Text GLabel 5075 5550 0    50   Input ~ 0
CELL_17
Text GLabel 5075 5650 0    50   Input ~ 0
CELL_18
Text GLabel 8500 1050 0    50   Input ~ 0
CELL_1
Text GLabel 8500 1250 0    50   Input ~ 0
CELL_2
Text GLabel 8500 1450 0    50   Input ~ 0
CELL_3
Text GLabel 8500 1650 0    50   Input ~ 0
CELL_4
Text GLabel 8500 1850 0    50   Input ~ 0
CELL_5
Text GLabel 8500 2050 0    50   Input ~ 0
CELL_6
Text GLabel 8500 2950 0    50   Input ~ 0
CELL_7
Text GLabel 8500 3150 0    50   Input ~ 0
CELL_8
Text GLabel 8500 3350 0    50   Input ~ 0
CELL_9
Text GLabel 8500 3550 0    50   Input ~ 0
CELL_10
Text GLabel 8500 3750 0    50   Input ~ 0
CELL_11
Text GLabel 8500 3950 0    50   Input ~ 0
CELL_12
Text GLabel 8450 5400 0    50   Input ~ 0
CELL_16
$Comp
L Sensor_Temperature:MCP9808_MSOP U5
U 1 1 6369FACF
P 7000 3550
F 0 "U5" H 7075 4025 50  0000 L CNN
F 1 "MCP9808_MSOP" H 7075 4125 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 7000 3550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 6750 4000 50  0001 C CNN
	1    7000 3550
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U6
U 1 1 636A02E7
P 7000 5400
F 0 "U6" H 7075 5900 50  0000 L CNN
F 1 "MCP9808_MSOP" H 7075 6000 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 7000 5400 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 6750 5850 50  0001 C CNN
	1    7000 5400
	1    0    0    -1  
$EndComp
Text GLabel 6600 3250 0    50   Input ~ 0
SDA
Text GLabel 6600 3350 0    50   Input ~ 0
SCL
Text GLabel 6600 5100 0    50   Input ~ 0
SDA
Text GLabel 6600 5200 0    50   Input ~ 0
SCL
$Comp
L power:GND #PWR0114
U 1 1 636DAE21
P 7000 6050
F 0 "#PWR0114" H 7000 5800 50  0001 C CNN
F 1 "GND" H 7005 5877 50  0000 C CNN
F 2 "" H 7000 6050 50  0001 C CNN
F 3 "" H 7000 6050 50  0001 C CNN
	1    7000 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 636DB638
P 7000 4150
F 0 "#PWR0115" H 7000 3900 50  0001 C CNN
F 1 "GND" H 7005 3977 50  0000 C CNN
F 2 "" H 7000 4150 50  0001 C CNN
F 3 "" H 7000 4150 50  0001 C CNN
	1    7000 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 636DC750
P 6950 2300
F 0 "#PWR0118" H 6950 2050 50  0001 C CNN
F 1 "GND" H 6955 2127 50  0000 C CNN
F 2 "" H 6950 2300 50  0001 C CNN
F 3 "" H 6950 2300 50  0001 C CNN
	1    6950 2300
	1    0    0    -1  
$EndComp
Text Notes 2700 1725 0    197  ~ 0
Perovskite 1
Text Notes 2700 3475 0    197  ~ 0
Perovskite 2
Text Notes 2700 5225 0    197  ~ 0
Perovskite 3
Wire Notes Line
	2475 800  9350 800 
Wire Notes Line
	9350 6300 2475 6300
Wire Notes Line
	2475 4425 9350 4425
Wire Notes Line
	9350 800  9350 6300
Wire Notes Line
	2475 800  2475 6300
Text GLabel 5075 5750 0    50   Input ~ 0
CP_3
Text GLabel 8500 4150 0    50   Input ~ 0
CP_2
Text GLabel 5075 3850 0    50   Input ~ 0
CP_2
Text GLabel 8450 6000 0    50   Input ~ 0
CP_3
Text GLabel 5050 2150 0    50   Input ~ 0
CP_1
$Comp
L Sensor_Temperature:MCP9808_MSOP U4
U 1 1 6369EDDD
P 6950 1750
F 0 "U4" H 7025 2225 50  0000 L CNN
F 1 "MCP9808_MSOP" H 7025 2325 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 6950 1750 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 6700 2200 50  0001 C CNN
	1    6950 1750
	1    0    0    -1  
$EndComp
Text GLabel 6550 1450 0    50   Input ~ 0
SDA
Text GLabel 6550 1550 0    50   Input ~ 0
SCL
Wire Wire Line
	6950 1100 6950 1250
Wire Wire Line
	6950 1100 6650 1100
Wire Wire Line
	6300 1100 6300 1850
Wire Wire Line
	6300 1850 6550 1850
Wire Wire Line
	6550 1950 6500 1950
Wire Wire Line
	6500 1950 6500 2050
Wire Wire Line
	6550 2050 6500 2050
Connection ~ 6500 2050
Wire Wire Line
	6500 2050 6500 2300
Wire Wire Line
	6950 2300 6950 2250
$Comp
L power:GND #PWR0101
U 1 1 63849F8B
P 6500 2300
F 0 "#PWR0101" H 6500 2050 50  0001 C CNN
F 1 "GND" H 6505 2127 50  0000 C CNN
F 2 "" H 6500 2300 50  0001 C CNN
F 3 "" H 6500 2300 50  0001 C CNN
	1    6500 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3050 7000 2850
Wire Wire Line
	7000 2850 6650 2850
Wire Wire Line
	6250 2850 6250 3650
Wire Wire Line
	6250 3750 6600 3750
$Comp
L power:GND #PWR0104
U 1 1 63850003
P 6550 4150
F 0 "#PWR0104" H 6550 3900 50  0001 C CNN
F 1 "GND" H 6555 3977 50  0000 C CNN
F 2 "" H 6550 4150 50  0001 C CNN
F 3 "" H 6550 4150 50  0001 C CNN
	1    6550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3850 6550 3850
Wire Wire Line
	6550 3850 6550 4150
Wire Wire Line
	7000 4050 7000 4150
Wire Wire Line
	7000 4700 7000 4900
Wire Wire Line
	7000 4700 6650 4700
Wire Wire Line
	6300 4700 6300 5500
Wire Wire Line
	6300 5700 6600 5700
Wire Wire Line
	7000 5900 7000 6050
Wire Wire Line
	6250 3650 6600 3650
Connection ~ 6250 3650
Wire Wire Line
	6250 3650 6250 3750
Wire Wire Line
	6300 5500 6600 5500
Connection ~ 6300 5500
Wire Wire Line
	6300 5500 6300 5600
Wire Wire Line
	6300 5600 6600 5600
Connection ~ 6300 5600
Wire Wire Line
	6300 5600 6300 5700
$Comp
L Connector_Generic:Conn_01x01 JP100.1
U 1 1 64B48B55
P 8700 1050
F 0 "JP100.1" H 8780 1092 50  0000 L CNN
F 1 "Conn_01x01" H 8780 1001 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 1050 50  0001 C CNN
F 3 "~" H 8700 1050 50  0001 C CNN
	1    8700 1050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.2
U 1 1 64B50405
P 8700 1250
F 0 "JP100.2" H 8780 1292 50  0000 L CNN
F 1 "Conn_01x01" H 8780 1201 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 1250 50  0001 C CNN
F 3 "~" H 8700 1250 50  0001 C CNN
	1    8700 1250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.3
U 1 1 64B50664
P 8700 1450
F 0 "JP100.3" H 8780 1492 50  0000 L CNN
F 1 "Conn_01x01" H 8780 1401 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 1450 50  0001 C CNN
F 3 "~" H 8700 1450 50  0001 C CNN
	1    8700 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.4
U 1 1 64B50942
P 8700 1650
F 0 "JP100.4" H 8780 1692 50  0000 L CNN
F 1 "Conn_01x01" H 8780 1601 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 1650 50  0001 C CNN
F 3 "~" H 8700 1650 50  0001 C CNN
	1    8700 1650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.5
U 1 1 64B54D8C
P 8700 1850
F 0 "JP100.5" H 8780 1892 50  0000 L CNN
F 1 "Conn_01x01" H 8780 1801 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 1850 50  0001 C CNN
F 3 "~" H 8700 1850 50  0001 C CNN
	1    8700 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.6
U 1 1 64B54D92
P 8700 2050
F 0 "JP100.6" H 8780 2092 50  0000 L CNN
F 1 "Conn_01x01" H 8780 2001 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 2050 50  0001 C CNN
F 3 "~" H 8700 2050 50  0001 C CNN
	1    8700 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.7
U 1 1 64B54D98
P 8700 2250
F 0 "JP100.7" H 8780 2292 50  0000 L CNN
F 1 "Conn_01x01" H 8780 2201 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 2250 50  0001 C CNN
F 3 "~" H 8700 2250 50  0001 C CNN
	1    8700 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.1
U 1 1 64B54D9E
P 8700 2950
F 0 "JP101.1" H 8780 2992 50  0000 L CNN
F 1 "Conn_01x01" H 8780 2901 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 2950 50  0001 C CNN
F 3 "~" H 8700 2950 50  0001 C CNN
	1    8700 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.2
U 1 1 64B5722D
P 8700 3150
F 0 "JP101.2" H 8780 3192 50  0000 L CNN
F 1 "Conn_01x01" H 8780 3101 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 3150 50  0001 C CNN
F 3 "~" H 8700 3150 50  0001 C CNN
	1    8700 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.3
U 1 1 64B57233
P 8700 3350
F 0 "JP101.3" H 8780 3392 50  0000 L CNN
F 1 "Conn_01x01" H 8780 3301 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 3350 50  0001 C CNN
F 3 "~" H 8700 3350 50  0001 C CNN
	1    8700 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.4
U 1 1 64B57239
P 8700 3550
F 0 "JP101.4" H 8780 3592 50  0000 L CNN
F 1 "Conn_01x01" H 8780 3501 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 3550 50  0001 C CNN
F 3 "~" H 8700 3550 50  0001 C CNN
	1    8700 3550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.5
U 1 1 64B5723F
P 8700 3750
F 0 "JP101.5" H 8780 3792 50  0000 L CNN
F 1 "Conn_01x01" H 8780 3701 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 3750 50  0001 C CNN
F 3 "~" H 8700 3750 50  0001 C CNN
	1    8700 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.6
U 1 1 64B591F4
P 8700 3950
F 0 "JP101.6" H 8780 3992 50  0000 L CNN
F 1 "Conn_01x01" H 8780 3901 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 3950 50  0001 C CNN
F 3 "~" H 8700 3950 50  0001 C CNN
	1    8700 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.7
U 1 1 64B591FA
P 8700 4150
F 0 "JP101.7" H 8780 4192 50  0000 L CNN
F 1 "Conn_01x01" H 8780 4101 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8700 4150 50  0001 C CNN
F 3 "~" H 8700 4150 50  0001 C CNN
	1    8700 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.1
U 1 1 64B59200
P 8650 4800
F 0 "JP102.1" H 8730 4842 50  0000 L CNN
F 1 "Conn_01x01" H 8730 4751 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8650 4800 50  0001 C CNN
F 3 "~" H 8650 4800 50  0001 C CNN
	1    8650 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.2
U 1 1 64B59206
P 8650 5000
F 0 "JP102.2" H 8730 5042 50  0000 L CNN
F 1 "Conn_01x01" H 8730 4951 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8650 5000 50  0001 C CNN
F 3 "~" H 8650 5000 50  0001 C CNN
	1    8650 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.3
U 1 1 64B5B299
P 8650 5200
F 0 "JP102.3" H 8730 5242 50  0000 L CNN
F 1 "Conn_01x01" H 8730 5151 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8650 5200 50  0001 C CNN
F 3 "~" H 8650 5200 50  0001 C CNN
	1    8650 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.4
U 1 1 64B5B29F
P 8650 5400
F 0 "JP102.4" H 8730 5442 50  0000 L CNN
F 1 "Conn_01x01" H 8730 5351 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8650 5400 50  0001 C CNN
F 3 "~" H 8650 5400 50  0001 C CNN
	1    8650 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.5
U 1 1 64B5B2A5
P 8650 5600
F 0 "JP102.5" H 8730 5642 50  0000 L CNN
F 1 "Conn_01x01" H 8730 5551 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8650 5600 50  0001 C CNN
F 3 "~" H 8650 5600 50  0001 C CNN
	1    8650 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.6
U 1 1 64B5B2AB
P 8650 5800
F 0 "JP102.6" H 8730 5842 50  0000 L CNN
F 1 "Conn_01x01" H 8730 5751 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8650 5800 50  0001 C CNN
F 3 "~" H 8650 5800 50  0001 C CNN
	1    8650 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.7
U 1 1 64B5D0F6
P 8650 6000
F 0 "JP102.7" H 8730 6042 50  0000 L CNN
F 1 "Conn_01x01" H 8730 5951 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8650 6000 50  0001 C CNN
F 3 "~" H 8650 6000 50  0001 C CNN
	1    8650 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP103.1
U 1 1 64B5D0FC
P 5600 6950
F 0 "JP103.1" H 5680 6992 50  0000 L CNN
F 1 "Conn_01x01" H 5680 6901 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5600 6950 50  0001 C CNN
F 3 "~" H 5600 6950 50  0001 C CNN
	1    5600 6950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP103.2
U 1 1 64B5D102
P 5600 7150
F 0 "JP103.2" H 5680 7192 50  0000 L CNN
F 1 "Conn_01x01" H 5680 7101 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5600 7150 50  0001 C CNN
F 3 "~" H 5600 7150 50  0001 C CNN
	1    5600 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP103.3
U 1 1 64B5D108
P 5600 7350
F 0 "JP103.3" H 5680 7392 50  0000 L CNN
F 1 "Conn_01x01" H 5680 7301 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5600 7350 50  0001 C CNN
F 3 "~" H 5600 7350 50  0001 C CNN
	1    5600 7350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP103.4
U 1 1 64B7D4E1
P 5600 7550
F 0 "JP103.4" H 5680 7592 50  0000 L CNN
F 1 "Conn_01x01" H 5680 7501 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5600 7550 50  0001 C CNN
F 3 "~" H 5600 7550 50  0001 C CNN
	1    5600 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 64BAB42F
P 5050 7300
F 0 "#PWR0102" H 5050 7050 50  0001 C CNN
F 1 "GND" H 5055 7127 50  0000 C CNN
F 2 "" H 5050 7300 50  0001 C CNN
F 3 "" H 5050 7300 50  0001 C CNN
	1    5050 7300
	1    0    0    -1  
$EndComp
Text GLabel 5400 7550 0    50   Input ~ 0
SDA
Text GLabel 5400 7350 0    50   Input ~ 0
SCL
Wire Wire Line
	5400 6950 5050 6950
Wire Wire Line
	5050 6950 5050 7300
$Comp
L power:VDD #PWR0103
U 1 1 64BB3055
P 5300 6750
F 0 "#PWR0103" H 5300 6600 50  0001 C CNN
F 1 "VDD" H 5315 6923 50  0000 C CNN
F 2 "" H 5300 6750 50  0001 C CNN
F 3 "" H 5300 6750 50  0001 C CNN
	1    5300 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7150 5300 7150
Wire Wire Line
	5300 7150 5300 6750
NoConn ~ 7400 5400
NoConn ~ 7400 3550
NoConn ~ 7350 1750
Wire Notes Line
	9350 2575 2475 2575
$Comp
L power:VDD #PWR0105
U 1 1 64BC9726
P 6650 4700
F 0 "#PWR0105" H 6650 4550 50  0001 C CNN
F 1 "VDD" H 6665 4873 50  0000 C CNN
F 2 "" H 6650 4700 50  0001 C CNN
F 3 "" H 6650 4700 50  0001 C CNN
	1    6650 4700
	1    0    0    -1  
$EndComp
Connection ~ 6650 4700
Wire Wire Line
	6650 4700 6300 4700
$Comp
L power:VDD #PWR0106
U 1 1 64BCA3BE
P 6650 2850
F 0 "#PWR0106" H 6650 2700 50  0001 C CNN
F 1 "VDD" H 6665 3023 50  0000 C CNN
F 2 "" H 6650 2850 50  0001 C CNN
F 3 "" H 6650 2850 50  0001 C CNN
	1    6650 2850
	1    0    0    -1  
$EndComp
Connection ~ 6650 2850
Wire Wire Line
	6650 2850 6250 2850
$Comp
L power:VDD #PWR0107
U 1 1 64BCB08F
P 6650 1100
F 0 "#PWR0107" H 6650 950 50  0001 C CNN
F 1 "VDD" H 6665 1273 50  0000 C CNN
F 2 "" H 6650 1100 50  0001 C CNN
F 3 "" H 6650 1100 50  0001 C CNN
	1    6650 1100
	1    0    0    -1  
$EndComp
Connection ~ 6650 1100
Wire Wire Line
	6650 1100 6300 1100
Text GLabel 8450 5800 0    50   Input ~ 0
CELL_18
Text GLabel 8450 5600 0    50   Input ~ 0
CELL_17
Text GLabel 8450 5200 0    50   Input ~ 0
CELL_15
Text GLabel 8450 5000 0    50   Input ~ 0
CELL_14
Text GLabel 8450 4800 0    50   Input ~ 0
CELL_13
Text GLabel 8500 2250 0    50   Input ~ 0
CP_1
$EndSCHEMATC
