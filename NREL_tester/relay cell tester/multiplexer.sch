EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 2 3
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
L Transistor_BJT:2N3904 Q1
U 1 1 645006C6
P 3200 5600
F 0 "Q1" H 3390 5646 50  0000 L CNN
F 1 "2N3904" H 3390 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 3400 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 3200 5600 50  0001 L CNN
	1    3200 5600
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847M U2
U 1 1 64505662
P 1950 5500
F 0 "U2" H 1950 5825 50  0000 C CNN
F 1 "LTV-847M" H 1950 5734 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W10.16mm" H 1950 5200 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 1500 5900 50  0001 C CNN
	1    1950 5500
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847M U2
U 3 1 645088DB
P 1950 6700
F 0 "U2" H 1950 7025 50  0000 C CNN
F 1 "LTV-847M" H 1950 6934 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W10.16mm" H 1950 6400 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 1500 7100 50  0001 C CNN
	3    1950 6700
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847M U2
U 4 1 64509E12
P 1950 7300
F 0 "U2" H 1950 7625 50  0000 C CNN
F 1 "LTV-847M" H 1950 7534 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W10.16mm" H 1950 7000 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 1500 7700 50  0001 C CNN
	4    1950 7300
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847M U3
U 1 1 6450D4A0
P 1950 7900
F 0 "U3" H 1950 8225 50  0000 C CNN
F 1 "LTV-847M" H 1950 8134 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W10.16mm" H 1950 7600 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 1500 8300 50  0001 C CNN
	1    1950 7900
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847M U3
U 2 1 6450D4A6
P 1950 8500
F 0 "U3" H 1950 8825 50  0000 C CNN
F 1 "LTV-847M" H 1950 8734 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W10.16mm" H 1950 8200 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 1500 8900 50  0001 C CNN
	2    1950 8500
	1    0    0    -1  
$EndComp
$Comp
L Isolator:LTV-847M U3
U 3 1 6450D4AC
P 1950 9100
F 0 "U3" H 1950 9425 50  0000 C CNN
F 1 "LTV-847M" H 1950 9334 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W10.16mm" H 1950 8800 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 1500 9500 50  0001 C CNN
	3    1950 9100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 6450E0FF
P 2800 4300
F 0 "D1" H 2750 4200 50  0000 L CNN
F 1 "D_Schottky" V 2845 4380 50  0001 L CNN
F 2 "" H 2800 4300 50  0001 C CNN
F 3 "~" H 2800 4300 50  0001 C CNN
	1    2800 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 6450F9F3
P 2400 4300
F 0 "R8" H 2470 4346 50  0000 L CNN
F 1 "R" H 2470 4255 50  0000 L CNN
F 2 "" V 2330 4300 50  0001 C CNN
F 3 "~" H 2400 4300 50  0001 C CNN
	1    2400 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 64512B66
P 4300 4300
F 0 "D2" H 4250 4200 50  0000 L CNN
F 1 "D_Schottky" V 4345 4380 50  0001 L CNN
F 2 "" H 4300 4300 50  0001 C CNN
F 3 "~" H 4300 4300 50  0001 C CNN
	1    4300 4300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 645143EA
P 5800 4300
F 0 "D3" H 5750 4200 50  0000 L CNN
F 1 "D_Schottky" V 5845 4380 50  0001 L CNN
F 2 "" H 5800 4300 50  0001 C CNN
F 3 "~" H 5800 4300 50  0001 C CNN
	1    5800 4300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D4
U 1 1 64516FA1
P 7350 4300
F 0 "D4" H 7300 4200 50  0000 L CNN
F 1 "D_Schottky" V 7395 4380 50  0001 L CNN
F 2 "" H 7350 4300 50  0001 C CNN
F 3 "~" H 7350 4300 50  0001 C CNN
	1    7350 4300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 6451827F
