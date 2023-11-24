#include "Adafruit_BMP280.h"
#include <Arduino.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WiFiAP.h>
#include <Wire.h>
#include <ArduinoJson.h>
#include "freertos/FreeRTOS.h"

Adafruit_BMP280 bmp; 
#define LED_BUILTIN 13

// Replace with your network credentials
const char *ssid = "myAPtest";
const char *password = "eightcharacters";

WiFiServer server(80);
 
StaticJsonDocument<250> jsonDocument;
char buffer[250];

float tmp = 0;
float pressure = 0;
//float humidity = 0;
 
void create_json() {  
  jsonDocument.clear();  
  jsonDocument["temperature"] = tmp;
  jsonDocument["pressure"] = pressure;
//  jsonDocument["humidity"] = humidity;
  serializeJson(jsonDocument, buffer);
}
volatile int counter = 0;

void read_sensor_data(void) {
//    tmp = tmp++;
//    pressure = pressure++;
     tmp = bmp.readTemperature();
     pressure = bmp.readPressure() / 100.0F; 
//     humidity = bmp.readHumidity();
//     vTaskDelay(1000 / portTICK_PERIOD_MS);
}
 
void getData() {
   create_json();
}
//
//void setup_task() {    
//  xTaskCreate(     
//  read_sensor_data,      
//  "Read sensor data",      
//  1000,      
//  NULL,      
//  1,     
//  NULL     
//  );     
//}

void setup() {     
  Serial.begin(115200); 
  pinMode(LED_BUILTIN, OUTPUT);
  if (!bmp.begin(0x76)) 
  {
    Serial.println("Could not find a valid bmp280 sensor, check wiring!");
    while (1)
    {
      digitalWrite(LED_BUILTIN, HIGH);
      delay(500);
      digitalWrite(LED_BUILTIN, LOW);
      delay(500);
    }
  }
  Serial.println();
  Serial.println("Configuring access point...");

  // You can remove the password parameter if you want the AP to be open.
  WiFi.softAP(ssid, password);
  IPAddress myIP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(myIP);
  server.begin();

  Serial.print("Server started ");
  Serial.println(ssid);
//  setup_task();       
}    
       
void loop() {    
  WiFiClient client = server.available();   // listen for incoming clients
  if (client) {                             // if you get a client,
    String currentLine = "";                // make a String to hold incoming data from the client
    while (client.connected()) {            // loop while the client's connected
      if (client.available()) {             // if there's bytes to read from the client,
        char c = client.read();             // read a byte, then
        if (c == '\n') {                    // if the byte is a newline character
          
          // if the current line is blank, you got two newline characters in a row.
          // that's the end of the client HTTP request, so send a response:
          if (currentLine.length() == 0) {
            break;
          } else {    // if you got a newline, then clear currentLine:
            currentLine = "";
          }
        } else if (c != '\r') {  // if you got anything else but a carriage return character,
          currentLine += c;      // add it to the end of the currentLine
        }

        // Check to see if the client request was "GET /H" or "GET /L":
        if (currentLine.endsWith("GET /data"))
        {
          read_sensor_data();
          getData();
          client.println("HTTP/1.1 200 OK");
          client.println("Content-type:application/json");
          client.println();
          client.write(buffer);
          client.println();
        }
        if (currentLine.endsWith("GET /H")) {
          digitalWrite(LED_BUILTIN, HIGH);               // GET /H turns the LED on
        }
        if (currentLine.endsWith("GET /L")) {
          digitalWrite(LED_BUILTIN, LOW);                // GET /L turns the LED off
        }
      }
    }
    // close the connection:
    
    client.stop();
  }
}
