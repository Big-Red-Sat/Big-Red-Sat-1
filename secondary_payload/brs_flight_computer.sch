EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Big Red Satellite Flight Computer - Top Level"
Date "2023-08-16"
Rev "B"
Comp "UNL Aerospace Club | Advanced eXperimental Payloads"
Comment1 "Copyright (c) 2023"
Comment2 "Designer: WSA"
Comment3 "Reviewer: WSA"
Comment4 "Approved: WSA"
$EndDescr
Text HLabel 6000 3750 0    50   Input ~ 0
SCL
Text HLabel 6000 3850 0    50   Input ~ 0
SDA
Text HLabel 6000 3950 0    50   Input ~ 0
MAG_INT
Text HLabel 6000 4050 0    50   Input ~ 0
SET
Text HLabel 6000 4150 0    50   Input ~ 0
UNSET
Text HLabel 6000 4250 0    50   Input ~ 0
NO_V
Text HLabel 6000 4350 0    50   Input ~ 0
NC_V
$Comp
L Connector:Conn_01x10_Male J?
U 1 1 64DDA625
P 6200 3850
AR Path="/6685FD81/64DDA625" Ref="J?"  Part="1" 
AR Path="/64DDA625" Ref="J3"  Part="1" 
F 0 "J3" H 6172 3824 50  0000 R CNN
F 1 "Conn_01x10_Male" H 6172 3733 50  0000 R CNN
F 2 "Connector_Molex:Molex_PicoBlade_53047-1010_1x10_P1.25mm_Vertical" H 6200 3850 50  0001 C CNN
F 3 "~" H 6200 3850 50  0001 C CNN
	1    6200 3850
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64DDA62B
P 5800 3650
AR Path="/6685FD81/64DDA62B" Ref="#PWR?"  Part="1" 
AR Path="/64DDA62B" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 5800 3400 50  0001 C CNN
F 1 "GND" V 5805 3522 50  0000 R CNN
F 2 "" H 5800 3650 50  0001 C CNN
F 3 "" H 5800 3650 50  0001 C CNN
	1    5800 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	5800 3650 6000 3650
$Comp
L power:VDDF #PWR?
U 1 1 64DDA632
P 5950 3400
AR Path="/64D821F3/64DDA632" Ref="#PWR?"  Part="1" 
AR Path="/6685FD81/64DDA632" Ref="#PWR?"  Part="1" 
AR Path="/64DDA632" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 5950 3250 50  0001 C CNN
F 1 "VDDF" H 5965 3573 50  0000 C CNN
F 2 "" H 5950 3400 50  0001 C CNN
F 3 "" H 5950 3400 50  0001 C CNN
	1    5950 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3400 5950 3450
Wire Wire Line
	5950 3450 6000 3450
Wire Wire Line
	5750 3400 5750 3550
Wire Wire Line
	5750 3550 6000 3550
$Comp
L power:VPP #PWR?
U 1 1 64DDA63C
P 5750 3400
AR Path="/64D821F3/64DDA63C" Ref="#PWR?"  Part="1" 
AR Path="/6685FD81/64DDA63C" Ref="#PWR?"  Part="1" 
AR Path="/64DDA63C" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 5750 3250 50  0001 C CNN
F 1 "VPP" H 5765 3573 50  0000 C CNN
F 2 "" H 5750 3400 50  0001 C CNN
F 3 "" H 5750 3400 50  0001 C CNN
	1    5750 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Male J1
U 1 1 64DDDD18
P 4100 4000
F 0 "J1" H 4072 3928 50  0000 R CNN
F 1 "Conn_01x06_Male" H 4072 3973 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 4100 4000 50  0001 C CNN
F 3 "~" H 4100 4000 50  0001 C CNN
	1    4100 4000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x06_Male J2
U 1 1 64DDE9CD
P 4350 3900
F 0 "J2" H 4458 4189 50  0000 C CNN
F 1 "Conn_01x06_Male" H 4458 4190 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 4350 3900 50  0001 C CNN
F 3 "~" H 4350 3900 50  0001 C CNN
	1    4350 3900
	1    0    0    -1  
$EndComp
$Comp
L power:VDDF #PWR?
U 1 1 64DDF567
P 3800 3650
AR Path="/64D821F3/64DDF567" Ref="#PWR?"  Part="1" 
AR Path="/6685FD81/64DDF567" Ref="#PWR?"  Part="1" 
AR Path="/64DDF567" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 3800 3500 50  0001 C CNN
F 1 "VDDF" H 3815 3823 50  0000 C CNN
F 2 "" H 3800 3650 50  0001 C CNN
F 3 "" H 3800 3650 50  0001 C CNN
	1    3800 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64DDFB38
