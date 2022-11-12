#define R_DIVIDER_CLOCK   8
#define R_DIVIDER_LATCH   10
#define R_DIVIDER_RESET   7
#define R_DIVIDER_ENABLE  9
#define R_DIVIDER_V       A12
#define R_DIVIDER_I       A2

#define LED1              25
#define LED2              26 

#define SWITCH1           27
#define SWITCH2           28

#define ANALOG_SAMPLES_V    5
#define ANALOG_SAMPLES_I    5

volatile int current_step = 0;

int v_readings[256];
int i_readings[256];

void setup_pins(void)
{
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

void setup() {
  setup_pins();
  analogReadResolution(12);
  Serial.begin(115200);
  reset_ladder();
}

void loop() {  
  while (Serial.available() > 0)
  {
    Serial.read();
    trace_curve();
  }
  if (!digitalRead(SWITCH1))
  {
    trace_curve();
    while (!digitalRead(SWITCH1));
  }
  if (!digitalRead(SWITCH2))
  {
    enable_led2();
    reset_ladder();
    while (!digitalRead(SWITCH2));
    delay(500);
    disable_led2();
  }
}
