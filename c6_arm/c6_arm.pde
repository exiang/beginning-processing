float x, y;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 100;

float wLeftHand = 30; float hLeftHand = 100;
float wLeftForearm = 30; float hLeftForearm = 150;

void setup() {
  size(640, 360);
  strokeWeight(1);
  stroke(255, 160);
  
  x = 100;
  y = 100;
}

void draw() {
  background(0);
  
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;
  //angle1 = radians(50*-1);
  //angle2 = radians(30*-1);
  println(angle1);
  
  rectMode(CENTER);
  
  stroke(0, 0, 255); 
  ellipse(x, y, 10, 10); 
  drawHand();
}

void drawHand()
{
  rectMode(CORNER); 
  pushMatrix();
  // upper
  translate(x, y);
  rotate(angle1);
  stroke(255, 0, 0);
  //line(0, 0, segLength, 0);
  rect(-wLeftHand/2, 0, wLeftHand, hLeftHand);
  
  // lower
  translate(0, hLeftHand);
  rotate(angle2);
  stroke(0, 255, 0);
  //line(0, 0, segLength, 0);
  rect(-wLeftForearm/2, 0, wLeftForearm, hLeftForearm);
  popMatrix();
}

