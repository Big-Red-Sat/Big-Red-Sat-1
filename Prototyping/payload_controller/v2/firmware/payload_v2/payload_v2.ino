/*
 * Payload Controller Firmware
 * UNL Aerospace Club
 * Aerospace eXperimental Payloads
 * 
 * Author: Walker Arce
 * Date: 26 Dec 2022
 */
#include "ADS131M04.h"
#include <MCP9808.h>      // http://github.com/JChristensen/MCP9808
#include "MCP4725.h"
#include <OneWire.h> 

// ADC Pins
#define ADC_CS    11
#define ADC_DRDY  18
#define ADC_MOSI  15
#define ADC_MISO  14
#define ADC_SCLK  7
#define ADC_SYNC  6
#define ADC_CLK   5

#define R_DIVIDER_V       A7
#define R_DIVIDER_I       A11

// Perovskite Multiplexer Pins
#define ENABLE_TEST_SOURCE    2
#define RESET_PANEL_SWITCH_A    27
#define RESET_PANEL_SWITCH_B  ADC_CS
#define ENABLE_PANEL_SWITCH   22
#define DECODER_10_19_CLOCK   21
#define DECODER_0_9_CLOCK     25

// Resistor Ladder Pins
#define R_DIVIDER_CLOCK   12
#define R_DIVIDER_LATCH   28
#define R_DIVIDER_RESET   13
#define R_DIVIDER_ENABLE  19

// GaAs Panel Pins
#define GAAS_TEMP A9

// Other Pins
#define FAULT         8
#define REVERSE_BIAS  26
#define ALERT         23

// Process Control Variables
#define ANALOG_SAMPLES_V      5
#define ANALOG_SAMPLES_I      5
#define DAC_ADDRESS           0x66
#define PEROVSKITE_1_LOWER    1
#define PEROVSKITE_2_LOWER    3 
#define PEROVSKITE_3_LOWER    7
#define FSS100_ADDRESS        0x57


#define ANALOG_SAMPLES_V    5
#define ANALOG_SAMPLES_I    5


ADS131M04 adc;
adcOutput res;

MCP9808 perovskite_1(PEROVSKITE_1_LOWER);
MCP9808 perovskite_2(PEROVSKITE_2_LOWER);
MCP9808 perovskite_3(PEROVSKITE_3_LOWER);

MCP4725 dac(DAC_ADDRESS); 

OneWire ds(GAAS_TEMP);

volatile int current_panel = 0;
volatile int current_step = 0;
volatile uint8_t status_register = 0;
volatile bool reverse_bias = false;

int v_readings[256];
int i_readings[256];

void setup_pins(void)
{
  pinMode(ENABLE_TEST_SOURCE, OUTPUT);
  digitalWrite(ENABLE_TEST_SOURCE, LOW);
  
  pinMode(RESET_PANEL_SWITCH_A, OUTPUT);
  digitalWrite(RESET_PANEL_SWITCH_A, LOW);

  pinMode(RESET_PANEL_SWITCH_B, OUTPUT);
  digitalWrite(RESET_PANEL_SWITCH_B, LOW);
  
  pinMode(ENABLE_PANEL_SWITCH, OUTPUT);
  digitalWrite(ENABLE_PANEL_SWITCH, LOW);
  
  pinMode(DECODER_10_19_CLOCK, OUTPUT);
  digitalWrite(DECODER_10_19_CLOCK, LOW);
  
  pinMode(DECODER_0_9_CLOCK, OUTPUT);
  digitalWrite(DECODER_0_9_CLOCK, LOW);

  pinMode(R_DIVIDER_CLOCK, OUTPUT);
  digitalWrite(R_DIVIDER_CLOCK, LOW);
  
  pinMode(R_DIVIDER_LATCH, OUTPUT);
  digitalWrite(R_DIVIDER_LATCH, HIGH);
  
  pinMode(R_DIVIDER_RESET, OUTPUT);
  pinMode(R_DIVIDER_RESET, HIGH);
  
  pinMode(R_DIVIDER_ENABLE, OUTPUT);
  digitalWrite(R_DIVIDER_ENABLE, LOW);

  pinMode(FAULT, OUTPUT);
  digitalWrite(FAULT, LOW);

  pinMode(REVERSE_BIAS, OUTPUT);
  digitalWrite(REVERSE_BIAS, LOW);

  pinMode(ALERT, INPUT);
  pinMode(R_DIVIDER_V, INPUT);
  pinMode(R_DIVIDER_I, INPUT);
//  pinMode(ADC_SYNC, OUTPUT);
//  digitalWrite(ADC_SYNC, HIGH);

//  Wire.begin();
//
//  adc.begin(ADC_SCLK, ADC_MISO, ADC_MOSI, ADC_CS, ADC_DRDY);
//  if (!adc.setInputChannelSelection(0, INPUT_CHANNEL_MUX_AIN0P_AIN0N))
//  {
//    Serial.println("Could not connect ADC Input 1");
//  }
//  else
//  {
//    adc.setChannelPGA(0, 1);
//  }
//  if (!adc.setInputChannelSelection(3, INPUT_CHANNEL_MUX_AIN0P_AIN0N))
//  {
//    Serial.println("Could not connect ADC Input 4");
//  }
//  else
//  {
//    adc.setChannelPGA(3, 1);
//  }
//  if (perovskite_1.begin() != 0)
//  {
//    Serial.println("Could not find perovskite temp sensor 1");
//  }
//  if (perovskite_2.begin() != 0)
//  {
//    Serial.println("Could not find perovskite temp sensor 2");
//  }
//  if (perovskite_3.begin() != 0)
//  {
//    Serial.println("Could not find perovskite temp sensor 3");
//  }
//  if (dac.begin() == false)
//  {
//    Serial.println("Could not find DAC");
//  }
}

