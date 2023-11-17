#include "Energia.h"
#include "FSS100.h"
#include <MCP9808.h>
#include <OneWire.h>
#include <stdio.h>
#include "NSL_EPS.h"
#include <Wire.h>
#include <MLX90393.h>
#include <TinyBME280.h>
#include <ICM20649.h>

#define DEBUGGING
//#define POWER_TEST
#define SENSOR_TEST
//#define TEST_ORBIT
//#define DEPLOY
#define NO_TRANSMIT

#define COUNT_UP HIGH
#define COUNT_DOWN LOW

#define MUX_POS_GAAS 0
#define MUX_POS_P1 3
#define MUX_POS_P2 2
#define MUX_POS_P3 1

#define PEROVSKITE_1_LOWER    0b001
#define PEROVSKITE_2_LOWER    0b010
#define PEROVSKITE_3_LOWER    0b100

#define SETTLING_TIME 10

#define MAX_PIXELS 6
#define MAX_LADDER_STEPS 16
#define EPS_SEND_TIMEOUT -1

#define BUSS_VOLTAGE_CUTOFF 0x7E
uint8_t battery_voltage;

byte pixel_packet_1[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte pixel_packet_2[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte pixel_packet_3[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte pixel_packet_4[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

byte flux_packet_1[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte flux_packet_2[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte flux_packet_3[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte flux_packet_4[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

byte secondary_packet[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte tertiary_packet[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

byte status_register = 0x00;

byte heartbeat_payload[] = {0x50, 0x50, 0x50, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

uint16_t flux[16] = { 0 };
uint16_t current_1[16] = { 0 };
uint16_t voltage_1[16] = { 0 };
uint16_t current_2[16] = { 0 };
uint16_t voltage_2[16] = { 0 };
uint16_t current_3[16] = { 0 };
uint16_t voltage_3[16] = { 0 };
uint16_t current_4[16] = { 0 };
uint16_t voltage_4[16] = { 0 };

int i, mp_1, mp_1i, mp_2, mp_2i, mp_3, mp_3i, mp_4, mp_4i;

#define STATUS_REGISTER_PIXEL_BIT_0   0
#define STATUS_REGISTER_PIXEL_BIT_1   1
#define STATUS_REGISTER_PIXEL_BIT_2   2
#define STATUS_REGISTER_SAMPLE_BIT_0  3
#define STATUS_REGISTER_SAMPLE_BIT_1  4
#define STATUS_REGISTER_PACKET_BIT_0  5
#define STATUS_REGISTER_PACKET_BIT_1  6
#define STATUS_REGISTER_DIRECTION_BIT  7

// Temperature sensors on the payload
MCP9808 perovskite_1(PEROVSKITE_1_LOWER);
MCP9808 perovskite_2(PEROVSKITE_2_LOWER);
MCP9808 perovskite_3(PEROVSKITE_3_LOWER);

EPS eps(EPS_RX, EPS_TX);

MLX90393 magnetometer(0x18);
MLX90393::txyzRaw mag_data;
ICM20649 imu;

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
uint8_t current_pixel = 0;
uint32_t humidity_reading = 0;
uint32_t pressure_reading = 0;
uint16_t p_1_temperature;
uint16_t p_2_temperature;
uint16_t p_3_temperature;
uint16_t gaas_temperature;
bool trace_dir;

///////////////////////////////////////////
//       START PRIMARY PAYLOAD CODE
///////////////////////////////////////////

bool read_gaas_temp(uint16_t *gaas_temp_reading)
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

bool gaas_en = false;

void gaas_rotation_isr(void)
{
  if (last_gaas_rot != 0)
  {
    long rotation_time = millis() - last_gaas_rot;
    float rotation = 1000 / rotation_time;
    current_rot = rotation * 1000;
  }
  last_gaas_rot = millis();
  gaas_en = true;
}

void p3_rotation_isr(void)
{
  last_p3_rot = millis();
  last_p3_en = true;
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
  BME280setup();
  return all_status;
}

void read_payload(uint16_t *p_1, uint16_t *p_2, uint16_t *p_3)
{
  *p_1 = perovskite_1.read_ambient();
  *p_2 = perovskite_2.read_ambient();
  *p_3 = perovskite_3.read_ambient();
}

void read_bme280(void)
{
  humidity_reading = BME280humidity();
  pressure_reading = BME280pressure();
}

///////////////////////////////////////////
//       END PRIMARY PAYLOAD CODE
///////////////////////////////////////////

///////////////////////////////////////////
//       START CURVE TRACER CODE
///////////////////////////////////////////

byte ladder_step = 0;

void step_ladder(void)
{
  digitalWrite(LADDER_CLOCK, LOW);
  digitalWrite(LADDER_CLOCK, HIGH);
  ladder_step++;
}

void reset_mux(void)
{
  digitalWrite(MUX_RESET, HIGH);
  digitalWrite(MUX_RESET, LOW);
  current_pixel = 0;
}

void step_mux(void)
{
  digitalWrite(MUX_CLOCK, HIGH);
  digitalWrite(MUX_CLOCK, LOW);
  current_pixel++;
}

void set_trace_direction(uint8_t dir)
{
  trace_dir = dir;
  digitalWrite(TRACE_DIR, dir);
}

void set_read_mux(uint8_t mux_pos)
{
  switch (mux_pos)
  {
    case MUX_POS_GAAS:
    #ifdef DEBUGGING
      Serial.println("Setting analog mux to GaAs position");
    #endif
      digitalWrite(S0_CT, LOW);
      digitalWrite(S1_CT, LOW);
      break;
    case MUX_POS_P1:
    #ifdef DEBUGGING
      Serial.println("Setting analog mux to P1 position");
    #endif
      digitalWrite(S0_CT, HIGH);
      digitalWrite(S1_CT, LOW);
      break;
    case MUX_POS_P2:
    #ifdef DEBUGGING
      Serial.println("Setting analog mux to P2 position");
    #endif
      digitalWrite(S0_CT, LOW);
      digitalWrite(S1_CT, HIGH);
      break;
    case MUX_POS_P3:
    #ifdef DEBUGGING
      Serial.println("Setting analog mux to P3 position");
    #endif
      digitalWrite(S0_CT, HIGH);
      digitalWrite(S1_CT, HIGH);
      break;
    default:
    #ifdef DEBUGGING
      Serial.println("Setting analog mux to undefined position");
    #endif
      break;
  }
}

void read_mux(uint16_t *voltage, uint16_t *current)
{
  *voltage = analogRead(READ_VOLTAGE);
  *current = analogRead(READ_CURRENT);
  #ifdef DEBUGGING
  Serial.print("V: "); Serial.print(*voltage); Serial.print(" | I: "); Serial.println(*current);
  #endif
}

///////////////////////////////////////////
//       END CURVE TRACER CODE
///////////////////////////////////////////

///////////////////////////////////////////
//       START SECONDARY PAYLOAD CODE
///////////////////////////////////////////

volatile long start_time, end_time;
uint16_t nc_time, no_time;
volatile bool relay_done = false;
bool relay_selector = false;

#pragma vector = COMP_E_VECTOR
__interrupt void COMPE_ISR(void)
{
  relay_done = true;
  end_time = micros();
  //Serial.println("COMPE ISR");
//  if((CECTL2 & CEOUT)==0x01)
//  {
//    
//  }
}

void set_relay_comparator (int pin)
{
  Serial.print(CECTL1, BIN);
  Serial.print(" | ");
  Serial.print(CECTL2, BIN);
  Serial.print(" | ");
  Serial.print(CEINT, BIN);
  Serial.println(" | ");
  CECTL0 = CEIPSEL_12;  // P1.1 = +comp
//  CEINT |= CEIE;
  CECTL1 = CERSEL + CEREFL_2 + CEON;
  Serial.print(CECTL1, BIN);
  Serial.print(" | ");
  Serial.print(CECTL2, BIN);
  Serial.print(" | ");
  Serial.print(CEINT, BIN);
  Serial.println(" | ");
}

void read_relay(void)
{
  relay_done = false;
  end_time = 0;
  digitalWrite(SET, HIGH);
  delay(50);
  digitalWrite(SET, LOW);
  
  // Test the NO path
  no_time = 0;
  set_relay_comparator(NO_V);
  // Latch NO path
  digitalWrite(UNSET, HIGH);
  // Start reading
  start_time = micros();
  delay(5);
  digitalWrite(UNSET, LOW);
  while (!relay_done)
  {
    #ifdef DEBUGGING
    Serial.print(CECTL1, BIN);
    Serial.print(" | ");
    Serial.print(CEINT, BIN);
    Serial.print(" | ");
    Serial.print("NO V: ");
    Serial.println(analogRead(NO_V));
    #endif
    if ((micros() - start_time) > 0xFFFF)
    {
      no_time = 0xFFFF;
      break; 
    }
  }
  if (no_time == 0)
  {
    no_time = (uint16_t)(end_time - start_time);
  }
  // Let NC discharge
  delay(10000);
  
  nc_time = 0;
  set_relay_comparator(NC_V);
  digitalWrite(SET, HIGH);
  start_time = micros();
  delay(5);
  digitalWrite(SET, LOW);
  
  
  while (!relay_done)
  {
    #ifdef DEBUGGING
    Serial.print(CECTL1, BIN);
    Serial.print(" | ");
    Serial.print(CEINT, BIN);
    Serial.print(" | ");
    Serial.print("NC V: ");
    Serial.println(analogRead(NC_V));
    #endif
    if ((micros() - start_time) > 0xFFFF)
    {
      nc_time = 0xFFFF;
      break; 
    }
  }
  if (nc_time == 0)
  {
    nc_time = (uint16_t)(end_time - start_time);
  }

  #ifdef DEBUGGING
  Serial.print("Relay results\n\tNC Time: ");
  Serial.print(nc_time);
  Serial.print("\tNO Time: ");
  Serial.println(no_time);
  #endif
}

void handle_secondary_payload_sensors(void)
{
#ifdef DEBUGGING
  Serial.println("Handling secondary payload interrupt");
#endif
}

void init_secondary_payload(void)
{
  read_relay();
  init_magnetometer();
  init_imu();
}

void enable_magnetometer_int(void)
{
  attachInterrupt(digitalPinToInterrupt(MAG_INT), handle_secondary_payload_sensors, RISING);
}

void init_imu(void)
{ 
  uint8_t status = imu.initialize(ACCEL_RANGE_8G, GYRO_RANGE_2000DPS);
#ifdef DEBUGGING
  Serial.print("IMU status: ");
  Serial.println(status);
#endif
}

void init_magnetometer(void)
{
  uint8_t status = magnetometer.begin(0, 0);
  
#ifdef DEBUGGING
  Serial.print("Magnetometer status: ");
  Serial.println(status);
#endif

  // Sample rate: 303.4 Hz
  magnetometer.setOverSampling(2);
  magnetometer.setDigitalFiltering(0);
}

void read_imu(void)
{
  imu.readAcceleration();
  imu.readGyro();
  imu.readTemperature();
}

void read_magnetometer(void)
{
  uint8_t status1 = magnetometer.startMeasurement(magnetometer.X_FLAG | magnetometer.Y_FLAG | magnetometer.Z_FLAG | magnetometer.T_FLAG);
  
  delay(magnetometer.convDelayMillis());

  uint8_t status2 = magnetometer.readMeasurement(magnetometer.X_FLAG | magnetometer.Y_FLAG | magnetometer.Z_FLAG | magnetometer.T_FLAG, mag_data);
  bool magstatus = magnetometer.checkStatus(status1) | magnetometer.checkStatus(status2);
}

///////////////////////////////////////////
//       END SECONDARY PAYLOAD CODE
///////////////////////////////////////////

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
  pinMode(MUX_RESET, OUTPUT);
  digitalWrite(MUX_RESET, LOW);
  
  pinMode(READ_BUSS, INPUT);
  
  pinMode(LADDER_CLOCK, OUTPUT);
  digitalWrite(LADDER_CLOCK, HIGH);
  pinMode(TRACE_DIR, OUTPUT);
  digitalWrite(TRACE_DIR, COUNT_UP);
  
//  pinMode(GAAS_TEMP, INPUT);
  pinMode(BUSY, INPUT);
  pinMode(PANEL_3_ON, INPUT);
  pinMode(PANEL_3_CURRENT_V, INPUT);
  
  pinMode(S0_CT, OUTPUT);
  digitalWrite(S0_CT, LOW);

  Wire.begin();
  
  reset_mux();
  set_trace_direction(COUNT_UP);
}

bool check_battery(void)
{
  battery_voltage = analogRead(READ_BUSS);
#ifdef DEBUGGING
  Serial.println(battery_voltage);
#endif
  if (battery_voltage > BUSS_VOLTAGE_CUTOFF) return true;
  else return false;
}

bool startup_test(void)
{
  // Wait for EPS to wakeup
  int timeout_count = 0;
  while (digitalRead(BUSY) == EPS_BUSY)
  {
    delay(1000);
    #ifdef DEBUGGING
    Serial.print("Waiting for EPS, ");
    Serial.println(timeout_count);
    #endif
    if (timeout_count++ == EPS_SEND_TIMEOUT)
    {
      #ifdef DEBUGGING
      Serial.println("EPS timeout");
      #endif
      break;
    }
  }
  // Startup cubesat EPS
  eps.begin();
  eps.heartbeat(heartbeat_payload);
  if (!eps.heartbeat(heartbeat_payload))
  {
    #ifdef DEBUGGING
    Serial.println("Heartbeat payload failed");
    #endif
  }
  if (check_battery())
  {
    // Initialize sensors
    sun_sensor.init();
    init_secondary_payload();
    init_payload();
  
    // Setup rotation interrupts
    attachInterrupt(digitalPinToInterrupt(GAAS_ON), gaas_rotation_isr, RISING);
    attachInterrupt(digitalPinToInterrupt(PANEL_3_ON), p3_rotation_isr, RISING);
  
    // Set reading mux
    set_read_mux(MUX_POS_GAAS);

    return true;
  }
  else
  {
    return false;
  }
}

void send_payload_1_packets(void)
{
  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (0 << STATUS_REGISTER_PACKET_BIT_0) |
                      (0 << STATUS_REGISTER_SAMPLE_BIT_1) | (0 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      0x00;
                      
  pixel_packet_1[4] = (byte)(gaas_temperature >> 8);
  pixel_packet_1[5] = (byte)(gaas_temperature);
  pixel_packet_1[6] = (byte)(voltage_1[0]);
  pixel_packet_1[7] = (byte)(current_1[0]);
  pixel_packet_1[8] = (byte)(voltage_1[mp_1i - 2]);
  pixel_packet_1[9] = (byte)(current_1[mp_1i - 2]);
  pixel_packet_1[10] = (byte)(voltage_1[mp_1i - 1]);
  pixel_packet_1[11] = (byte)(current_1[mp_1i - 1]);
  pixel_packet_1[12] = (byte)(voltage_1[mp_1i]);
  pixel_packet_1[13] = (byte)(current_1[mp_1i]);
  pixel_packet_1[14] = (byte)(voltage_1[mp_1i + 1]);
  pixel_packet_1[15] = (byte)(current_1[mp_1i + 1]);
  pixel_packet_1[16] = (byte)(voltage_1[mp_1i + 2]);
  pixel_packet_1[17] = (byte)(current_1[mp_1i + 2]);
  pixel_packet_1[18] = (byte)(voltage_1[15]);
  pixel_packet_1[19] = (byte)(current_1[15]);
  pixel_packet_1[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(pixel_packet_1);
  eps.radio(pixel_packet_1);
  #endif
  #ifdef DEBUGGING
  Serial.println("GaAs Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(pixel_packet_1[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif

  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (1 << STATUS_REGISTER_PACKET_BIT_0) |
                      (0 << STATUS_REGISTER_SAMPLE_BIT_1) | (0 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      0x00;

  flux_packet_1[4] = (byte)(flux[0] >> 8);
  flux_packet_1[5] = (byte)(flux[0] >> 0);
  flux_packet_1[6] = (byte)(flux[mp_1i - 2] >> 8);
  flux_packet_1[7] = (byte)(flux[mp_1i - 2] >> 0);
  flux_packet_1[8] = (byte)(flux[mp_1i - 1] >> 8);
  flux_packet_1[9] = (byte)(flux[mp_1i - 1] >> 0);
  flux_packet_1[10] = (byte)(flux[mp_1i] >> 8);
  flux_packet_1[11] = (byte)(flux[mp_1i] >> 0);
  flux_packet_1[12] = (byte)(flux[mp_1i + 1] >> 8);
  flux_packet_1[13] = (byte)(flux[mp_1i + 1] >> 0);
  flux_packet_1[14] = (byte)(flux[mp_1i + 2] >> 8);
  flux_packet_1[15] = (byte)(flux[mp_1i + 2] >> 0);
  flux_packet_1[16] = (byte)(flux[15] >> 8);
  flux_packet_1[17] = (byte)(flux[15] >> 0);
  flux_packet_1[18] = (byte)(current_rot >> 8);
  flux_packet_1[19] = (byte)(current_rot >> 0);
  flux_packet_1[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(flux_packet_1);
  eps.radio(flux_packet_1);
  #endif
  #ifdef DEBUGGING
  Serial.println("GaAs Flux Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(flux_packet_1[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif
}

void send_payload_2_packets(void)
{
  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (0 << STATUS_REGISTER_PACKET_BIT_0) |
                      (0 << STATUS_REGISTER_SAMPLE_BIT_1) | (1 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;
                      
  pixel_packet_2[4] = (byte)(p_1_temperature >> 8);
  pixel_packet_2[5] = (byte)(p_1_temperature >> 0);
  pixel_packet_2[6] = (byte)(voltage_2[0]);
  pixel_packet_2[7] = (byte)(current_2[0]);
  pixel_packet_2[8] = (byte)(voltage_2[mp_2i - 2]);
  pixel_packet_2[9] = (byte)(current_2[mp_2i - 2]);
  pixel_packet_2[10] = (byte)(voltage_2[mp_2i - 1]);
  pixel_packet_2[11] = (byte)(current_2[mp_2i - 1]);
  pixel_packet_2[12] = (byte)(voltage_2[mp_2i]);
  pixel_packet_2[13] = (byte)(current_2[mp_2i]);
  pixel_packet_2[14] = (byte)(voltage_2[mp_2i + 1]);
  pixel_packet_2[15] = (byte)(current_2[mp_2i + 1]);
  pixel_packet_2[16] = (byte)(voltage_2[mp_2i + 2]);
  pixel_packet_2[17] = (byte)(current_2[mp_2i + 2]);
  pixel_packet_2[18] = (byte)(voltage_2[15]);
  pixel_packet_2[19] = (byte)(current_2[15]);
  pixel_packet_2[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(pixel_packet_2);
  eps.radio(pixel_packet_2);
  #endif
  #ifdef DEBUGGING
  Serial.println("P1 Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(pixel_packet_2[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif

  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (1 << STATUS_REGISTER_PACKET_BIT_0) |
                      (0 << STATUS_REGISTER_SAMPLE_BIT_1) | (1 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;

  flux_packet_2[4] = (byte)(flux[0] >> 8);
  flux_packet_2[5] = (byte)(flux[0] >> 0);
  flux_packet_2[6] = (byte)(flux[mp_2i - 2] >> 8);
  flux_packet_2[7] = (byte)(flux[mp_2i - 2] >> 0);
  flux_packet_2[8] = (byte)(flux[mp_2i - 1] >> 8);
  flux_packet_2[9] = (byte)(flux[mp_2i - 1] >> 0);
  flux_packet_2[10] = (byte)(flux[mp_2i] >> 8);
  flux_packet_2[11] = (byte)(flux[mp_2i] >> 0);
  flux_packet_2[12] = (byte)(flux[mp_2i + 1] >> 8);
  flux_packet_2[13] = (byte)(flux[mp_2i + 1] >> 0);
  flux_packet_2[14] = (byte)(flux[mp_2i + 2] >> 8);
  flux_packet_2[15] = (byte)(flux[mp_2i + 2] >> 0);
  flux_packet_2[16] = (byte)(flux[15] >> 8);
  flux_packet_2[17] = (byte)(flux[15] >> 0);
  flux_packet_2[18] = (byte)(current_rot >> 8);
  flux_packet_2[19] = (byte)(current_rot >> 0);
  flux_packet_2[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(flux_packet_2);
  eps.radio(flux_packet_2);
  #endif
  #ifdef DEBUGGING
  Serial.println("P1 Flux Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(flux_packet_2[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif
}

void send_payload_3_packets(void)
{
  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (0 << STATUS_REGISTER_PACKET_BIT_0) |
                      (1 << STATUS_REGISTER_SAMPLE_BIT_1) | (0 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;
                      
  pixel_packet_3[4] = (byte)(p_2_temperature >> 8);
  pixel_packet_3[5] = (byte)(p_2_temperature);
  pixel_packet_3[6] = (byte)(voltage_3[0]);
  pixel_packet_3[7] = (byte)(current_3[0]);
  pixel_packet_3[8] = (byte)(voltage_3[mp_3i - 2]);
  pixel_packet_3[9] = (byte)(current_3[mp_3i - 2]);
  pixel_packet_3[10] = (byte)(voltage_3[mp_3i - 1]);
  pixel_packet_3[11] = (byte)(current_3[mp_3i - 1]);
  pixel_packet_3[12] = (byte)(voltage_3[mp_3i]);
  pixel_packet_3[13] = (byte)(current_3[mp_3i]);
  pixel_packet_3[14] = (byte)(voltage_3[mp_3i + 1]);
  pixel_packet_3[15] = (byte)(current_3[mp_3i + 1]);
  pixel_packet_3[16] = (byte)(voltage_3[mp_3i + 2]);
  pixel_packet_3[17] = (byte)(current_3[mp_3i + 2]);
  pixel_packet_3[18] = (byte)(voltage_3[15]);
  pixel_packet_3[19] = (byte)(current_3[15]);
  pixel_packet_3[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(pixel_packet_3);
  eps.radio(pixel_packet_3);
  #endif
  #ifdef DEBUGGING
  Serial.println("P2 Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(pixel_packet_3[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif

  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (1 << STATUS_REGISTER_PACKET_BIT_0) |
                      (1 << STATUS_REGISTER_SAMPLE_BIT_1) | (0 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;

  flux_packet_3[4] = (byte)(flux[0] >> 8);
  flux_packet_3[5] = (byte)(flux[0] >> 0);
  flux_packet_3[6] = (byte)(flux[mp_3i - 2] >> 8);
  flux_packet_3[7] = (byte)(flux[mp_3i - 2] >> 0);
  flux_packet_3[8] = (byte)(flux[mp_3i - 1] >> 8);
  flux_packet_3[9] = (byte)(flux[mp_3i - 1] >> 0);
  flux_packet_3[10] = (byte)(flux[mp_3i] >> 8);
  flux_packet_3[11] = (byte)(flux[mp_3i] >> 0);
  flux_packet_3[12] = (byte)(flux[mp_3i + 1] >> 8);
  flux_packet_3[13] = (byte)(flux[mp_3i + 1] >> 0);
  flux_packet_3[14] = (byte)(flux[mp_3i + 2] >> 8);
  flux_packet_3[15] = (byte)(flux[mp_3i + 2] >> 0);
  flux_packet_3[16] = (byte)(flux[15] >> 8);
  flux_packet_3[17] = (byte)(flux[15] >> 0);
  flux_packet_3[18] = (byte)(current_rot >> 8);
  flux_packet_3[19] = (byte)(current_rot >> 0);
  flux_packet_3[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(flux_packet_3);
  eps.radio(flux_packet_3);
  #endif
  #ifdef DEBUGGING
  Serial.println("P2 Flux Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(flux_packet_3[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif
}

void send_payload_4_packets(void)
{
  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (0 << STATUS_REGISTER_PACKET_BIT_0) |
                      (1 << STATUS_REGISTER_SAMPLE_BIT_1) | (1 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;
                      
  pixel_packet_4[4] = (byte)(p_3_temperature >> 8);
  pixel_packet_4[5] = (byte)(p_3_temperature);
  pixel_packet_4[6] = (byte)(voltage_4[0]);
  pixel_packet_4[7] = (byte)(current_4[0]);
  pixel_packet_4[8] = (byte)(voltage_4[mp_4i - 2]);
  pixel_packet_4[9] = (byte)(current_4[mp_4i - 2]);
  pixel_packet_4[10] = (byte)(voltage_4[mp_4i - 1]);
  pixel_packet_4[11] = (byte)(current_4[mp_4i - 1]);
  pixel_packet_4[12] = (byte)(voltage_4[mp_4i]);
  pixel_packet_4[13] = (byte)(current_4[mp_4i]);
  pixel_packet_4[14] = (byte)(voltage_4[mp_4i + 1]);
  pixel_packet_4[15] = (byte)(current_4[mp_4i + 1]);
  pixel_packet_4[16] = (byte)(voltage_4[mp_4i + 2]);
  pixel_packet_4[17] = (byte)(current_4[mp_4i + 2]);
  pixel_packet_4[18] = (byte)(voltage_4[15]);
  pixel_packet_4[19] = (byte)(current_4[15]);
  pixel_packet_4[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(pixel_packet_4);
  eps.radio(pixel_packet_4);
  #endif
  #ifdef DEBUGGING
  Serial.println("P3 Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(pixel_packet_4[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif

  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (0 << STATUS_REGISTER_PACKET_BIT_1) | (1 << STATUS_REGISTER_PACKET_BIT_0) |
                      (1 << STATUS_REGISTER_SAMPLE_BIT_1) | (1 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;

  flux_packet_4[4] = (byte)(flux[0] >> 8);
  flux_packet_4[5] = (byte)(flux[0] >> 0);
  flux_packet_4[6] = (byte)(flux[mp_4i - 2] >> 8);
  flux_packet_4[7] = (byte)(flux[mp_4i - 2] >> 0);
  flux_packet_4[8] = (byte)(flux[mp_4i - 1] >> 8);
  flux_packet_4[9] = (byte)(flux[mp_4i - 1] >> 0);
  flux_packet_4[10] = (byte)(flux[mp_4i] >> 8);
  flux_packet_4[11] = (byte)(flux[mp_4i] >> 0);
  flux_packet_4[12] = (byte)(flux[mp_4i + 1] >> 8);
  flux_packet_4[13] = (byte)(flux[mp_4i + 1] >> 0);
  flux_packet_4[14] = (byte)(flux[mp_4i + 2] >> 8);
  flux_packet_4[15] = (byte)(flux[mp_4i + 2] >> 0);
  flux_packet_4[16] = (byte)(flux[15] >> 8);
  flux_packet_4[17] = (byte)(flux[15] >> 0);
  flux_packet_4[18] = (byte)(current_rot >> 8);
  flux_packet_4[19] = (byte)(current_rot >> 0);
  flux_packet_4[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(flux_packet_4);
  eps.radio(flux_packet_4);
  #endif
  #ifdef DEBUGGING
  Serial.println("P3 Flux Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(flux_packet_4[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif
}

void send_secondary_payload(void)
{
  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (1 << STATUS_REGISTER_PACKET_BIT_1) | (0 << STATUS_REGISTER_PACKET_BIT_0) |
                      (0 << STATUS_REGISTER_SAMPLE_BIT_1) | (0 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;
  
  secondary_packet[4] = (imu.gyroRaw.x >> 8);
  secondary_packet[5] = (imu.gyroRaw.x >> 0);

  secondary_packet[6] = (imu.gyroRaw.y >> 8);
  secondary_packet[7] = (imu.gyroRaw.y >> 0);

  secondary_packet[8] = (imu.gyroRaw.z >> 8);
  secondary_packet[9] = (imu.gyroRaw.z >> 0);

  secondary_packet[10] = (mag_data.x >> 8);
  secondary_packet[11] = (mag_data.x >> 0);
  
  secondary_packet[12] = (mag_data.y >> 8);
  secondary_packet[13] = (mag_data.y >> 0);

  secondary_packet[14] = (mag_data.z >> 8);
  secondary_packet[15] = (mag_data.z >> 0);

  secondary_packet[10] = (nc_time >> 8);
  secondary_packet[11] = (nc_time >> 0);

  secondary_packet[18] = (no_time >> 8);
  secondary_packet[19] = (no_time >> 0);

  secondary_packet[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(secondary_packet);
  eps.radio(secondary_packet);
  #endif
  #ifdef DEBUGGING
  Serial.println("Secondary Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(secondary_packet[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif
}

void send_tertiary_payload(void)
{
  status_register = 0x00;
  status_register |=  (trace_dir << STATUS_REGISTER_DIRECTION_BIT) | (1 << STATUS_REGISTER_PACKET_BIT_1) | (1 << STATUS_REGISTER_PACKET_BIT_0) |
                      (0 << STATUS_REGISTER_SAMPLE_BIT_1) | (0 << STATUS_REGISTER_SAMPLE_BIT_0) | 
                      current_pixel;
  
  tertiary_packet[4] = (imu.accelRaw.x >> 8);
  tertiary_packet[5] = (imu.accelRaw.x >> 0);

  tertiary_packet[6] = (imu.accelRaw.y >> 8);
  tertiary_packet[7] = (imu.accelRaw.y >> 0);

  tertiary_packet[8] = (imu.accelRaw.z >> 8);
  tertiary_packet[9] = (imu.accelRaw.z >> 0);

  tertiary_packet[10] = 0x00;
  tertiary_packet[11] = battery_voltage;

  tertiary_packet[12] = (pressure_reading >> 24);
  tertiary_packet[13] = (pressure_reading >> 16);
  tertiary_packet[14] = (pressure_reading >> 8);
  tertiary_packet[15] = (pressure_reading >> 0);

  tertiary_packet[16] = (humidity_reading >> 24);
  tertiary_packet[17] = (humidity_reading >> 16);
  tertiary_packet[18] = (humidity_reading >> 8);
  tertiary_packet[19] = (humidity_reading >> 0);

  tertiary_packet[20] = status_register;

  #ifndef NO_TRANSMIT
  eps.radio(tertiary_packet);
  eps.radio(tertiary_packet);
  #endif
  #ifdef DEBUGGING
  Serial.println("Tertiary Packet");
  for (int i = 0; i < 21; i++)
  {
    Serial.print("0x");
    Serial.print(tertiary_packet[i], HEX);
    Serial.print(" ");
  }
  Serial.println();
  #endif
}

long startup_time = 0;
#define HALFORBIT_WAKEUP 1500000
#define TESTORBIT_WAKEUP 1000

void setup() {
#ifdef DEBUGGING
  Serial.begin(9600);
  Serial.println("Starting flight computer");
#endif

  // Setup system
  init_pins();

  interrupts();
  // Configure ADC
  analogReadResolution(8);
  analogReference(EXTERNAL);
  
  if (!startup_test())
  {
    #ifdef DEBUGGING
    Serial.println("Battery is too low");
    #endif
    while (1);
  }
  
  startup_time = millis();
}

void loop() 
{
#ifdef POWER_TEST
  while (true)
  {
    Serial.println("Waiting...");
    delay(1000);
  }
#endif
  
#ifdef SENSOR_TEST
  while (true)
  {
    read_payload(&p_1_temperature, &p_2_temperature, &p_3_temperature);
    read_bme280();
    read_imu();
    read_magnetometer();
    sun_sensor.default_config();
    while (!sun_sensor.sample_wait());

    Serial.print("Acc X"); Serial.print("\t|\t"); 
    Serial.print("Acc Y"); Serial.print("\t|\t"); 
    Serial.print("Acc Z"); Serial.print("\t|\t"); 
    Serial.print("Gyr X"); Serial.print("\t|\t");
    Serial.print("Gyr Y"); Serial.print("\t|\t");
    Serial.print("Gyr Z"); Serial.print("\t|\t");
    Serial.print("Temp"); Serial.print("\t|\t");
    Serial.println();

    Serial.print(imu.accelInG.x, 2); Serial.print("\t|\t"); 
    Serial.print(imu.accelInG.y, 2); Serial.print("\t|\t"); 
    Serial.print(imu.accelInG.z, 2); Serial.print("\t|\t"); 
    Serial.print(imu.gyroDPS.x, 2); Serial.print("\t|\t");
    Serial.print(imu.gyroDPS.y, 2); Serial.print("\t|\t");
    Serial.print(imu.gyroDPS.z, 2); Serial.print("\t|\t");
    Serial.print(imu.tempRaw, 2); Serial.print("\t|\t");
    Serial.println();
    Serial.println();

    Serial.print("Mag X"); Serial.print("\t|\t"); 
    Serial.print("Mag Y"); Serial.print("\t|\t"); 
    Serial.print("Mag Z"); Serial.print("\t|\t"); 
    Serial.print("Mag T"); Serial.print("\t|\t"); 
    Serial.println();

    Serial.print(mag_data.x); Serial.print("\t|\t"); 
    Serial.print(mag_data.y); Serial.print("\t|\t"); 
    Serial.print(mag_data.z); Serial.print("\t|\t"); 
    Serial.print(mag_data.t); Serial.print("\t|\t"); 
    Serial.println();
    Serial.println();

    Serial.print("P1 Temp"); Serial.print("\t|\t"); 
    Serial.print("P2 Temp"); Serial.print("\t|\t"); 
    Serial.print("P3 Temp"); Serial.print("\t|\t"); 
    Serial.print("Press"); Serial.print("\t|\t"); 
    Serial.print("Humid"); Serial.print("\t|\t");
    Serial.print("Theta"); Serial.print("\t|\t");
    Serial.println();
    
    Serial.print(p_1_temperature); Serial.print("\t|\t"); 
    Serial.print(p_2_temperature); Serial.print("\t|\t"); 
    Serial.print(p_3_temperature); Serial.print("\t|\t"); 
    Serial.print(pressure_reading); Serial.print("\t|\t"); 
    Serial.print(humidity_reading); Serial.print("\t|\t");
    Serial.print(sun_sensor.getTheta()); Serial.print("\t|\t");
    Serial.println();
    Serial.println();

    Serial.print("PANEL 3"); Serial.print("\t|\t"); 
    Serial.println();

    Serial.print(analogRead(PANEL_3_CURRENT_V)); Serial.print("\t|\t"); 
    Serial.println();
    Serial.println();
    
    delay(1000);
  }
  #endif
  
#ifdef DEPLOY
#ifdef TEST_ORBIT
  while ((millis() - startup_time) < TESTORBIT_WAKEUP)
  {
    Serial.print("TEST ORBIT: Waiting to wakeup in ");
    Serial.println(TESTORBIT_WAKEUP - (millis() - startup_time));
    delay(1000);
  }
#else
  while ((millis() - startup_time) < HALFORBIT_WAKEUP)
  {
    #ifdef DEBUGGING
    Serial.print("Waiting to wakeup in ");
    Serial.println(HALFORBIT_WAKEUP - (millis() - startup_time));
    delay(1000);
    #endif
    // Send heartbeat to keep systems alive
    eps.heartbeat(heartbeat_payload);
    // Wait one minute
    delay(60000);
    // wait until halfway orbit to start sampling
  }
#endif
  while (ladder_step != MAX_LADDER_STEPS)
  {
    #ifdef TEST_ORBIT
    Serial.print("TEST ORBIT: Ladder step - ");
    Serial.println(ladder_step);
    while (!gaas_en)
    {
      Serial.println("TEST ORBIT: Waiting for GaAs trigger");
      delay(1000);
      break;
    }
    Serial.println("TEST ORBIT: Leaving GaAs trigger");
    #else
    while (!gaas_en)
    {
      #ifdef DEBUGGING
      Serial.println("Waiting for GaAs trigger");
      delay(1000);
      #endif
    }
    #endif
    //noInterrupts();
    
    gaas_en = false;
    sun_sensor.default_config();
    while (!sun_sensor.sample_wait());
    flux[ladder_step] = sun_sensor.getTheta();
    // Read from each sample
    set_read_mux(MUX_POS_GAAS);
    read_mux(&voltage_1[ladder_step], &current_1[ladder_step]);
    set_read_mux(MUX_POS_P1);
    read_mux(&voltage_2[ladder_step], &current_2[ladder_step]);
    set_read_mux(MUX_POS_P2);
    read_mux(&voltage_3[ladder_step], &current_3[ladder_step]);
    set_read_mux(MUX_POS_P3);
    read_mux(&voltage_4[ladder_step], &current_4[ladder_step]);
    set_read_mux(MUX_POS_GAAS);
    step_ladder();
    
    //interrupts();
  }
  // Reset the ladder step
  ladder_step = 0;
  // Invert the counting direction
  set_trace_direction(!trace_dir);
  // If two directions have been performed, then go to the next pixel
  if (trace_dir == COUNT_UP)
  {
    // Go to the next pixel
    step_mux();
    // If all pixels have been sampled, then reset mux
    if (digitalRead(MUX_GOOD))
    {
      reset_mux();
    }
  }
  
#ifdef DEBUGGING
  Serial.println("TEST ORBIT: Finished curve trace");
#endif

  // Find maximum power point for each sample
  for (i = 0; i < 16; i++)
  {
    if ((voltage_1[i] * current_1[i]) > mp_1)
    {
      mp_1 = voltage_1[i] * current_1[i];
      mp_1i = i;
    }
    if ((voltage_2[i] * current_2[i]) > mp_2)
    {
      mp_2 = voltage_2[i] * current_2[i];
      mp_2i = i;
    }
    if ((voltage_3[i] * current_3[i]) > mp_3)
    {
      mp_3 = voltage_3[i] * current_3[i];
      mp_3i = i;
    }
    if ((voltage_4[i] * current_4[i]) > mp_4)
    {
      mp_4 = voltage_4[i] * current_4[i];
      mp_4i = i;
    }
  }
  if (mp_1i == 0) mp_1i = 2; 
  else if (mp_1i == 15) mp_1i = 13;
  if (mp_2i == 0) mp_2i = 2; 
  else if (mp_2i == 15) mp_2i = 13;
  if (mp_3i == 0) mp_3i = 2; 
  else if (mp_3i == 15) mp_3i = 13;
  if (mp_4i == 0) mp_4i = 2; 
  else if (mp_4i == 15) mp_4i = 13;

#ifdef DEBUGGING
  Serial.print("MPP 1: ");
  Serial.println(mp_1i);
  Serial.print("MPP 2: ");
  Serial.println(mp_2i);
  Serial.print("MPP 3: ");
  Serial.println(mp_3i);
  Serial.print("MPP 4: ");
  Serial.println(mp_4i);
#endif
  
  // Read payload temperatures
  read_payload(&p_1_temperature, &p_2_temperature, &p_3_temperature);
  read_gaas_temp(&gaas_temperature);

  // Read humidity and pressure
  read_bme280();

  // Read accelerometry, gyroscope, and magnetometer
  read_magnetometer();
  read_imu();

  // Send all packets twice
  send_payload_1_packets();
  send_payload_2_packets();
  send_payload_3_packets();
  send_payload_4_packets();
  send_secondary_payload();
  send_tertiary_payload();
  
  //noInterrupts();
#endif
}