P 8900 4300
F 0 "D5" H 8850 4200 50  0000 L CNN
F 1 "D_Schottky" V 8945 4380 50  0001 L CNN
F 2 "" H 8900 4300 50  0001 C CNN
F 3 "~" H 8900 4300 50  0001 C CNN
	1    8900 4300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D6
U 1 1 6451905C
P 10450 4300
F 0 "D6" H 10400 4200 50  0000 L CNN
F 1 "D_Schottky" V 10495 4380 50  0001 L CNN
F 2 "" H 10450 4300 50  0001 C CNN
F 3 "~" H 10450 4300 50  0001 C CNN
	1    10450 4300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 6451AB79
P 12000 4300
F 0 "D7" H 11950 4200 50  0000 L CNN
F 1 "D_Schottky" V 12045 4380 50  0001 L CNN
F 2 "" H 12000 4300 50  0001 C CNN
F 3 "~" H 12000 4300 50  0001 C CNN
	1    12000 4300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D8
U 1 1 6451D4CE
P 13550 4300
F 0 "D8" H 13500 4200 50  0000 L CNN
F 1 "D_Schottky" V 13595 4380 50  0001 L CNN
F 2 "" H 13550 4300 50  0001 C CNN
F 3 "~" H 13550 4300 50  0001 C CNN
	1    13550 4300
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR0103
U 1 1 6451E3F2
P 2800 3400
F 0 "#PWR0103" H 2800 3250 50  0001 C CNN
F 1 "+12V" H 2815 3573 50  0000 C CNN
F 2 "" H 2800 3400 50  0001 C CNN
F 3 "" H 2800 3400 50  0001 C CNN
	1    2800 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3400 2800 3500
Wire Wire Line
	2800 3500 3300 3500
Wire Wire Line
	3300 3500 3300 3600
Wire Wire Line
	14050 3500 14050 3600
Connection ~ 3300 3500
Wire Wire Line
	4300 4150 4300 3500
Connection ~ 4300 3500
Wire Wire Line
	4300 3500 4800 3500
Wire Wire Line
	4800 3600 4800 3500
Connection ~ 4800 3500
Wire Wire Line
	4800 3500 5800 3500
Wire Wire Line
	2800 4150 2800 3500
Connection ~ 2800 3500
Wire Wire Line
	5800 4150 5800 3500
Connection ~ 5800 3500
Wire Wire Line
	5800 3500 6300 3500
Wire Wire Line
	6300 3600 6300 3500
Connection ~ 6300 3500
Wire Wire Line
	6300 3500 7350 3500
Wire Wire Line
	7350 4150 7350 3500
Connection ~ 7350 3500
Wire Wire Line
	7350 3500 7850 3500
Wire Wire Line
	7850 3600 7850 3500
Connection ~ 7850 3500
Wire Wire Line
	7850 3500 8900 3500
Wire Wire Line
	8900 4150 8900 3500
Connection ~ 8900 3500
Wire Wire Line
	8900 3500 9400 3500
Wire Wire Line
	9400 3600 9400 3500
Connection ~ 9400 3500
Wire Wire Line
	9400 3500 10450 3500
Wire Wire Line
	10450 4150 10450 3500
Connection ~ 10450 3500
Wire Wire Line
	10450 3500 10950 3500
Wire Wire Line
	10950 3600 10950 3500
Connection ~ 10950 3500
Wire Wire Line
	10950 3500 12000 3500
Wire Wire Line
	12000 4150 12000 3500
Connection ~ 12000 3500
Wire Wire Line
	12000 3500 12500 3500
Wire Wire Line
	12500 3600 12500 3500
Connection ~ 12500 3500
Wire Wire Line
	13550 4150 13550 3500
Wire Wire Line
	12500 3500 13550 3500
Connection ~ 13550 3500
Wire Wire Line
	13550 3500 14050 3500
