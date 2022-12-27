/*
 * Payload Controller Firmware
 * UNL Aerospace Club
 * Aerospace eXperimental Payloads
 * 
 * Author: Walker Arce
 * Date: 26 Dec 2022
 */

#include <Arduino.h>
#include "ADS131M04.h"
#include <MCP9808.h>      // http://github.com/JChristensen/MCP9808
#include "Wire.h"
#include "MCP4725.h"

// ADC Pins
#define ADC_CS    11
#define ADC_DRDY  18
#define ADC_MOSI  15
#define ADC_MISO  14
#define ADC_SCLK  7
#define ADC_SYNC  6

// Perovskite Multiplexer Pins
#define ENABLE_TEST_SOURCE    2
#define RESET_PANEL_SWITCH    27
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

ADS131M04 adc;
MCP9808 perovskite_1(PEROVSKITE_1_LOWER);
MCP9808 perovskite_2(PEROVSKITE_2_LOWER);
MCP9808 perovskite_3(PEROVSKITE_3_LOWER);
MCP4725 dac(DAC_ADDRESS); 

volatile int current_panel = 0;
volatile int current_step = 0;

int v_readings[256];
int i_readings[256];

void setup_pins(void)
{
  pinMode(ENABLE_TEST_SOURCE, OUTPUT);
  digitalWrite(ENABLE_TEST_SOURCE, LOW);
  
  pinMode(RESET_PANEL_SWITCH, OUTPUT);
  digitalWrite(RESET_PANEL_SWITCH, LOW);
  
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

  pinMode(ALERT, OUTPUT);
  digitalWrite(ALERT, LOW);

  pinMode(ADC_SYNC, INPUT);
  pinMode(GAAS_TEMP, INPUT);
}

//int read_divider_v(void)
//{
//  analogReference(INTERNAL2V5);
//  int readings = 0;
//  for (int i = 0; i < ANALOG_SAMPLES_V; i++)
//  {
//    readings += analogRead(R_DIVIDER_V);
//  }
//  return readings / ANALOG_SAMPLES_V;
//}

//int read_divider_i(void)
//{
//  analogReference(INTERNAL1V2);
//  int readings = 0;
//  for (int i = 0; i < ANALOG_SAMPLES_I; i++)
//  {
//    readings += analogRead(R_DIVIDER_I);
//  }
//  return readings / ANALOG_SAMPLES_I;
//}

void read_point(int reading_index)
{
  Serial.print(current_step);
  Serial.print(" ");
  Serial.print(v_readings[reading_index]);
  Serial.print(" ");
  Serial.print(i_readings[reading_index]);
  Serial.println();
}

void reset_ladder(void)
{
  digitalWrite(R_DIVIDER_RESET, LOW);
  delay(100);
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

//void trace_curve(void)
//{
//  for (int i = 0; i < 256; i++)
//  {
//    v_readings[i] = read_divider_v();
//    i_readings[i] = read_divider_i();
//    step_ladder();
//  }
//  for (int i = 0; i < 256; i++)
//  {
//    read_point(i);
//  }
//  reset_ladder();
//}

void step_decoder(void)
{
  if (current_panel == 11)
  {
    digitalWrite(ENABLE_PANEL_SWITCH, HIGH);
  }
  if (current_panel > 10)
  {
//    enable_led2();
    digitalWrite(DECODER_10_19_CLOCK, HIGH);
    digitalWrite(DECODER_10_19_CLOCK, LOW);
//    disable_led2();
  }
  else
  {
//    enable_led1();
    digitalWrite(DECODER_0_9_CLOCK, HIGH);
    digitalWrite(DECODER_0_9_CLOCK, LOW);
//    disable_led1();
  }
  current_panel++;
  if (current_panel > 20)
  {
    reset_decoder();
  }
  Serial.println(current_panel);
}

void reset_decoder(void)
{
  current_panel = 1;
  digitalWrite(RESET_PANEL_SWITCH, HIGH);
  digitalWrite(RESET_PANEL_SWITCH, LOW);
  
  digitalWrite(ENABLE_PANEL_SWITCH, LOW);
  digitalWrite(DECODER_0_9_CLOCK, LOW);
  digitalWrite(DECODER_10_19_CLOCK, LOW);
}


void setup() {
  Serial.println(115200);
  
  adc.begin(ADC_SCLK, ADC_MISO, ADC_MOSI, ADC_CS, ADC_DRDY);
  if (adc.setInputChannelSelection(0, INPUT_CHANNEL_MUX_AIN0P_AIN0N)) Serial.println("Could not connect ADC Input 1");
  if (adc.setInputChannelSelection(1, INPUT_CHANNEL_MUX_AIN0P_AIN0N)) Serial.println("Could not connect ADC Input 2");
  if (adc.setInputChannelSelection(2, INPUT_CHANNEL_MUX_AIN0P_AIN0N)) Serial.println("Could not connect ADC Input 3");
  if (adc.setInputChannelSelection(3, INPUT_CHANNEL_MUX_AIN0P_AIN0N)) Serial.println("Could not connect ADC Input 4");
  
  if (perovskite_1.begin() != 0)
  {
    Serial.println("Could not find perovskite temp sensor 1");
  }
  if (perovskite_2.begin() != 0)
  {
    Serial.println("Could not find perovskite temp sensor 2");
  }
  if (perovskite_3.begin() != 0)
  {
    Serial.println("Could not find perovskite temp sensor 3");
  }
  if (dac.begin() == false)
  {
    Serial.println("Could not find DAC");
  }
}

void loop() {
  adcOutput res;
  delay(100);

  while (1)
  {
    if (adc.isDataReady())
    {
      res = adc.readADC();

      Serial.print("Status = ");
      Serial.println(res.status, BIN);

      Serial.print("CH0 = ");
      Serial.println(res.ch0);

      Serial.print("CH1 = ");
      Serial.println(res.ch1);
      Serial.print("CH2 = ");
      Serial.println(res.ch2);
      Serial.print("CH3 = ");
      Serial.println(res.ch3);
      Serial.println("");
      delay(500);
    }
  }
}
