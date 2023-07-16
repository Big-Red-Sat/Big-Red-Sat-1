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
Text GLabel 3550 1650 0    50   Input ~ 0
CELL_1
Text GLabel 3550 1750 0    50   Input ~ 0
CELL_2
Text GLabel 3550 1850 0    50   Input ~ 0
CELL_3
Text GLabel 3550 1950 0    50   Input ~ 0
CELL_4
Text GLabel 3550 2050 0    50   Input ~ 0
CELL_5
Text GLabel 3550 2150 0    50   Input ~ 0
CELL_6
$Comp
L Perovskite:Perovskite_CP_6_Cell U1
U 1 1 636879E9
P 4000 1400
F 0 "U1" H 3950 1400 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 3600 1325 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 4000 1400 50  0001 C CNN
F 3 "" H 4000 1400 50  0001 C CNN
	1    4000 1400
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U2
U 1 1 6368D231
P 4025 3100
F 0 "U2" H 3975 3100 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 3625 3025 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 4025 3100 50  0001 C CNN
F 3 "" H 4025 3100 50  0001 C CNN
	1    4025 3100
	1    0    0    -1  
$EndComp
$Comp
L Perovskite:Perovskite_CP_6_Cell U3
U 1 1 63690578
P 4025 5000
F 0 "U3" H 3975 4975 50  0000 L CNN
F 1 "Perovskite_CP_6_Cell" H 3650 4900 50  0000 L CNN
F 2 "Perovskite:Perovskite" H 4025 5000 50  0001 C CNN
F 3 "" H 4025 5000 50  0001 C CNN
	1    4025 5000
	1    0    0    -1  
$EndComp
Text GLabel 3575 3350 0    50   Input ~ 0
CELL_7
Text GLabel 3575 3450 0    50   Input ~ 0
CELL_8
Text GLabel 3575 3550 0    50   Input ~ 0
CELL_9
Text GLabel 3575 3650 0    50   Input ~ 0
CELL_10
Text GLabel 3575 3750 0    50   Input ~ 0
CELL_11
Text GLabel 3575 3850 0    50   Input ~ 0
CELL_12
Text GLabel 3575 5250 0    50   Input ~ 0
CELL_13
Text GLabel 3575 5350 0    50   Input ~ 0
CELL_14
Text GLabel 3575 5450 0    50   Input ~ 0
CELL_15
Text GLabel 3575 5550 0    50   Input ~ 0
CELL_16
Text GLabel 3575 5650 0    50   Input ~ 0
CELL_17
Text GLabel 3575 5750 0    50   Input ~ 0
CELL_18
Text GLabel 7000 1150 0    50   Input ~ 0
CELL_1
Text GLabel 7000 1350 0    50   Input ~ 0
CELL_2
Text GLabel 7000 1550 0    50   Input ~ 0
CELL_3
Text GLabel 7000 1750 0    50   Input ~ 0
CELL_4
Text GLabel 7000 1950 0    50   Input ~ 0
CELL_5
Text GLabel 7000 2150 0    50   Input ~ 0
CELL_6
Text GLabel 7000 3050 0    50   Input ~ 0
CELL_7
Text GLabel 7000 3250 0    50   Input ~ 0
CELL_8
Text GLabel 7000 3450 0    50   Input ~ 0
CELL_9
Text GLabel 7000 3650 0    50   Input ~ 0
CELL_10
Text GLabel 7000 3850 0    50   Input ~ 0
CELL_11
Text GLabel 7000 4050 0    50   Input ~ 0
CELL_12
Text GLabel 6950 5900 0    50   Input ~ 0
CELL_16
$Comp
L Sensor_Temperature:MCP9808_MSOP U5
U 1 1 6369FACF
P 5500 3650
F 0 "U5" H 5575 4125 50  0000 L CNN
F 1 "MCP9808_MSOP" H 5575 4225 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 5500 3650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5250 4100 50  0001 C CNN
	1    5500 3650
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U6
U 1 1 636A02E7
P 5500 5500
F 0 "U6" H 5575 6000 50  0000 L CNN
F 1 "MCP9808_MSOP" H 5575 6100 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 5500 5500 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5250 5950 50  0001 C CNN
	1    5500 5500
	1    0    0    -1  
$EndComp
Text GLabel 5100 3350 0    50   Input ~ 0
SDA
Text GLabel 5100 3450 0    50   Input ~ 0
SCL
Text GLabel 5100 5200 0    50   Input ~ 0
SDA
Text GLabel 5100 5300 0    50   Input ~ 0
SCL
$Comp
L power:GND #PWR0114
U 1 1 636DAE21
P 5500 6150
F 0 "#PWR0114" H 5500 5900 50  0001 C CNN
F 1 "GND" H 5505 5977 50  0000 C CNN
F 2 "" H 5500 6150 50  0001 C CNN
F 3 "" H 5500 6150 50  0001 C CNN
	1    5500 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 636DB638
