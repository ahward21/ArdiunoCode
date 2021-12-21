/*
  AnalogReadSerial

  Reads an analog input on pin 0, prints the result to the Serial Monitor.
  Graphical representation is available using Serial Plotter (Tools > Serial Plotter menu).
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

  This example code is in the public domain.

  https://www.arduino.cc/en/Tutorial/BuiltInExamples/AnalogReadSerial
*/

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  pinMode(9, OUTPUT);
  pinMode(8, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // read the input on analog pin 0:

  int up = 1;
  int down = 2;
  int right = 3;
  int left = 4;
  int upLeft = 5;
  int upRight = 6;
  int downLeft = 7;
  int downRight = 8;

  int sensorValueX = analogRead(A0);
  int sensorValueY = analogRead(A1);

  delay(10);

  if ((sensorValueX < 400) && (sensorValueY > 400 && sensorValueY < 600)) {
    Serial.print("left");
  }
  else if ((sensorValueX > 600) && (sensorValueY > 400 && sensorValueY < 600)) {
    Serial.print("right");
  }
  else if ((sensorValueY < 400) && (sensorValueX > 400 && sensorValueX < 600)) {
    Serial.print("up");
  }
  else if ((sensorValueY > 600) && (sensorValueX > 400 && sensorValueX < 600)) {
    Serial.print("down");
  }

  else if ((sensorValueY < 400) && (sensorValueX < 400)) {
    Serial.print("upLeft");
  }
  else if ((sensorValueY < 400) && (sensorValueX > 600)) {
    Serial.print("upRight");
  }
  else if ((sensorValueY > 600) && (sensorValueX < 400)) {
    Serial.print("downLeft");
  }
  else if ((sensorValueY > 600) && (sensorValueX > 600)) {
    Serial.print("downRight");
  }

  else if((sensorValueY<600&&sensorValueY>400)&&(sensorValueX<600&&sensorValueX>400)){
    Serial.print("null");
  }



}
