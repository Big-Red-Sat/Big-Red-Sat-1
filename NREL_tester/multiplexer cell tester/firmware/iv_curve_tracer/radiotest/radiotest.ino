#include <SoftwareSerial.h>

#define BUSYPIN 4
#define BYTES 21

SoftwareSerial eyestarSerial(10, 11, true); // RX, TX

void setup() {
  Serial.begin(9600);
  Serial.println("Starting radio test...");
  eyestarSerial.begin(38400);
  pinMode(BUSYPIN, INPUT);
}

int transmitData(){
  byte payload[] = {0x50, 0x50, 0x50, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
  eyestarSerial.write(payload, 21);
  
  byte ack[BYTES];
  memset(ack, 0, BYTES);
  Serial.println("Before reading from radio");
  for (int i = 0; i < BYTES; i++)
  {
    Serial.print("0x");
    Serial.print(ack[i], HEX);
    Serial.print(", ");
  }
  Serial.println();

  Serial.println("After reading from radio");
  eyestarSerial.readBytes(ack, BYTES);
  for (int i = 0; i < BYTES; i++)
  {
    Serial.print("0x");
    Serial.print(ack[i], HEX);
    Serial.print(", ");
  }
  Serial.println();

//  byte switches[] = {0x50, 0x50, 0x50, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
//  eyestarSerial.write(switches, 21);

  if(ack[0] == 0xAA && ack[1] == 0x05 && ack[2] == 0xFF){
    return 1;
  }
  else if(ack[0] == 0xAA && ack[1] == 0x05 && ack[2] == 0x00){
    return 0;
  }
  else{
    return 2;
  }
}

void loop() {
  //if(digitalRead(BUSYPIN) == 0){
    int error = transmitData();
    if(error == 0){
      Serial.println("ACK, packet correct");
    }
    else if(error == 1){
      Serial.println("NAK, incorrect packet");
    }
    else{
      Serial.println("unknown error, neither ACK nor NAK");
    }
    while(1);
  //}
}