$Comp
L Device:R R9
U 1 1 6453F0C7
P 3300 5250
F 0 "R9" H 3231 5204 50  0000 R CNN
F 1 "R" H 3231 5295 50  0000 R CNN
F 2 "" V 3230 5250 50  0001 C CNN
F 3 "~" H 3300 5250 50  0001 C CNN
	1    3300 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R R10
U 1 1 6453FF50
P 4800 5250
F 0 "R10" H 4731 5204 50  0000 R CNN
F 1 "R" H 4731 5295 50  0000 R CNN
F 2 "" V 4730 5250 50  0001 C CNN
F 3 "~" H 4800 5250 50  0001 C CNN
	1    4800 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R R11
U 1 1 645402E7
P 6300 5250
F 0 "R11" H 6231 5204 50  0000 R CNN
F 1 "R" H 6231 5295 50  0000 R CNN
F 2 "" V 6230 5250 50  0001 C CNN
F 3 "~" H 6300 5250 50  0001 C CNN
	1    6300 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R R12
U 1 1 64540740
P 7850 5250
F 0 "R12" H 7781 5204 50  0000 R CNN
F 1 "R" H 7781 5295 50  0000 R CNN
F 2 "" V 7780 5250 50  0001 C CNN
F 3 "~" H 7850 5250 50  0001 C CNN
	1    7850 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 64540AFD
P 9400 5250
F 0 "R13" H 9331 5204 50  0000 R CNN
F 1 "R" H 9331 5295 50  0000 R CNN
F 2 "" V 9330 5250 50  0001 C CNN
F 3 "~" H 9400 5250 50  0001 C CNN
	1    9400 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 64541033
P 10950 5250
F 0 "R14" H 10881 5204 50  0000 R CNN
F 1 "R" H 10881 5295 50  0000 R CNN
F 2 "" V 10880 5250 50  0001 C CNN
F 3 "~" H 10950 5250 50  0001 C CNN
	1    10950 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R R15
U 1 1 64541629
P 12500 5250
F 0 "R15" H 12431 5204 50  0000 R CNN
F 1 "R" H 12431 5295 50  0000 R CNN
F 2 "" V 12430 5250 50  0001 C CNN
F 3 "~" H 12500 5250 50  0001 C CNN
	1    12500 5250
	1    0    0    1   
$EndComp
$Comp
L Device:R R16
U 1 1 64541EA9
P 14050 5250
F 0 "R16" H 13981 5204 50  0000 R CNN
F 1 "R" H 13981 5295 50  0000 R CNN
F 2 "" V 13980 5250 50  0001 C CNN
F 3 "~" H 14050 5250 50  0001 C CNN
	1    14050 5250
	1    0    0    1   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K8
U 1 1 644EFC99
P 14350 4300
F 0 "K8" H 14350 4967 50  0000 C CNN
F 1 "2-1419130-4" H 14350 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 14350 4300 50  0001 L BNN
F 3 "" H 14350 4300 50  0001 L BNN
F 4 "2-1419130-4" H 14350 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 14350 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    14350 4300
	0    -1   -1   0   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K7
U 1 1 644EFCA1
P 12800 4300
F 0 "K7" H 12800 4967 50  0000 C CNN
F 1 "2-1419130-4" H 12800 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 12800 4300 50  0001 L BNN
F 3 "" H 12800 4300 50  0001 L BNN
F 4 "2-1419130-4" H 12800 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 12800 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    12800 4300
	0    -1   1    0   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K6
U 1 1 644E21DB
P 11250 4300
F 0 "K6" H 11250 4967 50  0000 C CNN
F 1 "2-1419130-4" H 11250 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 11250 4300 50  0001 L BNN
F 3 "" H 11250 4300 50  0001 L BNN
F 4 "2-1419130-4" H 11250 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 11250 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    11250 4300
	0    -1   1    0   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K5
