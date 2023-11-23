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
L power:GND #PWR0101
U 1 1 6406AE17
P 5500 3700
F 0 "#PWR0101" H 5500 3450 50  0001 C CNN
F 1 "GND" V 5505 3572 50  0000 R CNN
F 2 "" H 5500 3700 50  0001 C CNN
F 3 "" H 5500 3700 50  0001 C CNN
	1    5500 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 3700 5500 3700
$Comp
L power:+3.3V #PWR0102
U 1 1 6406CCDC
P 4800 3500
F 0 "#PWR0102" H 4800 3350 50  0001 C CNN
F 1 "+3.3V" V 4815 3628 50  0000 L CNN
F 2 "" H 4800 3500 50  0001 C CNN
F 3 "" H 4800 3500 50  0001 C CNN
	1    4800 3500
	0    -1   -1   0   
$EndComp
Text GLabel 5400 3500 2    50   Input ~ 0
TDO-TDI
Text GLabel 5400 3600 2    50   Input ~ 0
TCK
Text GLabel 4900 3600 0    50   Input ~ 0
TESTVPP
Text GLabel 4900 3700 0    50   Input ~ 0
Rx
Text GLabel 4900 3800 0    50   Input ~ 0
Tx
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 642236AC
P 4100 3700
F 0 "J1" H 4208 4081 50  0000 C CNN
F 1 "Conn_01x05_Male" H 4208 3990 50  0000 C CNN
F 2 "Connector_Molex:Molex_PicoBlade_53398-0571_1x05-1MP_P1.25mm_Vertical" H 4100 3700 50  0001 C CNN
F 3 "~" H 4100 3700 50  0001 C CNN
	1    4100 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 642242F1
P 6250 3700
F 0 "J2" H 6222 3632 50  0000 R CNN
F 1 "Conn_01x05_Male" H 6222 3723 50  0000 R CNN
F 2 "Connector_Molex:Molex_PicoBlade_53398-0571_1x05-1MP_P1.25mm_Vertical" H 6250 3700 50  0001 C CNN
F 3 "~" H 6250 3700 50  0001 C CNN
	1    6250 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 3500 4800 3500
Connection ~ 4800 3500
Wire Wire Line
	4800 3500 4900 3500
Wire Wire Line
	5450 3200 5450 3500
Wire Wire Line
	5450 3500 5400 3500
Wire Wire Line
	4300 3700 4550 3700
Wire Wire Line
	4550 3700 4550 3600
Wire Wire Line
	4550 3600 4900 3600
Wire Wire Line
	4300 3800 4300 3750
Wire Wire Line
	4300 3750 4000 3750
Wire Wire Line
	4000 3750 4000 3050
Wire Wire Line
	4000 3050 5600 3050
Wire Wire Line
	5600 3050 5600 3600
Wire Wire Line
	5600 3600 5400 3600
Wire Wire Line
	4300 3900 4600 3900
Wire Wire Line
	4600 3900 4600 3700
Wire Wire Line
	6050 3500 5800 3500
Wire Wire Line
	5800 3500 5800 3700
Wire Wire Line
	5800 3700 5500 3700
Connection ~ 5500 3700
Wire Wire Line
	4600 3700 4900 3700
Wire Wire Line
	6050 3600 6350 3600
Wire Wire Line
	6350 3600 6350 4100
Wire Wire Line
	6350 4100 4700 4100
Wire Wire Line
	4700 4100 4700 3800
Wire Wire Line
	4700 3800 4900 3800
Wire Wire Line
	6050 3700 5850 3700
Wire Wire Line
	5850 3700 5850 3800
Wire Wire Line
	5850 3800 5400 3800
Wire Wire Line
	6050 3800 6300 3800
Wire Wire Line
	6300 3800 6300 4000
Wire Wire Line
	6300 4000 4900 4000
Wire Wire Line
	4900 4000 4900 3900
Wire Wire Line
	6050 3900 5400 3900
Wire Wire Line
	4300 3600 4350 3600
Wire Wire Line
	4350 3600 4350 3550
Wire Wire Line
	4350 3550 4050 3550
Wire Wire Line
	4050 3550 4050 3200
Wire Wire Line
	4050 3200 5450 3200
$Comp
L Connector_Generic:Conn_02x05_Odd_Even JTAG1
U 1 1 64069224
P 5100 3700
F 0 "JTAG1" H 5150 4117 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 5150 4026 50  0000 C CNN
F 2 "Connector:Tag-Connect_TC2050-IDC-FP_2x05_P1.27mm_Vertical" H 5100 3700 50  0001 C CNN
F 3 "~" H 5100 3700 50  0001 C CNN
	1    5100 3700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
