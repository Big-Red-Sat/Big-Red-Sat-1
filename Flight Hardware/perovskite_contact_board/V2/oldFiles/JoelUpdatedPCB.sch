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
L Connector_Generic:Conn_01x07 C1
U 1 1 6189D035
P 3000 1550
F 0 "C1" H 3080 1592 50  0000 L CNN
F 1 "Conn_01x07" H 3080 1501 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 3000 1550 50  0001 C CNN
F 3 "~" H 3000 1550 50  0001 C CNN
	1    3000 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2200 1550 2200
Wire Wire Line
	1500 2350 1600 2350
Wire Wire Line
	1600 2350 1600 2000
Wire Wire Line
	1600 2000 2200 2000
Wire Wire Line
	1500 2500 1650 2500
Wire Wire Line
	1650 2500 1650 2050
Wire Wire Line
	1650 2050 2300 2050
Wire Wire Line
	1100 2800 1100 1650
Wire Wire Line
	1100 1650 1950 1650
Wire Wire Line
	1950 1650 1950 1250
Wire Wire Line
	2200 1450 2800 1450
Wire Wire Line
	2300 1550 2800 1550
Wire Wire Line
	1950 1250 2800 1250
Wire Wire Line
	2400 1650 2800 1650
Wire Wire Line
	2500 1750 2800 1750
Wire Wire Line
	2700 1850 2800 1850
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 618A4673
P 1300 2200
F 0 "J1" H 1218 1975 50  0000 C CNN
F 1 "Conn_01x01" H 1218 2066 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1300 2200 50  0001 C CNN
F 3 "~" H 1300 2200 50  0001 C CNN
	1    1300 2200
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 618A78A7
P 1300 2350
F 0 "J2" H 1218 2125 50  0000 C CNN
F 1 "Conn_01x01" H 1218 2216 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1300 2350 50  0001 C CNN
F 3 "~" H 1300 2350 50  0001 C CNN
	1    1300 2350
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 618A7CEF
P 1300 2500
F 0 "J3" H 1218 2275 50  0000 C CNN
F 1 "Conn_01x01" H 1218 2366 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1300 2500 50  0001 C CNN
F 3 "~" H 1300 2500 50  0001 C CNN
	1    1300 2500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 618A90DB
P 1800 2200
F 0 "J4" H 1718 1975 50  0000 C CNN
F 1 "P4" H 1718 2066 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1800 2200 50  0001 C CNN
F 3 "~" H 1800 2200 50  0001 C CNN
	1    1800 2200
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 618A9665
P 1800 2350
F 0 "J5" H 1718 2125 50  0000 C CNN
F 1 "P5" H 1718 2216 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1800 2350 50  0001 C CNN
F 3 "~" H 1800 2350 50  0001 C CNN
	1    1800 2350
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 618A9979
P 1800 2500
F 0 "J6" H 1718 2275 50  0000 C CNN
F 1 "P6" H 1718 2366 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1800 2500 50  0001 C CNN
F 3 "~" H 1800 2500 50  0001 C CNN
	1    1800 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2700 1850 2700 2500
Wire Wire Line
	2000 2350 2500 2350
Wire Wire Line
	2000 2200 2400 2200
$Comp
L Connector_Generic:Conn_01x01 GND1
U 1 1 618AC19D
P 1700 3000
F 0 "GND1" V 1572 3080 50  0000 L CNN
F 1 "GND1" V 1663 3080 50  0000 L CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1700 3000 50  0001 C CNN
F 3 "~" H 1700 3000 50  0001 C CNN
	1    1700 3000
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x07 C2
U 1 1 6193CD9A
P 5650 1800
F 0 "C2" H 5730 1842 50  0000 L CNN
F 1 "Conn_01x07" H 5730 1751 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 5650 1800 50  0001 C CNN
F 3 "~" H 5650 1800 50  0001 C CNN
	1    5650 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2450 4200 2450
Wire Wire Line
	4150 2600 4250 2600
Wire Wire Line
	4750 2200 4750 1600
Wire Wire Line
	4850 2250 4850 1700
Wire Wire Line
	4150 2750 4300 2750
Wire Wire Line
	4300 2750 4300 2300
Wire Wire Line
	4300 2300 4950 2300
Wire Wire Line
	4950 2300 4950 1800
Wire Wire Line
	4400 2100 4600 2100
Wire Wire Line
	4600 2100 4600 1900
Wire Wire Line
	5050 2450 5050 1900
Wire Wire Line
	5150 2600 5150 2000
Wire Wire Line
	4350 3050 3750 3050