U 1 1 644E21D3
P 9700 4300
F 0 "K5" H 9700 4967 50  0000 C CNN
F 1 "2-1419130-4" H 9700 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 9700 4300 50  0001 L BNN
F 3 "" H 9700 4300 50  0001 L BNN
F 4 "2-1419130-4" H 9700 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 9700 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    9700 4300
	0    -1   1    0   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K4
U 1 1 644E21CB
P 8150 4300
F 0 "K4" H 8150 4967 50  0000 C CNN
F 1 "2-1419130-4" H 8150 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 8150 4300 50  0001 L BNN
F 3 "" H 8150 4300 50  0001 L BNN
F 4 "2-1419130-4" H 8150 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 8150 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    8150 4300
	0    -1   1    0   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K3
U 1 1 644E0741
P 6600 4300
F 0 "K3" H 6600 4967 50  0000 C CNN
F 1 "2-1419130-4" H 6600 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 6600 4300 50  0001 L BNN
F 3 "" H 6600 4300 50  0001 L BNN
F 4 "2-1419130-4" H 6600 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 6600 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    6600 4300
	0    -1   1    0   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K2
U 1 1 644E0739
P 5100 4300
F 0 "K2" H 5100 4967 50  0000 C CNN
F 1 "2-1419130-4" H 5100 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 5100 4300 50  0001 L BNN
F 3 "" H 5100 4300 50  0001 L BNN
F 4 "2-1419130-4" H 5100 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 5100 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    5100 4300
	0    -1   1    0   
$EndComp
$Comp
L 2-1419130-4:2-1419130-4 K1
U 1 1 644E0731
P 3600 4300
F 0 "K1" H 3600 4967 50  0000 C CNN
F 1 "2-1419130-4" H 3600 4876 50  0000 C CNN
F 2 "2-1419130-4:TE_2-1419130-4" H 3600 4300 50  0001 L BNN
F 3 "" H 3600 4300 50  0001 L BNN
F 4 "2-1419130-4" H 3600 4300 50  0001 L BNN "Comment"
F 5 "Compliant" H 3600 4300 50  0001 L BNN "EU_RoHS_Compliance"
	1    3600 4300
	0    -1   1    0   
$EndComp
Wire Wire Line
	2800 4450 2800 5050
Wire Wire Line
	2800 5050 3300 5050
Wire Wire Line
	3300 5050 3300 5000
Wire Wire Line
	3300 5100 3300 5050
Connection ~ 3300 5050
Wire Wire Line
	4300 4450 4300 5050
Wire Wire Line
	4300 5050 4800 5050
Wire Wire Line
	4800 5050 4800 5000
Wire Wire Line
	4800 5100 4800 5050
Connection ~ 4800 5050
Wire Wire Line
	5800 4450 5800 5050
Wire Wire Line
	5800 5050 6300 5050
Wire Wire Line
	6300 5050 6300 5000
Wire Wire Line
	6300 5100 6300 5050
Connection ~ 6300 5050
Wire Wire Line
	7350 4450 7350 5050
Wire Wire Line
	7350 5050 7850 5050
Wire Wire Line
	7850 5050 7850 5000
Wire Wire Line
	7850 5100 7850 5050
Connection ~ 7850 5050
Wire Wire Line
	8900 4450 8900 5050
Wire Wire Line
	8900 5050 9400 5050
Wire Wire Line
	9400 5050 9400 5000
Wire Wire Line
	9400 5100 9400 5050
Connection ~ 9400 5050
Wire Wire Line
	10450 4450 10450 5050
Wire Wire Line
	10450 5050 10950 5050
Wire Wire Line
	10950 5050 10950 5000
Wire Wire Line
	10950 5100 10950 5050
Connection ~ 10950 5050
Wire Wire Line
	12000 4450 12000 5050
Wire Wire Line
	12000 5050 12500 5050
Wire Wire Line
	12500 5050 12500 5000
Wire Wire Line
	12500 5100 12500 5050
