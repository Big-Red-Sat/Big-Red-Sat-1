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
adcOutput res;

MCP9808 perovskite_1(PEROVSKITE_1_LOWER);
MCP9808 perovskite_2(PEROVSKITE_2_LOWER);
MCP9808 perovskite_3(PEROVSKITE_3_LOWER);

MCP4725 dac(DAC_ADDRESS); 

//OneWire ds(GAAS_TEMP);

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

  pinMode(ALERT, INPUT);
  pinMode(ADC_SYNC, INPUT);

  Wire.begin();

  adc.begin(ADC_SCLK, ADC_MISO, ADC_MOSI, ADC_CS, ADC_DRDY);
  if (!adc.setInputChannelSelection(0, INPUT_CHANNEL_MUX_AIN0P_AIN0N))
  {
    Serial.println("Could not connect ADC Input 1");
  }
  if (!adc.setInputChannelSelection(3, INPUT_CHANNEL_MUX_AIN0P_AIN0N))
  {
    Serial.println("Could not connect ADC Input 4");
  }
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

void trace_curve(void)
{
  for (int i = 0; i < 256; i++)
  {
    while (!adc.isDataReady());
    res = adc.readADC();
    
    v_readings[i] = res.ch3;
    i_readings[i] = res.ch0;
    
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
  if (current_panel == 11)
  {
    digitalWrite(ENABLE_PANEL_SWITCH, HIGH);
  }
  if (current_panel > 10)
  {
    digitalWrite(DECODER_10_19_CLOCK, HIGH);
    digitalWrite(DECODER_10_19_CLOCK, LOW);
  }
  else
  {
    digitalWrite(DECODER_0_9_CLOCK, HIGH);
    digitalWrite(DECODER_0_9_CLOCK, LOW);
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
  Serial.begin(115200);
  Serial.println("Payload V1 starting up");
  setup_pins();
  reset_decoder();
  reset_ladder();
}

uint16_t output_v = 2000;
void loop() {
  while (true)
  {
    Serial.print(dac.setValue(output_v++));
    Serial.print(": ");
    Serial.println(output_v);
    delay(100);
    if (output_v > 4095) output_v = 0;
  }
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
    // TODO:  conversions from bin to voltage, curve tracing time, does the DAC make the resistor ladder obsolete, current source calibration, onewire temperature measurements,
    //        sun sensor interfacing, selection of resistor ladder resistors, reverse biased panels 
  }
}
