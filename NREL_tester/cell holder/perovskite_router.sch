EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Perovskite:Perovskite_CP_6_Cell U1
U 1 1 644C9095
P 6050 2700
F 0 "U1" H 6038 2715 50  0000 C CNN
F 1 "Perovskite_CP_6_Cell" H 6038 2624 50  0000 C CNN
F 2 "Perovskite:Perovskite" H 6050 2700 50  0001 C CNN
F 3 "" H 6050 2700 50  0001 C CNN
	1    6050 2700
	-1   0    0    -1  
$EndComp
$Comp
L Sensor_Temperature:MCP9808_MSOP U2
U 1 1 644CC35C
P 6100 4700
F 0 "U2" H 6100 5381 50  0000 C CNN
F 1 "MCP9808_MSOP" H 6100 5290 50  0000 C CNN
F 2 "MCP9804_Custom:MCP9804_With_Hole" H 6100 4700 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22203b.pdf" H 5850 5150 50  0001 C CNN
	1    6100 4700
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J1
U 1 1 644CE009
P 7550 3150
F 0 "J1" H 7522 3124 50  0000 R CNN
F 1 "Conn_01x10_Male" H 7522 3033 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7550 3150 50  0001 C CNN
F 3 "~" H 7550 3150 50  0001 C CNN
	1    7550 3150
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Male J2
U 1 1 644CEC70
P 7550 4250
F 0 "J2" H 7522 4224 50  0000 R CNN
F 1 "Conn_01x10_Male" H 7522 4133 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7550 4250 50  0001 C CNN
F 3 "~" H 7550 4250 50  0001 C CNN
	1    7550 4250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6100 4050 6100 4200
Wire Wire Line
	5700 4700 5600 4700
$Comp
L Device:C C1
U 1 1 644D8A24
P 5100 4750
F 0 "C1" H 5215 4796 50  0000 L CNN
F 1 "0.1u" H 5215 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5138 4600 50  0001 C CNN
F 3 "~" H 5100 4750 50  0001 C CNN
	1    5100 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4050 5100 4050
Wire Wire Line
	5100 4050 5100 4600
Wire Wire Line
	5100 4900 5100 5400
Wire Wire Line
	6500 3550 6600 3550
Wire Wire Line
	6500 3450 6650 3450
Wire Wire Line
	6650 3450 6650 4050
Wire Wire Line
	6500 3350 6700 3350
Wire Wire Line
	6700 3350 6700 4150
Wire Wire Line
	6500 3250 6750 3250
Wire Wire Line
	6750 3250 6750 4250
Wire Wire Line
	6100 5400 6800 5400
Wire Wire Line
	6100 5200 6100 5400
Wire Wire Line
	5600 4700 5600 5450
Wire Wire Line
	5600 5450 6850 5450
Wire Wire Line
	6500 4500 6900 4500
Wire Wire Line
	6500 4400 6950 4400
Wire Wire Line
	6800 3150 7350 3150
Wire Wire Line
	6850 3250 7350 3250
Wire Wire Line
	6900 3350 7350 3350
Wire Wire Line
	6950 3450 7350 3450
Wire Wire Line
	6650 4050 7350 4050
Wire Wire Line
	6700 4150 7350 4150
Wire Wire Line
	6750 4250 7350 4250
Wire Wire Line
	5100 5400 6100 5400
Connection ~ 6100 5400
Wire Wire Line
	6500 5000 7000 5000
Wire Wire Line
	7000 5000 7000 4450
Wire Wire Line
	7000 4450 7350 4450
Wire Wire Line
	6500 4900 7050 4900
Wire Wire Line
	7050 4900 7050 4550
Wire Wire Line
	7050 4550 7350 4550
Wire Wire Line
	6500 4800 7100 4800
Wire Wire Line
	7100 4800 7100 4650
Wire Wire Line
	7100 4650 7350 4650
Wire Wire Line
	6100 4050 6550 4050
Wire Wire Line
	6550 4050 6550 4750
Wire Wire Line
	6550 4750 7350 4750
Connection ~ 6100 4050
Wire Wire Line
	6800 3150 6800 5400
Wire Wire Line
	6850 3250 6850 5450
Wire Wire Line
	6900 3350 6900 4500
Wire Wire Line
	6950 3450 6950 4400
Wire Wire Line
	6500 3150 6750 3150
Wire Wire Line
	6750 3150 6750 2950
Wire Wire Line
	6750 2950 7350 2950
Wire Wire Line
	6500 3050 6700 3050
Wire Wire Line
	6700 3050 6700 2850
Wire Wire Line
	6700 2850 7350 2850
Wire Wire Line
	6500 2950 6650 2950
Wire Wire Line
	6650 2950 6650 2750
Wire Wire Line
	6650 2750 7350 2750
Wire Wire Line
	6500 3650 7350 3650
Wire Wire Line
	6600 3550 6600 3850
Wire Wire Line
	6600 3850 7350 3850
$EndSCHEMATC