Connection ~ 12500 5050
Wire Wire Line
	13550 4450 13550 5050
Wire Wire Line
	13550 5050 14050 5050
Wire Wire Line
	14050 5050 14050 5000
Wire Wire Line
	14050 5100 14050 5050
Connection ~ 14050 5050
Wire Wire Line
	3300 3500 4300 3500
$Comp
L power:GND #PWR0104
U 1 1 64565600
P 3300 5800
F 0 "#PWR0104" H 3300 5550 50  0001 C CNN
F 1 "GND" H 3305 5627 50  0000 C CNN
F 2 "" H 3300 5800 50  0001 C CNN
F 3 "" H 3300 5800 50  0001 C CNN
	1    3300 5800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 6456958D
P 4700 5600
F 0 "Q2" H 4890 5646 50  0000 L CNN
F 1 "2N3904" H 4890 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4900 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 4700 5600 50  0001 L CNN
	1    4700 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 64569593
P 4800 5800
F 0 "#PWR0105" H 4800 5550 50  0001 C CNN
F 1 "GND" H 4805 5627 50  0000 C CNN
F 2 "" H 4800 5800 50  0001 C CNN
F 3 "" H 4800 5800 50  0001 C CNN
	1    4800 5800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q3
U 1 1 6456AE5E
P 6200 5600
F 0 "Q3" H 6390 5646 50  0000 L CNN
F 1 "2N3904" H 6390 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6400 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 6200 5600 50  0001 L CNN
	1    6200 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 6456AE64
P 6300 5800
F 0 "#PWR0106" H 6300 5550 50  0001 C CNN
F 1 "GND" H 6305 5627 50  0000 C CNN
F 2 "" H 6300 5800 50  0001 C CNN
F 3 "" H 6300 5800 50  0001 C CNN
	1    6300 5800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q4
U 1 1 6456C6B5
P 7750 5600
F 0 "Q4" H 7940 5646 50  0000 L CNN
F 1 "2N3904" H 7940 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7950 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 7750 5600 50  0001 L CNN
	1    7750 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6456C6BB
P 7850 5800
F 0 "#PWR0107" H 7850 5550 50  0001 C CNN
F 1 "GND" H 7855 5627 50  0000 C CNN
F 2 "" H 7850 5800 50  0001 C CNN
F 3 "" H 7850 5800 50  0001 C CNN
	1    7850 5800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q5
U 1 1 6456DC92
P 9300 5600
F 0 "Q5" H 9490 5646 50  0000 L CNN
F 1 "2N3904" H 9490 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9500 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 9300 5600 50  0001 L CNN
	1    9300 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 6456DC98
P 9400 5800
F 0 "#PWR0108" H 9400 5550 50  0001 C CNN
F 1 "GND" H 9405 5627 50  0000 C CNN
F 2 "" H 9400 5800 50  0001 C CNN
F 3 "" H 9400 5800 50  0001 C CNN
	1    9400 5800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q6
U 1 1 6456F587
P 10850 5600
F 0 "Q6" H 11040 5646 50  0000 L CNN
F 1 "2N3904" H 11040 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 11050 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 10850 5600 50  0001 L CNN
	1    10850 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 6456F58D
P 10950 5800
F 0 "#PWR0109" H 10950 5550 50  0001 C CNN
F 1 "GND" H 10955 5627 50  0000 C CNN
F 2 "" H 10950 5800 50  0001 C CNN
F 3 "" H 10950 5800 50  0001 C CNN
	1    10950 5800
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q7
U 1 1 64570C8A
P 12400 5600
F 0 "Q7" H 12590 5646 50  0000 L CNN
F 1 "2N3904" H 12590 5555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 12600 5525 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 12400 5600 50  0001 L CNN
	1    12400 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 64570C90
