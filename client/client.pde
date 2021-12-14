import processing.net.*; // import the library
Client p;
char letter;
float boxX, box2X;      //simple variables for the box
float boxY, box2Y;
int boxSize = 20;
boolean mouseOverBox = false;
boolean mouseOverBox2 = false;


void setup() {
  p = new Client(this, "127.0.0.1", 8080); // creation of the server's IP and port
  
  size(200, 200);          // Creating x, y coords for the box's positions
  boxX = width/2.0;
  box2X = width/2.0;
  box2Y = height/4.0;
  boxY = height/2.0;
  rectMode(RADIUS);


}

void draw(){
  background(0);
  // Test if the cursor is over the box(1)============================
 
  if (mouseOverBox==false && (mouseX > boxX-boxSize && mouseX < boxX+boxSize &&
    mouseY > boxY-boxSize && mouseY < boxY+boxSize)) {
    mouseOverBox = true;
    // draw a line around the box and change its color:
    stroke(0,0,255);
    fill(0,0,255);
    // send an 'H' to indicate mouse is over square:
    p.write('H');
    println("Character sent to Arduino: " + 'H'); // for feedback in Processing
  } else if (mouseOverBox==true && (mouseX < boxX-boxSize || mouseX > boxX+boxSize ||
    mouseY < boxY-boxSize || mouseY > boxY+boxSize)) {
    stroke(153);
    fill(153);
    // send an 'L' to turn the LED off:
    p.write('L');
    println("Character sent to Arduino: " + 'L'); // for feedback in Processing
    mouseOverBox = false; // return the box to it's inactive state:
  }
  //==================================Box2============================
    if (mouseOverBox2==false && (mouseX > box2X-boxSize && mouseX < box2X+boxSize &&
    mouseY > box2Y-boxSize && mouseY < box2Y+boxSize)) { //collision detection for not the button
    mouseOverBox2 = true;
    // draw a line around the box and change its color:
    stroke(255,0,0);
    fill(255,0,0);
    // send an 'J' to indicate mouse is over square:
    p.write('J');
    println("Character sent to Arduino: " + 'H'); // for feedback in Processing
  } else if (mouseOverBox2==true && (mouseX < box2X-boxSize || mouseX > box2X+boxSize ||
    mouseY < box2Y-boxSize || mouseY > box2Y+boxSize)) {
    // return the box to it's inactive state:
    stroke(153);
    fill(153);
    // send an 'K' to turn the LED off:
    p.write('K');
    println("Character sent to Arduino: " + 'L'); // for feedback in Processing
    mouseOverBox2 = false;
  }
  

  // Draw the box
  rect(boxX, boxY, boxSize, boxSize);
  text("LED1", boxX+30,boxY);
  rect(box2X, box2Y, boxSize, boxSize);
  text("LED2", box2X+30, box2Y);
}
