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

#define SETTLING_TIME 10

byte pixel_packet_1[17] = { 0 };
byte pixel_packet_2[17] = { 0 };
byte pixel_packet_3[17] = { 0 };
byte pixel_packet_4[17] = { 0 };
byte flux_packet[17] = { 0 };
byte secondary_packet[17] = { 0 };
byte tertiary_packet[17] = { 0 };

// Temperature sensors on the payload
MCP9808 perovskite_1(PEROVSKITE_1_LOWER);
MCP9808 perovskite_2(PEROVSKITE_2_LOWER);
MCP9808 perovskite_3(PEROVSKITE_3_LOWER);

EPS eps(EPS_RX, EPS_TX);

MLX90393 magnetometer(0x18);
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

void shutdown_system(void)
{
  // Turn off ADC
  ADC12CTL0 &= ~(ADC12ENC);
  ADC12CTL0 &= ~(ADC12ON);
  REFCTL0 &= ~(REFON);
}

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
  pinMode(MUX_CLOCK, OUTPUT);
  pinMode(READ_BUSS, INPUT);
  
  pinMode(LADDER_CLOCK, OUTPUT);
  digitalWrite(LADDER_CLOCK, HIGH);
  pinMode(TRACE_DIR, OUTPUT);
  digitalWrite(TRACE_DIR, COUNT_UP);
  
//  pinMode(GAAS_TEMP, INPUT);
  pinMode(BUSY, INPUT);
  pinMode(PANEL_3_ON, INPUT);
  
  pinMode(S0_CT, OUTPUT);
  digitalWrite(S0_CT, LOW);
}

bool read_gaas_temp(int16_t *gaas_temp_reading)
{
  byte i;
  byte present = 0;
  byte type_s;
  byte data[9];
  byte addr[8];
  
  if (!gaas_temp_sensor.search(addr)) {
    gaas_temp_sensor.reset_search();
    return false;
  }

  if (OneWire::crc8(addr, 7) != addr[7]) {
      return false;
  }

  // the first ROM byte indicates which chip
  switch (addr[0]) {
    case 0x10:
      type_s = 1;
      break;
    case 0x28:
      type_s = 0;
      break;
    case 0x22:
      type_s = 0;
      break;
    default:
      return false;
  } 

  gaas_temp_sensor.reset();
  gaas_temp_sensor.select(addr);
  gaas_temp_sensor.write(0x44, 1);        // start conversion, with parasite power on at the end
  
  delay(1000);     // maybe 750ms is enough, maybe not
  // we might do a ds.depower() here, but the reset will take care of it.
  
  present = gaas_temp_sensor.reset();
  gaas_temp_sensor.select(addr);    
  gaas_temp_sensor.write(0xBE);         // Read Scratchpad

  for ( i = 0; i < 9; i++) {           // we need 9 bytes
    data[i] = gaas_temp_sensor.read();
  }
  gaas_temp_sensor.depower();
  
  // Convert the data to actual temperature
  // because the result is a 16 bit signed integer, it should
  // be stored to an "int16_t" type, which is always 16 bits
  // even when compiled on a 32 bit processor.
  int16_t raw = (data[1] << 8) | data[0];
  if (type_s) {
    raw = raw << 3; // 9 bit resolution default
    if (data[7] == 0x10) {
      // "count remain" gives full 12 bit resolution
      raw = (raw & 0xFFF0) + 12 - data[6];
    }
  } else {
    byte cfg = (data[4] & 0x60);
    // at lower res, the low bits are undefined, so let's zero them
    if (cfg == 0x00) raw = raw & ~7;  // 9 bit resolution, 93.75 ms
    else if (cfg == 0x20) raw = raw & ~3; // 10 bit res, 187.5 ms
    else if (cfg == 0x40) raw = raw & ~1; // 11 bit res, 375 ms
    //// default is 12 bit resolution, 750 ms conversion time
  }
  *gaas_temp_reading = raw;
  return true;
}