Wire Wire Line
	3750 3050 3750 1900
Wire Wire Line
	3750 1900 4600 1900
Connection ~ 4600 1900
Wire Wire Line
	4600 1900 4600 1500
Wire Wire Line
	4750 1600 5450 1600
Wire Wire Line
	4850 1700 5450 1700
Wire Wire Line
	4950 1800 5450 1800
Wire Wire Line
	4600 1500 5450 1500
Wire Wire Line
	5050 1900 5450 1900
Wire Wire Line
	5150 2000 5450 2000
Wire Wire Line
	5350 2100 5450 2100
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 6193CEA0
P 3950 2750
F 0 "J9" H 3868 2525 50  0000 C CNN
F 1 "P9" H 3868 2616 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 3950 2750 50  0001 C CNN
F 3 "~" H 3950 2750 50  0001 C CNN
	1    3950 2750
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 6193CEAA
P 4450 2450
F 0 "J10" H 4368 2225 50  0000 C CNN
F 1 "P10" H 4368 2316 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 4450 2450 50  0001 C CNN
F 3 "~" H 4450 2450 50  0001 C CNN
	1    4450 2450
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 6193CEB4
P 4450 2600
F 0 "J11" H 4368 2375 50  0000 C CNN
F 1 "P11" H 4368 2466 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 4450 2600 50  0001 C CNN
F 3 "~" H 4450 2600 50  0001 C CNN
	1    4450 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J12
U 1 1 6193CEBE
P 4450 2750
F 0 "J12" H 4368 2525 50  0000 C CNN
F 1 "P12" H 4368 2616 50  0000 C CNB
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 4450 2750 50  0001 C CNN
F 3 "~" H 4450 2750 50  0001 C CNN
	1    4450 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 2750 5350 2750
Wire Wire Line
	5350 2100 5350 2750
Wire Wire Line
	4650 2600 5150 2600
Wire Wire Line
	4650 2450 5050 2450
$Comp
L Connector_Generic:Conn_01x01 GND2
U 1 1 6193CECC
P 4350 3250
F 0 "GND2" V 4222 3330 50  0000 L CNN
F 1 "GND2" V 4313 3330 50  0000 L CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 4350 3250 50  0001 C CNN
F 3 "~" H 4350 3250 50  0001 C CNN
	1    4350 3250
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 GND2_2
U 1 1 6193CED6
P 4200 2100
F 0 "GND2_2" H 4118 1875 50  0000 C CNN
F 1 "GND2_2" H 4118 1966 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 4200 2100 50  0001 C CNN
F 3 "~" H 4200 2100 50  0001 C CNN
	1    4200 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 2500 2700 2500
Wire Wire Line
	1700 2800 1100 2800
$Comp
L Connector_Generic:Conn_01x07 C3
U 1 1 61958F1B
P 3100 4000
F 0 "C3" H 3180 4042 50  0000 L CNN
F 1 "Conn_01x07" H 3180 3951 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 3100 4000 50  0001 C CNN
F 3 "~" H 3100 4000 50  0001 C CNN
	1    3100 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4650 1650 4650
Wire Wire Line
	1600 4800 1700 4800
Wire Wire Line
	1650 4650 1650 4400
Wire Wire Line
	1650 4400 2200 4400
Wire Wire Line
	2200 4400 2200 3800
Wire Wire Line
	1700 4800 1700 4450
Wire Wire Line
	1700 4450 2300 4450
Wire Wire Line
	2300 4450 2300 3900
Wire Wire Line
	1600 4950 1750 4950
Wire Wire Line
	1750 4950 1750 4500
Wire Wire Line
	1750 4500 2400 4500
Wire Wire Line
	2400 4500 2400 4000
Wire Wire Line
	1850 4300 2050 4300
Wire Wire Line
	2050 4300 2050 4100
Wire Wire Line
	2500 4650 2500 4100
Wire Wire Line
	2600 4800 2600 4200
Wire Wire Line
	1200 5250 1200 4100
Wire Wire Line
	1200 4100 2050 4100
Connection ~ 2050 4100
Wire Wire Line
	2050 4100 2050 3700
Wire Wire Line
	2200 3800 2900 3800
Wire Wire Line
	2300 3900 2900 3900
Wire Wire Line
	2400 4000 2900 4000
Wire Wire Line
	2050 3700 2900 3700
Wire Wire Line
	2500 4100 2900 4100
Wire Wire Line
	2600 4200 2900 4200
Wire Wire Line
	2800 4300 2900 4300