P 5500 4250
F 0 "#PWR0115" H 5500 4000 50  0001 C CNN
F 1 "GND" H 5505 4077 50  0000 C CNN
F 2 "" H 5500 4250 50  0001 C CNN
F 3 "" H 5500 4250 50  0001 C CNN
	1    5500 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 636DC750
P 5450 2400
F 0 "#PWR0118" H 5450 2150 50  0001 C CNN
F 1 "GND" H 5455 2227 50  0000 C CNN
F 2 "" H 5450 2400 50  0001 C CNN
F 3 "" H 5450 2400 50  0001 C CNN
	1    5450 2400
	1    0    0    -1  
$EndComp
Text Notes 1200 1825 0    197  ~ 0
Perovskite 1
Text Notes 1200 3575 0    197  ~ 0
Perovskite 2
Text Notes 1200 5325 0    197  ~ 0
Perovskite 3
Wire Notes Line
	975  900  7850 900 
Wire Notes Line
	7850 6400 975  6400
Wire Notes Line
	975  4525 7850 4525
Wire Notes Line
	7850 900  7850 6400
Wire Notes Line
	975  900  975  6400
Text GLabel 3575 5850 0    50   Input ~ 0
CP_3
Text GLabel 7000 4250 0    50   Input ~ 0
CP_2
Text GLabel 3575 3950 0    50   Input ~ 0
CP_2
Text GLabel 6950 6100 0    50   Input ~ 0
CP_3
Text GLabel 3550 2250 0    50   Input ~ 0
CP_1
$Comp
L Sensor_Temperature:MCP9808_MSOP U4
U 1 1 6369EDDD
P 5450 1850
F 0 "U4" H 5525 2325 50  0000 L CNN
F 1 "MCP9808_MSOP" H 5525 2425 50  0000 L CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 5450 1850 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5200 2300 50  0001 C CNN
	1    5450 1850
	1    0    0    -1  
$EndComp
Text GLabel 5050 1550 0    50   Input ~ 0
SDA
Text GLabel 5050 1650 0    50   Input ~ 0
SCL
Wire Wire Line
	5450 1200 5450 1350
Wire Wire Line
	5450 1200 5150 1200
Wire Wire Line
	4800 1200 4800 1950
Wire Wire Line
	4800 1950 5050 1950
Wire Wire Line
	5050 2050 5000 2050
Wire Wire Line
	5000 2050 5000 2150
Wire Wire Line
	5050 2150 5000 2150
Connection ~ 5000 2150
Wire Wire Line
	5000 2150 5000 2400
Wire Wire Line
	5450 2400 5450 2350
$Comp
L power:GND #PWR0101
U 1 1 63849F8B
P 5000 2400
F 0 "#PWR0101" H 5000 2150 50  0001 C CNN
F 1 "GND" H 5005 2227 50  0000 C CNN
F 2 "" H 5000 2400 50  0001 C CNN
F 3 "" H 5000 2400 50  0001 C CNN
	1    5000 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3150 5500 2950
Wire Wire Line
	5500 2950 5150 2950
Wire Wire Line
	4750 2950 4750 3750
Wire Wire Line
	4750 3850 5100 3850
$Comp
L power:GND #PWR0104
U 1 1 63850003
P 5050 4250
F 0 "#PWR0104" H 5050 4000 50  0001 C CNN
F 1 "GND" H 5055 4077 50  0000 C CNN
F 2 "" H 5050 4250 50  0001 C CNN
F 3 "" H 5050 4250 50  0001 C CNN
	1    5050 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3950 5050 3950
Wire Wire Line
	5050 3950 5050 4250
Wire Wire Line
	5500 4150 5500 4250
Wire Wire Line
	5500 4800 5500 5000
Wire Wire Line
	5500 4800 5150 4800
Wire Wire Line
	4800 4800 4800 5600
Wire Wire Line
	4800 5800 5100 5800
Wire Wire Line
	5500 6000 5500 6150
Wire Wire Line
	4750 3750 5100 3750
Connection ~ 4750 3750
Wire Wire Line
	4750 3750 4750 3850
Wire Wire Line
	4800 5600 5100 5600
Connection ~ 4800 5600
Wire Wire Line
	4800 5600 4800 5700
Wire Wire Line
	4800 5700 5100 5700
Connection ~ 4800 5700
Wire Wire Line
	4800 5700 4800 5800
