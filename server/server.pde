import processing.net.*;
import processing.serial.*; // import the library
Serial port;

Server s;
Client c;
char letter;

void setup() {
  s = new Server(this, 8080); // Start a simple server on a port
  //serial
  println("Available serial ports:");
  for (int i = 0; i<Serial.list().length; i++) { 
    print("[" + i + "] ");
    println(Serial.list()[i]);
  }
  port = new Serial(this, Serial.list()[4], 9600);  // open the port!
}
void draw() {

  // Receive data from client
  c = s.available();
  if (c != null) {
    letter = c.readChar();
    println("server received: " + letter);
  }
   port.write(letter);   //sends the DATa to the ardiuno 
}