void init_magnetometer(void)
{
  uint8_t status = magnetometer.begin(0, 0, MAG_INT); //Assumes I2C jumpers are GND. No DRDY pin used.
  Serial.println(status);
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
  digitalWrite(LADDER_CLOCK, LOW);
  digitalWrite(LADDER_CLOCK, HIGH);
}

void step_mux(void)
{
  digitalWrite(MUX_CLOCK, HIGH);
  digitalWrite(MUX_CLOCK, LOW);
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

void read_mux(uint16_t *voltage, uint16_t *current)
{
  *voltage = analogRead(READ_VOLTAGE);
  *current = analogRead(READ_CURRENT);
}

uint8_t init_payload(void)
{
  uint8_t all_status = 0;
  uint8_t status = perovskite_1.begin();
  if (status != 0) all_status |= (1 << 0);
  status = perovskite_2.begin();
  if (status != 0) all_status |= (1 << 1);
  status = perovskite_3.begin();
  if (status != 0) all_status |= (1 << 2);
  return all_status;
}

void read_payload(float *p_1_temperature, float *p_2_temperature, float *p_3_temperature)
{
  perovskite_1.read();
  *p_1_temperature = perovskite_1.tAmbient;
  perovskite_2.read();
  *p_2_temperature = perovskite_2.tAmbient;
  perovskite_3.read();
  *p_3_temperature = perovskite_3.tAmbient;
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
  while (!Serial);
#endif

  // Setup system
  init_pins();
//  while (digitalRead(BUSY) == EPS_BUSY)
//  {
//    delay(1000);
//  }
  // Startup cubesat EPS
//  eps.begin();
//  eps.heartbeat();
  // Initialize sensors
//  sun_sensor.init();
//  init_magnetometer();
//  init_payload();
  // Configure ADC
  analogReadResolution(12);
  analogReference(EXTERNAL);
  // Setup rotation interrupts
  //attachInterrupt(digitalPinToInterrupt(GAAS_ON), gaas_rotation_isr, RISING);
  //attachInterrupt(digitalPinToInterrupt(PANEL_3_ON), p3_rotation_isr, RISING);
  set_read_mux(MUX_POS_GAAS);
}

uint16_t iv_voltage, iv_current;
int16_t gaas_temp;

void loop() {
//  if (digitalRead(GAAS_ON)
//  {
//    sun_sensor.getSample(&theta, &phi);
//  }
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
//  read_magnetometer();
//  delay(500);
//  if (read_gaas_temp(&raw_gaas_temp)) Serial.println(raw_gaas_temp);
//  delay(500);

  step_ladder();
//  step_mux();

//  delay(1000);

//  set_read_mux(MUX_POS_P1);
//  read_mux(&iv_voltage, &iv_current);
//  Serial.print("P1\tVoltage:\t");
//  Serial.print(iv_voltage);
//  Serial.print("\t|\tCurrent:\t");
//  Serial.println(iv_current);
//
//  set_read_mux(MUX_POS_P2);
//  read_mux(&iv_voltage, &iv_current);
//  Serial.print("P2\tVoltage:\t");
//  Serial.print(iv_voltage);
//  Serial.print("\t|\tCurrent:\t");
//  Serial.println(iv_current);
//
//  set_read_mux(MUX_POS_P3);
//  read_mux(&iv_voltage, &iv_current);
//  Serial.print("P3\tVoltage:\t");
//  Serial.print(iv_voltage);
//  Serial.print("\t|\tCurrent:\t");
//  Serial.println(iv_current);

//  set_read_mux(MUX_POS_GAAS);
  delay(SETTLING_TIME);
  read_mux(&iv_voltage, &iv_current);
  read_gaas_temp(&gaas_temp);
  Serial.print("Voltage:");
  Serial.print(iv_voltage);
  Serial.print(" ");
  Serial.print("Current:");
  Serial.print(iv_current);
  Serial.print(" Temp: ");
  Serial.println(gaas_temp);
  
}
