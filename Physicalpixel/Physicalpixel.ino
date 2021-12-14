//Alex Ward & Jan Kroger
const int ledPin1 = 13;
const int ledPin2 = 12;     // Assign the pin at which the LED is attached to
int incomingByte;      // a variable to read incoming serial data into

void setup() {

  // initialize serial communication:

  Serial.begin(9600);

  // initialize the LED pin as an output:

  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);

}

void loop() {

  // see if there's incoming serial data:

  if (Serial.available() > 0) {

    // read the oldest byte in the serial buffer:

    incomingByte = Serial.read();

    // if it's a capital H  turn on led (HIGH)

    if (incomingByte == 'H') {

      digitalWrite(ledPin1, HIGH);

    

    }
      if (incomingByte == 'J') { // if 'J'turn on second LED high

     
      digitalWrite(ledPin2, HIGH);


    }

    // if it's an L  turn off the LED:

    if (incomingByte == 'L' ) {

      digitalWrite(ledPin1, LOW);


    }
      if (incomingByte == 'K') { //if its an 'K'turn off led2

      digitalWrite(ledPin2, LOW);
    

    }

  }
}
