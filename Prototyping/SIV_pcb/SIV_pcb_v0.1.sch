EESchema Schematic File Version 5
EELAYER 36 0
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
Comment5 ""
Comment6 ""
Comment7 ""
Comment8 ""
Comment9 ""
$EndDescr
Connection ~ 4400 2750
Connection ~ 4400 2900
Wire Wire Line
	2700 2350 2650 2350
Wire Wire Line
	3650 2350 4100 2350
Wire Wire Line
	3650 2450 4100 2450
Wire Wire Line
	3650 2750 4400 2750
Wire Wire Line
	3750 2800 3750 2850
Wire Wire Line
	3750 2850 3650 2850
Wire Wire Line
	3750 3050 4400 3050
Wire Wire Line
	4100 2950 3650 2950
Wire Wire Line
	4100 3500 4100 2950
Wire Wire Line
	4400 1900 4400 2750
Wire Wire Line
	4400 1900 4500 1900
Wire Wire Line
	4400 2750 4400 2900
Wire Wire Line
	4400 2900 4400 3050
Wire Wire Line
	4400 2900 4500 2900
Wire Wire Line
	4500 2800 3750 2800
Wire Wire Line
	4500 3500 4100 3500
Text GLabel 2650 2950 0    50   Input ~ 0
GND
Text GLabel 2650 3050 0    50   Input ~ 0
GND
Text GLabel 2650 3150 0    50   Input ~ 0
GND
Text GLabel 2650 3250 0    50   Input ~ 0
GND
Text GLabel 4100 2350 2    50   Input ~ 0
VIN
Text GLabel 4100 2450 2    50   Input ~ 0
GND
Text GLabel 8850 1650 2    50   Input ~ 0
VDD
$Comp
L power:GND #PWR?
U 1 1 00000000
P 2250 2550
F 0 "#PWR?" H 2250 2300 50  0001 C CNN
F 1 "GND" H 2250 2370 50  0000 C CNN
F 2 "" H 2250 2550 50  0001 C CNN
F 3 "" H 2250 2550 50  0001 C CNN
	1    2250 2550
	1    0    0    -1  
$EndComp
$Comp
L SIV_lib:ADC_3461 U?
U 1 1 00000000
P 3000 2250
F 0 "U?" H 3200 2250 50  0000 L CNN
F 1 "ADC_3461" H 3050 2350 50  0000 L CNN
F 2 "" H 3000 2350 50  0001 C CNN
F 3 "" H 3000 2350 50  0001 C CNN
	1    3000 2250
	1    0    0    -1  
$EndComp
$Comp
L teensy_lib:Teensy4.0 U1
U 1 1 00000000
P 5600 2950
F 0 "U1" H 5600 4551 50  0000 C CNN
F 1 "Teensy4.0" H 5600 4442 50  0000 C CNN
F 2 "" H 5200 3150 50  0001 C CNN
F 3 "" H 5200 3150 50  0001 C CNN
	1    5600 2950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