$Comp
L Connector_Generic:Conn_01x01 J13
U 1 1 619590B4
P 1400 4650
F 0 "J13" H 1318 4425 50  0000 C CNN
F 1 "P13" H 1318 4516 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1400 4650 50  0001 C CNN
F 3 "~" H 1400 4650 50  0001 C CNN
	1    1400 4650
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J14
U 1 1 619590BE
P 1400 4800
F 0 "J14" H 1318 4575 50  0000 C CNN
F 1 "P14" H 1318 4666 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1400 4800 50  0001 C CNN
F 3 "~" H 1400 4800 50  0001 C CNN
	1    1400 4800
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J15
U 1 1 619590C8
P 1400 4950
F 0 "J15" H 1318 4725 50  0000 C CNN
F 1 "P15" H 1318 4816 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1400 4950 50  0001 C CNN
F 3 "~" H 1400 4950 50  0001 C CNN
	1    1400 4950
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J16
U 1 1 619590D2
P 1900 4650
F 0 "J16" H 1818 4425 50  0000 C CNN
F 1 "P16" H 1818 4516 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1900 4650 50  0001 C CNN
F 3 "~" H 1900 4650 50  0001 C CNN
	1    1900 4650
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J17
U 1 1 619590DC
P 1900 4800
F 0 "J17" H 1818 4575 50  0000 C CNN
F 1 "P18" H 1818 4666 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1900 4800 50  0001 C CNN
F 3 "~" H 1900 4800 50  0001 C CNN
	1    1900 4800
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J19
U 1 1 619590E6
P 1900 4950
F 0 "J19" H 1818 4725 50  0000 C CNN
F 1 "19" H 1818 4816 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1900 4950 50  0001 C CNN
F 3 "~" H 1900 4950 50  0001 C CNN
	1    1900 4950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 4300 2800 4950
Wire Wire Line
	2100 4800 2600 4800
Wire Wire Line
	2100 4650 2500 4650
$Comp
L Connector_Generic:Conn_01x01 GND3
U 1 1 619590F3
P 1800 5450
F 0 "GND3" V 1672 5530 50  0000 L CNN
F 1 "GND3" V 1763 5530 50  0000 L CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1800 5450 50  0001 C CNN
F 3 "~" H 1800 5450 50  0001 C CNN
	1    1800 5450
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 GND3_2
U 1 1 619590FD
P 1650 4300
F 0 "GND3_2" H 1568 4075 50  0000 C CNN
F 1 "GND3_2" H 1568 4166 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1650 4300 50  0001 C CNN
F 3 "~" H 1650 4300 50  0001 C CNN
	1    1650 4300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 4950 2800 4950
Wire Wire Line
	1800 5250 1200 5250
Connection ~ 1950 1650
Wire Wire Line
	2100 1350 2800 1350
$Comp
L Connector_Generic:Conn_01x01 GND1_2
U 1 1 618ACB3E
P 1550 1850
F 0 "GND1_2" H 1468 1625 50  0000 C CNN
F 1 "GND1_2" H 1468 1716 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 1550 1850 50  0001 C CNN
F 3 "~" H 1550 1850 50  0001 C CNN
	1    1550 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 2350 2500 1750
Wire Wire Line
	2400 2200 2400 1650
Wire Wire Line
	1950 1850 1950 1650
Wire Wire Line
	1750 1850 1950 1850
Wire Wire Line
	2300 2050 2300 1550
Wire Wire Line
	2200 2000 2200 1450
Wire Wire Line
	2100 1950 2100 1350
Wire Wire Line
	1550 1950 2100 1950
Wire Wire Line
	1550 2200 1550 1950
Wire Wire Line
	4250 2250 4850 2250
Wire Wire Line
	4250 2600 4250 2250
Wire Wire Line
	4200 2200 4750 2200
Wire Wire Line
	4200 2450 4200 2200
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 6193CE96
P 3950 2600
F 0 "J8" H 3868 2375 50  0000 C CNN
F 1 "P8" H 3868 2466 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 3950 2600 50  0001 C CNN
F 3 "~" H 3950 2600 50  0001 C CNN
	1    3950 2600
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 6193CE8C
P 3950 2450
F 0 "J7" H 3868 2225 50  0000 C CNN
F 1 "P7" H 3868 2316 50  0000 C CNN
F 2 "perovskite_lib:1x1_1.54_throughole_test" H 3950 2450 50  0001 C CNN
F 3 "~" H 3950 2450 50  0001 C CNN
	1    3950 2450
	-1   0    0    1   
$EndComp
$EndSCHEMATC