P 3900 3900
AR Path="/6685FD81/64DDFB38" Ref="#PWR?"  Part="1" 
AR Path="/64DDFB38" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 3900 3650 50  0001 C CNN
F 1 "GND" V 3905 3772 50  0000 R CNN
F 2 "" H 3900 3900 50  0001 C CNN
F 3 "" H 3900 3900 50  0001 C CNN
	1    3900 3900
	0    1    1    0   
$EndComp
Text HLabel 3900 4000 0    50   Input ~ 0
SCL
Text HLabel 3900 4100 0    50   Input ~ 0
SDA
Text HLabel 3900 4200 0    50   Input ~ 0
MAG_INT
Wire Wire Line
	3900 3700 3800 3700
Wire Wire Line
	3800 3700 3800 3650
NoConn ~ 3900 3800
NoConn ~ 4550 3700
NoConn ~ 4550 3800
NoConn ~ 4550 3900
NoConn ~ 4550 4000
NoConn ~ 4550 4100
NoConn ~ 4550 4200
$Comp
L Connector:Conn_01x12_Male J6
U 1 1 64DE0A5A
P 8300 3900
F 0 "J6" H 8408 4489 50  0000 C CNN
F 1 "Conn_01x12_Male" H 8408 4490 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 8300 3900 50  0001 C CNN
F 3 "~" H 8300 3900 50  0001 C CNN
	1    8300 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x16_Male J4
U 1 1 64DE5069
P 8000 3800
F 0 "J4" H 7972 3728 50  0000 R CNN
F 1 "Conn_01x16_Male" H 7972 3773 50  0001 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 8000 3800 50  0001 C CNN
F 3 "~" H 8000 3800 50  0001 C CNN
	1    8000 3800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 64DE7A73
P 7800 3300
AR Path="/6685FD81/64DE7A73" Ref="#PWR?"  Part="1" 
AR Path="/64DE7A73" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 7800 3050 50  0001 C CNN
F 1 "GND" V 7805 3172 50  0000 R CNN
F 2 "" H 7800 3300 50  0001 C CNN
F 3 "" H 7800 3300 50  0001 C CNN
	1    7800 3300
	0    1    1    0   
$EndComp
$Comp
L power:VPP #PWR?
U 1 1 64DE81A7
P 7600 2900
AR Path="/64D821F3/64DE81A7" Ref="#PWR?"  Part="1" 
AR Path="/6685FD81/64DE81A7" Ref="#PWR?"  Part="1" 
AR Path="/64DE81A7" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 7600 2750 50  0001 C CNN
F 1 "VPP" H 7615 3073 50  0000 C CNN
F 2 "" H 7600 2900 50  0001 C CNN
F 3 "" H 7600 2900 50  0001 C CNN
	1    7600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3100 7600 3100
Wire Wire Line
	7600 3100 7600 2900
Text HLabel 7800 3500 0    50   Input ~ 0
SET
Text HLabel 7800 3600 0    50   Input ~ 0
UNSET
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 64DE9364
P 8150 4650
F 0 "J5" V 8212 4794 50  0000 L CNN
F 1 "Conn_01x03_Male" V 8303 4794 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-3_1x03_P5.00mm_Horizontal" H 8150 4650 50  0001 C CNN
F 3 "~" H 8150 4650 50  0001 C CNN
	1    8150 4650
	0    1    1    0   
$EndComp
Text HLabel 8250 4850 3    50   Input ~ 0
NO_V
Text HLabel 8050 4850 3    50   Input ~ 0
NC_V
$Comp
L power:VPP #PWR?
U 1 1 64DEAA88
P 8150 4850
AR Path="/64D821F3/64DEAA88" Ref="#PWR?"  Part="1" 
AR Path="/6685FD81/64DEAA88" Ref="#PWR?"  Part="1" 
AR Path="/64DEAA88" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 8150 4700 50  0001 C CNN
F 1 "VPP" H 8165 5023 50  0000 C CNN
F 2 "" H 8150 4850 50  0001 C CNN
F 3 "" H 8150 4850 50  0001 C CNN
	1    8150 4850
	-1   0    0    1   
$EndComp
$EndSCHEMATC