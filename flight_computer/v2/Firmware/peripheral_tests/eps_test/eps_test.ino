#include <SoftwareSerial.h>

// Send this every minute to keep switched outputs enabled
byte empty_payload[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte heartbeat_payload[] = {0x50, 0x50, 0x50, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte sleep_payload[] = {0x50, 0x50, 0x50, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
byte radio_payload[] = {0x50, 0x50, 0x50, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
#define EPS_BYTES 21
#define EPS_BUSY HIGH
#define EPS_READY LOW
#define EPS_TRIES 5

// Serial interface for EPS
SoftwareSerial eps_serial(EPS_RX, EPS_TX, false);

bool eps_radio(void)
{
  int tries = EPS_TRIES;
  while (!eps_radio_send())
  {
    if (tries-- <= 0) return false;
  }
  return true;
}

bool eps_radio_send(void)
{
  eps_serial.write(radio_payload, EPS_BYTES);
  byte ack[EPS_BYTES];
  memset(ack, 0, EPS_BYTES);
  while (digitalRead(BUSY) == HIGH);
  eps_serial.readBytes(ack, EPS_BYTES);
  if (memcmp(empty_payload, ack, EPS_BYTES) != 0) return true;
  else return false;
}

bool eps_sleep(void)
{
  int tries = EPS_TRIES;
  while (!eps_sleep_send())
  {
    if (tries-- <= 0) return false;
  }
  return true;
}

bool eps_sleep_send(void)
{
  eps_serial.write(sleep_payload, EPS_BYTES);
  byte ack[EPS_BYTES];
  memset(ack, 0, EPS_BYTES);
  while (digitalRead(BUSY) == HIGH);
  eps_serial.readBytes(ack, EPS_BYTES);
  if (memcmp(empty_payload, ack, EPS_BYTES) != 0) return true;
  else return false;
}

bool eps_heartbeat(void)
{
  int tries = EPS_TRIES;
  while (!eps_heartbeat_send())
  {
    if (tries-- <= 0) return false;
  }
  return true;
}

bool eps_heartbeat_send(void)
{
  eps_serial.write(heartbeat_payload, EPS_BYTES);
  byte ack[EPS_BYTES];
  memset(ack, 0, EPS_BYTES);
  while (digitalRead(BUSY) == HIGH);
  eps_serial.readBytes(ack, EPS_BYTES);
  if (memcmp(empty_payload, ack, EPS_BYTES) != 0) return true;
  else return false;
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(BUSY, INPUT);
  while (digitalRead(BUSY) == HIGH);
  eps_serial.begin(38400);
}

void loop() {
  // put your main code here, to run repeatedly: 
  if (!eps_heartbeat())
  {
    Serial.println("Heartbeat failed");
  }
  if (!eps_radio())
  {
    Serial.println("Radio send failed");
  }
  if (!eps_sleep())
  {
    Serial.println("Sleep failed");
  }
}
