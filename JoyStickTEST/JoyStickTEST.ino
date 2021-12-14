#define joyX A0
#define joyY A1
const int led = 8;
const int led2 = 9;   //assign led ports
int xValue;
int yValue;

void setup() {
  Serial.begin(9600); //begin write to pc

  pinMode(8,OUTPUT);    //select ports
  pinMode(9,OUTPUT);
}


void loop() {
 
  xValue = analogRead(joyX);        //reads joystick values
  yValue = analogRead(joyY);

  Serial.print(xValue);
  Serial.print("\t");
  Serial.println(yValue);   //prints values 
 
  
  if (xValue > 500){
    digitalWrite(led, HIGH);
    digitalWrite(led2, LOW);
  }
  if (xValue < 500){
    digitalWrite(led2, HIGH);
    digitalWrite(led, LOW);    
  }
  
}
