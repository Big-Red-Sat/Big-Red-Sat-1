/*
 * Payload Controller Firmware
 * UNL Aerospace Club
 * Aerospace eXperimental Payloads
 * 
 * Author: Walker Arce
 * Date: 26 Dec 2022
 */

 // C:\Users\wsarc\Downloads\energia-1.8.10E23-windows\energia-1.8.10E23\hardware\tools\DSLite/DebugServer/bin/DSLite load -c C:\Users\wsarc\Downloads\energia-1.8.10E23-windows\energia-1.8.10E23\hardware\tools\DSLite/MSP-EXP430FR5969LP.ccxml -f C:\Users\wsarc\AppData\Local\Temp\arduino_build_860748/iv_curve_tracer.ino.elf
#include <MCP9808.h>      // http://github.com/JChristensen/MCP9808
#include "MCP4725.h"

#define R_DIVIDER_V       A11
#define R_DIVIDER_I       A10

// Perovskite Multiplexer Pins
#define RESET_PANEL_SWITCH    14
#define ENABLE_PANEL_SWITCH   13
#define DECODER_0_5_CLOCK     12

// Resistor Ladder Pins
#define R_DIVIDER_CLOCK   8
#define R_DIVIDER_RESET   7

// Other Pins
#define REVERSE_BIAS  15

// Process Control Variables
#define ANALOG_SAMPLES_V      10
#define ANALOG_SAMPLES_I      10
#define SETTLING_TIME         10

#define PEROVSKITE_1_LOWER    0

#define SWITCH1           27
#define SWITCH2           28
#define LED1              25
#define LED2              P2_7

MCP9808 perovskite_1(PEROVSKITE_1_LOWER);

volatile int current_panel = 0;
volatile int current_step = 0;
volatile uint8_t status_register = 0;
volatile bool reverse_bias = false;

int v_readings[256];
int i_readings[256];
int t_reading;

uint8_t status;

void setup_pins(void)
{
  perovskite_1.begin();
  
  pinMode(RESET_PANEL_SWITCH, OUTPUT);
  digitalWrite(RESET_PANEL_SWITCH, LOW);
  
  pinMode(ENABLE_PANEL_SWITCH, OUTPUT);
  digitalWrite(ENABLE_PANEL_SWITCH, LOW);
  
  pinMode(DECODER_0_5_CLOCK, OUTPUT);
  digitalWrite(DECODER_0_5_CLOCK, LOW);

  pinMode(R_DIVIDER_CLOCK, OUTPUT);
  digitalWrite(R_DIVIDER_CLOCK, LOW);
  
  pinMode(R_DIVIDER_RESET, OUTPUT);
  pinMode(R_DIVIDER_RESET, HIGH);

  pinMode(REVERSE_BIAS, OUTPUT);
  digitalWrite(REVERSE_BIAS, LOW);

  pinMode(R_DIVIDER_V, INPUT);
  pinMode(R_DIVIDER_I, INPUT);

  pinMode(SWITCH1, INPUT_PULLUP);
  pinMode(LED1, OUTPUT);
  digitalWrite(LED1, LOW);
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
  digitalWrite(R_DIVIDER_CLOCK, LOW);
  current_step++;
}

int read_divider_v(void)
{
  int readings = 0;
  for (int i = 0; i < ANALOG_SAMPLES_V; i++)
  {
    readings += analogRead(R_DIVIDER_V);
  }
  return readings / ANALOG_SAMPLES_V;
}

int read_divider_i(void)
{
  int readings = 0;
  for (int i = 0; i < ANALOG_SAMPLES_I; i++)
  {
    readings += analogRead(R_DIVIDER_I);
  }
  return readings / ANALOG_SAMPLES_I;
}

void trace_curve(void)
{
  if ((status = perovskite_1.read()) == 0 )
  {
    t_reading = (int)((perovskite_1.tAmbient / 16.0)*100);
  }
  else
  {
    t_reading = 0;
  }
  for (int i = 0; i < 256; i++)
  {
    delay(SETTLING_TIME);
    v_readings[i] = read_divider_v();
    i_readings[i] = read_divider_i();
    step_ladder();
  }
  for (int i = 0; i < 256; i++)
  {
    read_point(i);
  }
  Serial.println(t_reading);
  
  reset_ladder();
}

void step_decoder(void)
{
  if (current_panel >= 5)
  {
    reset_decoder();
  }
  else
  {
    current_panel++;
  }
  if (current_panel > 0)
  {
    digitalWrite(DECODER_0_5_CLOCK, HIGH);
    digitalWrite(DECODER_0_5_CLOCK, LOW);
  }
  Serial.println(current_panel);
}

void reset_decoder(void)
{
  current_panel = 0;
  digitalWrite(RESET_PANEL_SWITCH, HIGH);
  digitalWrite(RESET_PANEL_SWITCH, LOW);
  digitalWrite(DECODER_0_5_CLOCK, LOW);  
  digitalWrite(ENABLE_PANEL_SWITCH, HIGH);
}

void setup() {
  Serial.begin(115200);
  
  analogReadResolution(12);
  analogReference(EXTERNAL);
  
  setup_pins();
  reset_decoder();
  reset_ladder();
}

void loop() {
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
  }
  if (!digitalRead(SWITCH1))
  {
    digitalWrite(LED1, HIGH);
    
    if ((status = perovskite_1.read()) == 0)
    {
      Serial.println(perovskite_1.tAmbient / 16.0);
    }
    else
    {
      while(1);
    }

    while (!digitalRead(SWITCH1));
    digitalWrite(LED1, LOW);
  }
}