$Comp
L Connector_Generic:Conn_01x01 JP100.1
U 1 1 64B48B55
P 7200 1150
F 0 "JP100.1" H 7280 1192 50  0000 L CNN
F 1 "Conn_01x01" H 7280 1101 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 1150 50  0001 C CNN
F 3 "~" H 7200 1150 50  0001 C CNN
	1    7200 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.2
U 1 1 64B50405
P 7200 1350
F 0 "JP100.2" H 7280 1392 50  0000 L CNN
F 1 "Conn_01x01" H 7280 1301 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 1350 50  0001 C CNN
F 3 "~" H 7200 1350 50  0001 C CNN
	1    7200 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.3
U 1 1 64B50664
P 7200 1550
F 0 "JP100.3" H 7280 1592 50  0000 L CNN
F 1 "Conn_01x01" H 7280 1501 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 1550 50  0001 C CNN
F 3 "~" H 7200 1550 50  0001 C CNN
	1    7200 1550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.4
U 1 1 64B50942
P 7200 1750
F 0 "JP100.4" H 7280 1792 50  0000 L CNN
F 1 "Conn_01x01" H 7280 1701 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 1750 50  0001 C CNN
F 3 "~" H 7200 1750 50  0001 C CNN
	1    7200 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.5
U 1 1 64B54D8C
P 7200 1950
F 0 "JP100.5" H 7280 1992 50  0000 L CNN
F 1 "Conn_01x01" H 7280 1901 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 1950 50  0001 C CNN
F 3 "~" H 7200 1950 50  0001 C CNN
	1    7200 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.6
U 1 1 64B54D92
P 7200 2150
F 0 "JP100.6" H 7280 2192 50  0000 L CNN
F 1 "Conn_01x01" H 7280 2101 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 2150 50  0001 C CNN
F 3 "~" H 7200 2150 50  0001 C CNN
	1    7200 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP100.7
U 1 1 64B54D98
P 7200 2350
F 0 "JP100.7" H 7280 2392 50  0000 L CNN
F 1 "Conn_01x01" H 7280 2301 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 2350 50  0001 C CNN
F 3 "~" H 7200 2350 50  0001 C CNN
	1    7200 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.1
U 1 1 64B54D9E
P 7200 3050
F 0 "JP101.1" H 7280 3092 50  0000 L CNN
F 1 "Conn_01x01" H 7280 3001 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 3050 50  0001 C CNN
F 3 "~" H 7200 3050 50  0001 C CNN
	1    7200 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.2
U 1 1 64B5722D
P 7200 3250
F 0 "JP101.2" H 7280 3292 50  0000 L CNN
F 1 "Conn_01x01" H 7280 3201 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 3250 50  0001 C CNN
F 3 "~" H 7200 3250 50  0001 C CNN
	1    7200 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.3
U 1 1 64B57233
P 7200 3450
F 0 "JP101.3" H 7280 3492 50  0000 L CNN
F 1 "Conn_01x01" H 7280 3401 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 3450 50  0001 C CNN
F 3 "~" H 7200 3450 50  0001 C CNN
	1    7200 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.4
U 1 1 64B57239
P 7200 3650
F 0 "JP101.4" H 7280 3692 50  0000 L CNN
F 1 "Conn_01x01" H 7280 3601 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 3650 50  0001 C CNN
F 3 "~" H 7200 3650 50  0001 C CNN
	1    7200 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.5
U 1 1 64B5723F
P 7200 3850
F 0 "JP101.5" H 7280 3892 50  0000 L CNN
F 1 "Conn_01x01" H 7280 3801 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 3850 50  0001 C CNN
F 3 "~" H 7200 3850 50  0001 C CNN
	1    7200 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.6
U 1 1 64B591F4
P 7200 4050
F 0 "JP101.6" H 7280 4092 50  0000 L CNN
F 1 "Conn_01x01" H 7280 4001 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 4050 50  0001 C CNN
F 3 "~" H 7200 4050 50  0001 C CNN
	1    7200 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP101.7
U 1 1 64B591FA
P 7200 4250
F 0 "JP101.7" H 7280 4292 50  0000 L CNN
F 1 "Conn_01x01" H 7280 4201 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7200 4250 50  0001 C CNN
F 3 "~" H 7200 4250 50  0001 C CNN
	1    7200 4250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.1
U 1 1 64B59200
P 7150 4900
F 0 "JP102.1" H 7230 4942 50  0000 L CNN
F 1 "Conn_01x01" H 7230 4851 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7150 4900 50  0001 C CNN
F 3 "~" H 7150 4900 50  0001 C CNN
	1    7150 4900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.2