void read_point(int reading_index)
{
  Serial.print(reading_index);
  Serial.print(" ");
  Serial.print(v_readings[reading_index]);
  Serial.print(" ");
  Serial.print(i_readings[reading_index]);
  Serial.println();
}

void reset_ladder(void)
{
  digitalWrite(R_DIVIDER_RESET, LOW);
  digitalWrite(R_DIVIDER_RESET, HIGH);
  current_step = 0;
}

void step_ladder(void)
{
  digitalWrite(R_DIVIDER_CLOCK, HIGH);
  digitalWrite(R_DIVIDER_LATCH, LOW);
  digitalWrite(R_DIVIDER_CLOCK, LOW);
  digitalWrite(R_DIVIDER_LATCH, HIGH);
  current_step++;
}

int read_divider_v(void)
{
  analogReference(INTERNAL2V5);
  int readings = 0;
  for (int i = 0; i < ANALOG_SAMPLES_V; i++)
  {
    readings += analogRead(R_DIVIDER_V);
  }
  return readings / ANALOG_SAMPLES_V;
}

int read_divider_i(void)
{
  analogReference(INTERNAL2V5);
  int readings = 0;
  for (int i = 0; i < ANALOG_SAMPLES_I; i++)
  {
    readings += analogRead(R_DIVIDER_I);
  }
  return readings / ANALOG_SAMPLES_I;
}

void trace_curve(void)
{
  for (int i = 0; i < 256; i++)
  {
    v_readings[i] = read_divider_v();
    i_readings[i] = read_divider_i();
    step_ladder();
  }
  for (int i = 0; i < 256; i++)
  {
    read_point(i);
  }
  reset_ladder();
}

void step_decoder(void)
{
  if (current_panel == 20)
  {
    reset_decoder();
  }
  if (current_panel == 10)
  {
    digitalWrite(RESET_PANEL_SWITCH_A, HIGH);
    digitalWrite(ENABLE_PANEL_SWITCH, HIGH);
    digitalWrite(RESET_PANEL_SWITCH_B, LOW);
  }
  if (current_panel < 10)
  {
    digitalWrite(DECODER_0_9_CLOCK, HIGH);
    digitalWrite(DECODER_0_9_CLOCK, LOW);
  }
  else
  {
    digitalWrite(DECODER_10_19_CLOCK, HIGH);
    digitalWrite(DECODER_10_19_CLOCK, LOW);
  }
  
  current_panel++;
  Serial.println(current_panel);
}

void reset_decoder(void)
{
  current_panel = 0;
  digitalWrite(ENABLE_PANEL_SWITCH, HIGH);
  digitalWrite(RESET_PANEL_SWITCH_B, HIGH);
  digitalWrite(RESET_PANEL_SWITCH_B, LOW);
  digitalWrite(RESET_PANEL_SWITCH_B, HIGH);
  digitalWrite(DECODER_10_19_CLOCK, HIGH);
  
  digitalWrite(ENABLE_PANEL_SWITCH, LOW);
  digitalWrite(RESET_PANEL_SWITCH_A, HIGH);
  digitalWrite(RESET_PANEL_SWITCH_A, LOW);
  digitalWrite(DECODER_0_9_CLOCK, LOW);  
}


void setup() {
  Serial.begin(115200);
  analogReadResolution(12);
  setup_pins();
  reset_decoder();
  reset_ladder();
}

void loop() {
//  while (true)
//  {
//    digitalWrite(DECODER_10_19_CLOCK, HIGH);
//    digitalWrite(DECODER_0_9_CLOCK, HIGH); 
//    delay(500);
//    digitalWrite(DECODER_10_19_CLOCK, LOW);
//    digitalWrite(DECODER_0_9_CLOCK, LOW); 
//    delay(500);
//  }
//  while (true)
//  {
//    Serial.print("Voltage: ");
//    Serial.print(read_divider_v());
//    Serial.print(" | Current: ");
//    Serial.println(read_divider_i());
//    delay(250);
//  }
//  adcOutput res2;
//  while (true)
//  {
//    if (adc.isDataReady())
//    {
//      res2 = adc.readADC();
//  
//      Serial.print("0: ");
//      Serial.print(res2.ch0);
//      Serial.print(" | 1: ");
//      Serial.print(res2.ch1);
//      Serial.print(" | 2: ");
//      Serial.print(res2.ch2);
//      Serial.print(" | 3: ");
//      Serial.print(res2.ch3);
//      Serial.print(" | STATUS: ");
//      Serial.println(res2.status, BIN);
//    }
//    delay(100);
//  }
  while (Serial.available() > 0)
  {
    char command[1];
    char params[1];
    size_t bytesRead = Serial.readBytes(command, 1);
    if (command[0] == 67)
    {
      trace_curve();
    }
    else if (command[0] == 68)
    {
      Serial.println(current_panel);
    }
    else if (command[0] == 69)
    {
      step_decoder();
    }
    else if (command[0] == 70)
    {
      size_t bytesRead = Serial.readBytes(params, 1);
      if (0 < params[0] < 4095) Serial.println(dac.setValue(params[0]));
    }
    else if (command[0] == 71)
    {
      reverse_bias ^= 1;
      digitalWrite(REVERSE_BIAS, reverse_bias);
      Serial.println(reverse_bias);
    }
    // TODO:  conversions from bin to voltage, curve tracing time, does the DAC make the resistor ladder obsolete, current source calibration, onewire temperature measurements,
    //        sun sensor interfacing, selection of resistor ladder resistors, reverse biased panels 
  }
}
