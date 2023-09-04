#include "Energia.h"
#include "FSS100.h"
#include <MCP9808.h>
#include <OneWire.h>
#include <stdio.h>
#include "NSL_EPS.h"
#include <Wire.h>
#include <MLX90393.h>

#define DEBUGGING
#define COUNT_UP HIGH
#define COUNT_DOWN LOW

#define MUX_POS_GAAS 0
#define MUX_POS_P1 3
#define MUX_POS_P2 2
#define MUX_POS_P3 1

#define PEROVSKITE_1_LOWER    1
#define PEROVSKITE_2_LOWER    7
#define PEROVSKITE_3_LOWER    3

// Temperature sensors on the payload
MCP9808 perovskite_1(PEROVSKITE_1_LOWER);
MCP9808 perovskite_2(PEROVSKITE_2_LOWER);
MCP9808 perovskite_3(PEROVSKITE_3_LOWER);

EPS eps(EPS_RX, EPS_TX);

MLX90393 magnetometer;
MLX90393::txyz data;

// Temperature sensor on the reference GaAs panel
OneWire gaas_temp_sensor(GAAS_TEMP);
// Sun vector sensor
FSS100 sun_sensor(0x11);

volatile long last_gaas_rot = 0;
volatile long last_p3_rot = 0;
volatile bool last_p3_en = false;
volatile int current_rot = 0;
int16_t theta;
int16_t phi;

void init_pins(void)
{
  pinMode(NC_V, INPUT);
  pinMode(S1_CT, OUTPUT);
  digitalWrite(S1_CT, LOW);
  
  pinMode(READ_CURRENT, INPUT);
  pinMode(READ_VOLTAGE, INPUT);
  pinMode(NO_V, INPUT);
  pinMode(UNSET, OUTPUT);
  digitalWrite(UNSET, LOW);
  pinMode(SET, OUTPUT);
  digitalWrite(SET, LOW);
  pinMode(MAG_INT, INPUT);
  pinMode(CT_GOOD, INPUT);
  pinMode(GAAS_ON, INPUT);
  pinMode(MUX_GOOD, INPUT);
  pinMode(MUX_CLOCK, INPUT);
  pinMode(READ_BUSS, INPUT);
  
  pinMode(LADDER_CLOCK, OUTPUT);
  digitalWrite(LADDER_CLOCK, LOW);
  pinMode(TRACE_DIR, OUTPUT);
  digitalWrite(TRACE_DIR, COUNT_UP);
  
  pinMode(GAAS_TEMP, INPUT);
  pinMode(BUSY, INPUT);
  pinMode(PANEL_3_ON, INPUT);
  
  pinMode(S0_CT, OUTPUT);
  digitalWrite(S0_CT, LOW);
}

void init_magnetometer(void)
{
  magnetometer.begin(0, 0); //Assumes I2C jumpers are GND. No DRDY pin used.
  magnetometer.setOverSampling(0);
  magnetometer.setDigitalFiltering(0);
}

void read_magnetometer(void)
{
  magnetometer.readData(data); //Read the values from the sensor

  Serial.print("magX[");
  Serial.print(data.x);
  Serial.print("] magY[");
  Serial.print(data.y);
  Serial.print("] magZ[");
  Serial.print(data.z);
  Serial.print("] temperature(C)[");
  Serial.print(data.t);
  Serial.print("]");

  Serial.println();
}

void step_ladder(void)
{
  digitalWrite(LADDER_CLOCK, HIGH);
  digitalWrite(LADDER_CLOCK, LOW);
}

void set_trace_direction(uint8_t dir)
{
  digitalWrite(TRACE_DIR, dir);
}

void set_read_mux(uint8_t mux_pos)
{
  switch (mux_pos)
  {
    case 0:
      digitalWrite(S0_CT, LOW);
      digitalWrite(S1_CT, LOW);
      break;
    case 1:
      digitalWrite(S0_CT, HIGH);
      digitalWrite(S1_CT, LOW);
      break;
    case 2:
      digitalWrite(S0_CT, LOW);
      digitalWrite(S1_CT, HIGH);
      break;
    case 3:
      digitalWrite(S0_CT, HIGH);
      digitalWrite(S1_CT, HIGH);
      break;
    default:
      break;
  }
}

void gaas_rotation_isr(void)
{
  if (last_gaas_rot != 0)
  {
    long rotation_time = millis() - last_gaas_rot;
    float rotation = 1000 / rotation_time;
    current_rot = rotation * 1000;
  }
  last_gaas_rot = millis();
}

void p3_rotation_isr(void)
{
  last_p3_rot = millis();
  last_p3_en = true;
}

void read_mux(uint8_t *voltage, uint8_t *current)
{
  *voltage = analogRead(READ_VOLTAGE);
  *current = analogRead(READ_CURRENT);
}

void init_payload(void)
{
  uint8_t status = perovskite_1.begin();
  if (status != 0) Serial.println("Perovskite 1 temp sensor is not working");
  status = perovskite_2.begin();
  if (status != 0) Serial.println("Perovskite 2 temp sensor is not working");
  status = perovskite_3.begin();
  if (status != 0) Serial.println("Perovskite 3 temp sensor is not working");
}

void read_payload(float *p_1_temperature, float *p_2_temperature, float *p_3_temperature)
{
  perovskite_1.read();
  *p_1_temperature = perovskite_1.tAmbient / 16.0;
  perovskite_2.read();
  *p_2_temperature = perovskite_2.tAmbient / 16.0;
  perovskite_3.read();
  *p_3_temperature = perovskite_3.tAmbient / 16.0;
}

void read_relay(void)
{
  digitalWrite(SET, HIGH);
  delay(10);
  digitalWrite(SET, LOW);
  delay(500);
  digitalWrite(UNSET, HIGH);
  delay(10);
  digitalWrite(UNSET, LOW);
}

void setup() {
  #ifdef DEBUGGING
  Serial.begin(9600);
  #endif
  // Setup system
  init_pins();
  while (digitalRead(BUSY) == EPS_BUSY)
  {
    Serial.println("Waiting to start");
    delay(1000);
  }
  
  eps.begin();
  eps.heartbeat();
  
  Wire.begin();
  //sun_sensor.init();
  init_magnetometer();
  //init_payload();
  // Configure ADC
  //analogReadResolution(12);
  //analogReference(EXTERNAL);
  // Setup rotation interrupts
  //attachInterrupt(digitalPinToInterrupt(GAAS_ON), gaas_rotation_isr, RISING);
  //attachInterrupt(digitalPinToInterrupt(PANEL_3_ON), p3_rotation_isr, RISING);
}

float p1t;
float p2t;
float p3t;

void loop() {
  /*if (digitalRead(GAAS_ON)
  {
    sun_sensor.getSample(&theta, &phi);
  }*/
//  while (!sun_sensor.sample_wait());
//  Serial.println(sun_sensor.getTheta());
//  sun_sensor.default_config();
//  read_payload(&p1t, &p2t, &p3t);
//  Serial.print("P1: ");
//  Serial.print(p1t);
//  Serial.print(" | P2: ");
//  Serial.print(p2t);
//  Serial.print(" | P3: ");
//  Serial.println(p3t);
//  delay(500);
  read_magnetometer();
  delay(500);
  
}
