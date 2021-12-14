/*
       Switch and 2 LED test program
*/

int led1Pin = 12;               // LED #1 is connected to pin 12
int led2Pin = 13;               // LED #2 is connected to pin 11
int switchPin = 2;              // switch is connected to pin 2
int val;                        // variable for reading the pin status


void setup() {
  Serial.begin(9600);
  pinMode(led1Pin, OUTPUT);     // Set the LED #1 pin as output
  pinMode(led2Pin, OUTPUT);     // Set the LED #2 pin as output
  pinMode(switchPin, INPUT);    // Set the switch pin as input
}


void loop() {
  val = digitalRead(switchPin);    // read input value and store it in val
  if (val == LOW) {                 // check if the button is pressed
    Serial.write(1);
    digitalWrite(led1Pin, HIGH);   // turn LED #1 on
    digitalWrite(led2Pin, LOW);    // turn LED #2 off
  }
  if (val == HIGH) {               // check if the button is not pressed
     Serial.write(0);
    digitalWrite(led1Pin, LOW);    // turn LED #1 off
    digitalWrite(led2Pin, HIGH);   // turn LED #2 on
  }
  delay(100);
}