P 12500 5800
F 0 "#PWR0110" H 12500 5550 50  0001 C CNN
F 1 "GND" H 12505 5627 50  0000 C CNN
F 2 "" H 12500 5800 50  0001 C CNN
F 3 "" H 12500 5800 50  0001 C CNN
	1    12500 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3600 3600 3400
Wire Wire Line
	3600 3400 5100 3400
Wire Wire Line
	5100 3600 5100 3400
Connection ~ 5100 3400
Wire Wire Line
	5100 3400 6600 3400
Wire Wire Line
	6600 3600 6600 3400
Connection ~ 6600 3400
Wire Wire Line
	6600 3400 8150 3400
Wire Wire Line
	8150 3600 8150 3400
Connection ~ 8150 3400
Wire Wire Line
	8150 3400 9700 3400
Connection ~ 9700 3400
Wire Wire Line
	9700 3400 11250 3400
Wire Wire Line
	9700 3400 9700 3600
Wire Wire Line
	11250 3600 11250 3400
$Comp
L Device:R R1
U 1 1 645802E6
P 1300 5400
F 0 "R1" V 1507 5400 50  0000 C CNN
F 1 "R" V 1416 5400 50  0000 C CNN
F 2 "" V 1230 5400 50  0001 C CNN
F 3 "~" H 1300 5400 50  0001 C CNN
	1    1300 5400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 64583B38
P 1300 6600
F 0 "R3" V 1507 6600 50  0000 C CNN
F 1 "R" V 1416 6600 50  0000 C CNN
F 2 "" V 1230 6600 50  0001 C CNN
F 3 "~" H 1300 6600 50  0001 C CNN
	1    1300 6600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 64583E40
P 1300 7200
F 0 "R4" V 1507 7200 50  0000 C CNN
F 1 "R" V 1416 7200 50  0000 C CNN
F 2 "" V 1230 7200 50  0001 C CNN
F 3 "~" H 1300 7200 50  0001 C CNN
	1    1300 7200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 64584268
P 1300 7800
F 0 "R5" V 1507 7800 50  0000 C CNN
F 1 "R" V 1416 7800 50  0000 C CNN
F 2 "" V 1230 7800 50  0001 C CNN
F 3 "~" H 1300 7800 50  0001 C CNN
	1    1300 7800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 645846A4
P 1300 8400
F 0 "R6" V 1507 8400 50  0000 C CNN
F 1 "R" V 1416 8400 50  0000 C CNN
F 2 "" V 1230 8400 50  0001 C CNN
F 3 "~" H 1300 8400 50  0001 C CNN
	1    1300 8400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 64584A6C
P 1300 9000
F 0 "R7" V 1507 9000 50  0000 C CNN
F 1 "R" V 1416 9000 50  0000 C CNN
F 2 "" V 1230 9000 50  0001 C CNN
F 3 "~" H 1300 9000 50  0001 C CNN
	1    1300 9000
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR0111
U 1 1 64585DCF
P 2400 3400
F 0 "#PWR0111" H 2400 3250 50  0001 C CNN
F 1 "+3V3" H 2415 3573 50  0000 C CNN
F 2 "" H 2400 3400 50  0001 C CNN
F 3 "" H 2400 3400 50  0001 C CNN
	1    2400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3400 2400 4150
Text HLabel 2250 2950 0    50   Input ~ 0
COMMON
$Comp
L power:GND #PWR0112
U 1 1 6458F26C
P 1650 5600
F 0 "#PWR0112" H 1650 5350 50  0001 C CNN
F 1 "GND" H 1655 5427 50  0000 C CNN
F 2 "" H 1650 5600 50  0001 C CNN
F 3 "" H 1650 5600 50  0001 C CNN
	1    1650 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 6458FA15
P 1650 6800
F 0 "#PWR0113" H 1650 6550 50  0001 C CNN
F 1 "GND" H 1655 6627 50  0000 C CNN
F 2 "" H 1650 6800 50  0001 C CNN
F 3 "" H 1650 6800 50  0001 C CNN
	1    1650 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 6458FC74
