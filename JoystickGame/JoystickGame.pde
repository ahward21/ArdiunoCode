import processing.serial.*;

Serial myPort;

color c=color(0);
int x, y, xp, yp;
int strokeWidth=1;
boolean draw= true;
String val = "100 200";

void setup()
{
  size(640, 480);
  background(255);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}
void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val= myPort.readString();
  }
  noStroke();
  fill(c);
  rect(0, 0, 30, 30);
  stroke(c);
  strokeWeight(strokeWidth);
  String[] coords = splitTokens(val);
  x = int(coords[0]);
  y = int(coords[1]);
  xp =  pmouseX;
  yp = pmouseY;

  if (draw==true) line(x, y, xp, yp);
}



void mouseDragged() {
  draw=true;
}
void mouseReleased() {
  draw=false;
}
