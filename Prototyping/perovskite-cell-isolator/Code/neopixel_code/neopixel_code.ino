#include <Adafruit_NeoPixel.h>

#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif

#define PIN       10 
#define NUMPIXELS 18
Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

String  led_string;

int led_int;
int on;

int color_r;
int color_g;
int color_b;

void setup() {
  Serial.begin(9600);
  
  pixels.begin(); // INITIALIZE NeoPixel strip object (REQUIRED)
  pixels.clear();
   for(int i=0; i<NUMPIXELS; i++) { // For each pixel...
    pixels.setPixelColor(i, pixels.Color(0, 0, 0));
    pixels.show();   // Send the updated pixel colors to the hardware.
   
   }
  
}

void loop() {

  //100001255000012
  
  //6,7,8 => color_r
  //9,10,11 => color_g
  //12,13,14 => color_b
  
  if (Serial.available() > 0) {
    // read the incoming byte:
    led_string = Serial.readString();

    int color_r = ((int) (led_string[6] - 48) * 100) + ((int) (led_string[7] - 48) * 10) + (int) (led_string[8] - 48);
    int color_g = ((int) (led_string[9] - 48) * 100) + ((int) (led_string[10] - 48) * 10) + (int) (led_string[11] - 48);
    int color_b = ((int) (led_string[12] - 48) * 100) + ((int) (led_string[13] - 48) * 10) + (int) (led_string[14] - 48);

    Serial.println(color_r);
    Serial.println(color_g);
    Serial.println(color_b);
    
    
    on = led_string[0] % 2;
  
    led_int = ((led_string[1]%2) * 16) + ((led_string[2]%2) * 8) + ((led_string[3]%2) * 4) + ((led_string[4]%2) * 2) + ((led_string[5]%2));

    if(led_int == 0){
      for(int i=0; i<NUMPIXELS; i++) { // For each pixel...
        pixels.setPixelColor(i, pixels.Color(0, 0, 0));
        pixels.show();   // Send the updated pixel colors to the hardware.
   
      }
    }
    else if(led_int == 31){
      for(int i=0; i<NUMPIXELS; i++) { // For each pixel...
        pixels.setPixelColor(i, pixels.Color(color_r, color_g, color_b));
        pixels.show();   // Send the updated pixel colors to the hardware.
   
      }
    }
    if(on){
      pixels.setPixelColor(led_int-1, pixels.Color(color_r, color_g, color_b));
      pixels.show();   // Send the updated pixel colors to the hardware.
    }

    else{
      pixels.setPixelColor(led_int-1, pixels.Color(0, 0, 0));
      pixels.show();   // Send the updated pixel colors to the hardware.
    }
    
  }
  
}