P 1650 7400
F 0 "#PWR0114" H 1650 7150 50  0001 C CNN
F 1 "GND" H 1655 7227 50  0000 C CNN
F 2 "" H 1650 7400 50  0001 C CNN
F 3 "" H 1650 7400 50  0001 C CNN
	1    1650 7400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 6459004D
P 1650 8000
F 0 "#PWR0115" H 1650 7750 50  0001 C CNN
F 1 "GND" H 1655 7827 50  0000 C CNN
F 2 "" H 1650 8000 50  0001 C CNN
F 3 "" H 1650 8000 50  0001 C CNN
	1    1650 8000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 64590473
P 1650 8600
F 0 "#PWR0116" H 1650 8350 50  0001 C CNN
F 1 "GND" H 1655 8427 50  0000 C CNN
F 2 "" H 1650 8600 50  0001 C CNN
F 3 "" H 1650 8600 50  0001 C CNN
	1    1650 8600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 645908B0
P 1650 9200
F 0 "#PWR0117" H 1650 8950 50  0001 C CNN
F 1 "GND" H 1655 9027 50  0000 C CNN
F 2 "" H 1650 9200 50  0001 C CNN
F 3 "" H 1650 9200 50  0001 C CNN
	1    1650 9200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 5600 3000 5600
Wire Wire Line
	2400 4450 2400 5400
Wire Wire Line
	2400 5400 2250 5400
Wire Wire Line
	1650 5400 1450 5400
Wire Wire Line
	1650 6000 1450 6000
$Comp
L power:GND #PWR0118
U 1 1 6458F699
P 1650 6200
F 0 "#PWR0118" H 1650 5950 50  0001 C CNN
F 1 "GND" H 1655 6027 50  0000 C CNN
F 2 "" H 1650 6200 50  0001 C CNN
F 3 "" H 1650 6200 50  0001 C CNN
	1    1650 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 64583826
P 1300 6000
F 0 "R2" V 1507 6000 50  0000 C CNN
F 1 "R" V 1416 6000 50  0000 C CNN
F 2 "" V 1230 6000 50  0001 C CNN
F 3 "~" H 1300 6000 50  0001 C CNN
	1    1300 6000
	0    -1   -1   0   
$EndComp
$Comp
L Isolator:LTV-847M U2
U 2 1 64507446
P 1950 6100
F 0 "U2" H 1950 6425 50  0000 C CNN
F 1 "LTV-847M" H 1950 6334 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W10.16mm" H 1950 5800 50  0001 C CNN
F 3 "http://www.us.liteon.com/downloads/LTV-817-827-847.PDF" H 1500 6500 50  0001 C CNN
	2    1950 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 6200 4300 6200
Wire Wire Line
	4300 6200 4300 5600
Wire Wire Line
	4300 5600 4500 5600
Wire Wire Line
	2250 6000 2400 6000
Wire Wire Line
	2400 6000 2400 5400
Connection ~ 2400 5400
Wire Wire Line
	2250 6600 2400 6600
Connection ~ 2400 6000
Wire Wire Line
	2250 6800 5800 6800
Wire Wire Line
	5800 6800 5800 5600
Wire Wire Line
	5800 5600 6000 5600
Wire Wire Line
	2250 7200 2400 7200
Wire Wire Line
	2400 6000 2400 6600
Connection ~ 2400 6600
Wire Wire Line
	2400 6600 2400 7200
Wire Wire Line
	2250 7400 7350 7400
Wire Wire Line
	7350 7400 7350 5600
Wire Wire Line
	7350 5600 7550 5600
Wire Wire Line
	1650 6600 1450 6600
Wire Wire Line
	1450 7200 1650 7200
Wire Wire Line
	1650 7800 1450 7800
Wire Wire Line
	2250 7800 2400 7800
