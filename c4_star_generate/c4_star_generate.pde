void setup() 
{
  size(640, 360);
}

void draw() 
{
  
}

void mouseReleased() 
{
  // randomly generate inner and outter radius
  float r1 = random(10,80);
  float r2 = r1+random(5,20);
  float radian = radians(Math.round(random(1, 360)));
  println(radian);
  // orange color stroke and fill with alpha yellow background color
  stroke(255,130,0);
  fill(255,255,0, Math.round(random(40,255)));
  // rotate it
  pushMatrix();
  // draw star
  translate(mouseX, mouseY);
  rotate(radian);
  star(0, 0, r1, r2, Math.round(random(8,20))); 
  popMatrix();
}

void star(float x, float y, float radius1, float radius2, int npoints) 
{
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
