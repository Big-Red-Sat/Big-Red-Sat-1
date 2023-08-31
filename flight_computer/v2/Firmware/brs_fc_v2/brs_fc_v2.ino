#define DEBUGGING

#define NC_V  P1_2
#define S1_CT P1_3
#define READ_CURRENT P1_4
#define READ_VOLTAGE P1_5
#define NO_V  P3_0
#define UNSET P3_1
#define SET P3_2
#define MAG_INT P3_3
#define CT_GOOD P3_4
#define GAAS_ON P3_5
#define MUX_GOOD P3_6
#define MUX_CLOCK P3_7
#define READ_BUSS P4_0
#define TRACE_DIR P4_2
#define GAAS_TEMP P4_4
#define BUSY  P4_5
#define PANEL_3_ON  P4_6
#define S0_CT P4_7


void init_pins(void)
{
  pinMode(NC_V, INPUT);
  pinMode(S1_CT, OUTPUT);
  pinMode(READ_CURRENT, INPUT);
  pinMode(READ_VOLTAGE, INPUT);
  pinMode(NO_V, INPUT);
  pinMode(UNSET, OUTPUT);
  pinMode(SET, OUTPUT);
  pinMode(MAG_INT, INPUT);
  pinMode(CT_GOOD, INPUT);
  pinMode(GAAS_ON, INPUT);
  pinMode(MUX_GOOD, INPUT);
  pinMode(MUX_CLOCK, INPUT);
  pinMode(READ_BUSS, INPUT);
  pinMode(TRACE_DIR, OUTPUT);
  pinMode(GAAS_TEMP, INPUT);
  pinMode(BUSY, OUTPUT);
  pinMode(PANEL_3_ON, INPUT);
  pinMode(S0_CT, OUTPUT);
}

void setup() {
  // put your setup code here, to run once:
  #ifdef DEBUGGING
  Serial.begin(115200);
  #endif
  init_pins();
}

void loop() {
  // put your main code here, to run repeatedly: 
  
}