U 1 1 64B59206
P 7150 5100
F 0 "JP102.2" H 7230 5142 50  0000 L CNN
F 1 "Conn_01x01" H 7230 5051 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7150 5100 50  0001 C CNN
F 3 "~" H 7150 5100 50  0001 C CNN
	1    7150 5100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.3
U 1 1 64B5B299
P 7150 5300
F 0 "JP102.3" H 7230 5342 50  0000 L CNN
F 1 "Conn_01x01" H 7230 5251 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7150 5300 50  0001 C CNN
F 3 "~" H 7150 5300 50  0001 C CNN
	1    7150 5300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.4
U 1 1 64B5B29F
P 7150 5500
F 0 "JP102.4" H 7230 5542 50  0000 L CNN
F 1 "Conn_01x01" H 7230 5451 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7150 5500 50  0001 C CNN
F 3 "~" H 7150 5500 50  0001 C CNN
	1    7150 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.5
U 1 1 64B5B2A5
P 7150 5700
F 0 "JP102.5" H 7230 5742 50  0000 L CNN
F 1 "Conn_01x01" H 7230 5651 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7150 5700 50  0001 C CNN
F 3 "~" H 7150 5700 50  0001 C CNN
	1    7150 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.6
U 1 1 64B5B2AB
P 7150 5900
F 0 "JP102.6" H 7230 5942 50  0000 L CNN
F 1 "Conn_01x01" H 7230 5851 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7150 5900 50  0001 C CNN
F 3 "~" H 7150 5900 50  0001 C CNN
	1    7150 5900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP102.7
U 1 1 64B5D0F6
P 7150 6100
F 0 "JP102.7" H 7230 6142 50  0000 L CNN
F 1 "Conn_01x01" H 7230 6051 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 7150 6100 50  0001 C CNN
F 3 "~" H 7150 6100 50  0001 C CNN
	1    7150 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 JP103.1
U 1 1 64B5D0FC
P 5600 6950
F 0 "JP103.1" H 5680 6992 50  0000 L CNN
F 1 "Conn_01x01" H 5680 6901 50  0000 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 5600 6950 50  0001 C CNN
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
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 5600 7150 50  0001 C CNN
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
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 5600 7350 50  0001 C CNN
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
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 5600 7550 50  0001 C CNN
F 3 "~" H 5600 7550 50  0001 C CNN
	1    5600 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64BAB42F
P 5050 7300
F 0 "#PWR?" H 5050 7050 50  0001 C CNN
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
L power:VDD #PWR?
U 1 1 64BB3055
P 5300 6750
F 0 "#PWR?" H 5300 6600 50  0001 C CNN
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
NoConn ~ 5900 5500
NoConn ~ 5900 3650
NoConn ~ 5850 1850
Wire Notes Line
	7850 2675 975  2675
$Comp
L power:VDD #PWR?
U 1 1 64BC9726
P 5150 4800
F 0 "#PWR?" H 5150 4650 50  0001 C CNN
F 1 "VDD" H 5165 4973 50  0000 C CNN
F 2 "" H 5150 4800 50  0001 C CNN
F 3 "" H 5150 4800 50  0001 C CNN
	1    5150 4800
	1    0    0    -1  
$EndComp
Connection ~ 5150 4800
Wire Wire Line
	5150 4800 4800 4800
$Comp
L power:VDD #PWR?
U 1 1 64BCA3BE
P 5150 2950
F 0 "#PWR?" H 5150 2800 50  0001 C CNN
F 1 "VDD" H 5165 3123 50  0000 C CNN
F 2 "" H 5150 2950 50  0001 C CNN
F 3 "" H 5150 2950 50  0001 C CNN
	1    5150 2950
	1    0    0    -1  
$EndComp
Connection ~ 5150 2950
Wire Wire Line
	5150 2950 4750 2950
$Comp
L power:VDD #PWR?
U 1 1 64BCB08F
P 5150 1200
F 0 "#PWR?" H 5150 1050 50  0001 C CNN
F 1 "VDD" H 5165 1373 50  0000 C CNN
F 2 "" H 5150 1200 50  0001 C CNN
F 3 "" H 5150 1200 50  0001 C CNN
	1    5150 1200
	1    0    0    -1  
$EndComp
Connection ~ 5150 1200
Wire Wire Line
	5150 1200 4800 1200
Text GLabel 6950 5500 0    50   Input ~ 0
CELL_18
Text GLabel 6950 5700 0    50   Input ~ 0
CELL_17
Text GLabel 6950 5300 0    50   Input ~ 0
CELL_15
Text GLabel 6950 5100 0    50   Input ~ 0
CELL_14
Text GLabel 6950 4900 0    50   Input ~ 0
CELL_13
Text GLabel 7000 2350 0    50   Input ~ 0
CP_1
$EndSCHEMATC
