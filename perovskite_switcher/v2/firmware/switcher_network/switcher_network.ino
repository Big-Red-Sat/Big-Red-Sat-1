#define ENABLE_TEST_SOURCE 5
#define RESET_PANEL_SWITCH 6
#define ENABLE_PANEL_SWITCH 12
#define DECODER_10_19_CLOCK 13
#define DECODER_0_9_CLOCK 14

#define LED1              25
#define LED2              26 

#define SWITCH1           27
#define SWITCH2           28

volatile int current_panel = 0;

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

void step_decoder(void)
{
  if (current_panel == 20)
  {
    digitalWrite(ENABLE_PANEL_SWITCH, LOW);
    current_panel = 0;
  }
  if (current_panel == 10)
  {
    digitalWrite(ENABLE_PANEL_SWITCH, HIGH);
  }
  if (current_panel < 10)
  {
    enable_led1();
    digitalWrite(DECODER_0_9_CLOCK, HIGH);
    delay(500);
    digitalWrite(DECODER_0_9_CLOCK, LOW);
    disable_led1();
  }
  else
  {
    enable_led2();
    digitalWrite(DECODER_10_19_CLOCK, HIGH);
    delay(500);
    digitalWrite(DECODER_10_19_CLOCK, LOW);
    disable_led2();
  }
  current_panel++;
}

void reset_decoder(void)
{
  digitalWrite(RESET_PANEL_SWITCH, HIGH);
  delay(100);
  digitalWrite(RESET_PANEL_SWITCH, LOW);
  
  digitalWrite(ENABLE_PANEL_SWITCH, LOW);
  digitalWrite(DECODER_0_9_CLOCK, LOW);
  digitalWrite(DECODER_10_19_CLOCK, LOW);
}

void setup() {
  Serial.begin(115200);
  setup_pins();
  reset_decoder();
}

void loop() {
  // put your main code here, to run repeatedly: 
  while (Serial.available() > 0)
  {
    Serial.read();
    step_decoder();
  }
}
