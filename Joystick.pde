

/**
 * Simple Read
 *
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;   // Data received from the serial port
String up = "up";
String down= "down";

void setup()
{
  size(400, 400);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw()
{

  background(255);
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);
  if ( myPort.available() > 0) {  // If data is available,
    val= myPort.readString();
  }
  print(val);
  if (val.equals("null")) {
    fill(0);     //black
  }
  if (val.equals("down")) {
    fill(150);        //white
  }
  if (val.equals("left")) {
    fill(255, 255, 0);    //yellow
  }
  if (val.equals("right")) {
    fill(255,0,255);      //purple
  }
  if (val.equals("upLeft")) {
    fill(0,255,255);
  }
  if (val.equals("upRight")) {
    fill(25, 45, 211);
  }
  if (val.equals("downLeft")) {
    fill(25, 66, 167);
  }
  if (val.equals("downRight")) {
    fill(2, 120, 100);
  }
}
