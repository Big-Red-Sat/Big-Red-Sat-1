#define ENABLE_TEST_SOURCE 5
#define RESET_PANEL_SWITCH 6
#define ENABLE_PANEL_SWITCH 12
#define DECODER_10_19_CLOCK 13
#define DECODER_0_9_CLOCK 14

#define R_DIVIDER_CLOCK   8
#define R_DIVIDER_LATCH   10
#define R_DIVIDER_RESET   7
#define R_DIVIDER_ENABLE  9
#define R_DIVIDER_V       A12
#define R_DIVIDER_I       A2

#define ANALOG_SAMPLES_V    5
#define ANALOG_SAMPLES_I    5

#define LED1              25
#define LED2              26 

#define SWITCH1           27
#define SWITCH2           28

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
  
  pinMode(R_DIVIDER_V, INPUT);
  pinMode(R_DIVIDER_I, INPUT);
  
  pinMode(LED1, OUTPUT);
  digitalWrite(LED1, LOW);
  pinMode(LED2, OUTPUT);
  digitalWrite(LED2, LOW);

  pinMode(SWITCH1, INPUT_PULLUP);
  pinMode(SWITCH2, INPUT_PULLUP);
}

void enable_led1(void)
{
  digitalWrite(LED1, HIGH);
}

void disable_led1(void)
{
  digitalWrite(LED1, LOW);
}

void enable_led2(void)
{
  digitalWrite(LED2, HIGH);
}

void disable_led2(void)
{
  digitalWrite(LED2, LOW);
}

int read_divider_v(void)
{
  analogReference(INTERNAL2V5);
  int readings = 0;
  for (int i = 0; i < ANALOG_SAMPLES_V; i++)
  {
    readings += analogRead(R_DIVIDER_V);
  }
  return readings / ANALOG_SAMPLES_V;
}

int read_divider_i(void)
{
  analogReference(INTERNAL1V2);
  int readings = 0;
  for (int i = 0; i < ANALOG_SAMPLES_I; i++)
  {
    readings += analogRead(R_DIVIDER_I);
  }
  return readings / ANALOG_SAMPLES_I;
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

void trace_curve(void)
{
  for (int i = 0; i < 256; i++)
  {
    v_readings[i] = read_divider_v();
    i_readings[i] = read_divider_i();
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
    enable_led2();
    digitalWrite(DECODER_10_19_CLOCK, HIGH);
    digitalWrite(DECODER_10_19_CLOCK, LOW);
    disable_led2();
  }
  else
  {
    enable_led1();
    digitalWrite(DECODER_0_9_CLOCK, HIGH);
    digitalWrite(DECODER_0_9_CLOCK, LOW);
    disable_led1();
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
  analogReadResolution(12);
  setup_pins();
  reset_decoder();
  reset_ladder();
}

void loop() {
  while (Serial.available() > 0)
  {
    char command[1];
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
    else if (command[0] == 71)
    {
      reverse_bias ^= 1;
      digitalWrite(REVERSE_BIAS, reverse_bias);
      Serial.println(reverse_bias);
    }
  }
//  if (!digitalRead(SWITCH1))
//  {
//    trace_curve();
//    while (!digitalRead(SWITCH1));
//  }
//  if (!digitalRead(SWITCH2))
//  {
//    enable_led2();
//    reset_ladder();
//    while (!digitalRead(SWITCH2));
//    delay(500);
//    disable_led2();
//  } 
}