Wire Wire Line
	2400 7800 2400 7200
Connection ~ 2400 7200
Wire Wire Line
	2250 8000 8900 8000
Wire Wire Line
	8900 8000 8900 5600
Wire Wire Line
	8900 5600 9100 5600
Wire Wire Line
	1650 8400 1450 8400
Wire Wire Line
	2250 8400 2400 8400
Wire Wire Line
	2400 8400 2400 7800
Connection ~ 2400 7800
Wire Wire Line
	2250 8600 10450 8600
Wire Wire Line
	10450 8600 10450 5600
Wire Wire Line
	10450 5600 10650 5600
Wire Wire Line
	1650 9000 1450 9000
Wire Wire Line
	2250 9000 2400 9000
Wire Wire Line
	2400 9000 2400 8400
Connection ~ 2400 8400
Wire Wire Line
	2250 9200 12000 9200
Wire Wire Line
	12000 9200 12000 5600
Wire Wire Line
	12000 5600 12200 5600
Text HLabel 15000 5550 2    50   Output ~ 0
SWITCHED_NEGATIVE
Text HLabel 15000 3350 2    50   Output ~ 0
SWITCHED_POSITIVE
Text HLabel 2250 2300 0    50   Input ~ 0
GROUND_1
Text HLabel 2250 2400 0    50   Input ~ 0
GROUND_2
Text HLabel 2250 2500 0    50   Input ~ 0
GROUND_3
Text HLabel 2250 2600 0    50   Input ~ 0
GROUND_4
Text HLabel 2250 2700 0    50   Input ~ 0
GROUND_5
Text HLabel 2250 2800 0    50   Input ~ 0
GROUND_6
Text HLabel 1150 9000 0    50   Input ~ 0
REVERSE_BIAS
Wire Wire Line
	11250 3400 13100 3400
Wire Wire Line
	13100 3400 13100 3600
Connection ~ 11250 3400
Wire Wire Line
	2250 2800 3900 2800
Wire Wire Line
	3900 2800 3900 3600
Wire Wire Line
	2250 2700 5400 2700
Wire Wire Line
	5400 2700 5400 3600
Wire Wire Line
	2250 2600 6900 2600
Wire Wire Line
	6900 2600 6900 3600
Wire Wire Line
	2250 2500 8450 2500
Wire Wire Line
	8450 2500 8450 3600
Wire Wire Line
	2250 2400 10000 2400
Wire Wire Line
	10000 2400 10000 3600
Wire Wire Line
	2250 2300 11550 2300
Wire Wire Line
	11550 2300 11550 3600
Text HLabel 1150 5400 0    50   Input ~ 0
SELECT_6
Text HLabel 1150 6000 0    50   Input ~ 0
SELECT_5
Text HLabel 1150 6600 0    50   Input ~ 0
SELECT_4
Text HLabel 1150 7200 0    50   Input ~ 0
SELECT_3
Text HLabel 1150 7800 0    50   Input ~ 0
SELECT_2
Text HLabel 1150 8400 0    50   Input ~ 0
SELECT_1
Wire Wire Line
	14050 5400 12500 5400
Connection ~ 12500 5400
Wire Wire Line
	14850 2950 14850 5400
Wire Wire Line
	14850 5400 14650 5400
Wire Wire Line
	14650 5400 14650 5000
Wire Wire Line
	2250 2950 14850 2950
Wire Wire Line
	15000 3350 14350 3350
Wire Wire Line
	14350 3350 14350 3600
Wire Wire Line
	14350 3350 12800 3350
Wire Wire Line
	12800 3350 12800 3600
Connection ~ 14350 3350
Wire Wire Line
	12800 5000 12800 5550
Wire Wire Line
	12800 5550 14350 5550
Wire Wire Line
	14350 5000 14350 5550
Connection ~ 14350 5550
Wire Wire Line
	14350 5550 15000 5550
$EndSCHEMATC