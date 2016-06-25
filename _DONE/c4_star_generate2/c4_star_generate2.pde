import java.util.Date;

void setup() 
{
  size(640, 360);
  
  // todo1: press spacebar to capture current frame to image
}

void draw() 
{
  drawStar();
}

void drawStar() 
{
  // randomly generate inner and outter radius
  float r1 = random(10,80);
  float r2 = r1+random(5,20);
  float radian = radians(Math.round(random(1, 360)));
  println(radian);
  // white color stroke and fill with alpha random background color
  stroke(255,255,255);
  fill(Math.round(random(0, 255)),Math.round(random(0, 255)),Math.round(random(0, 255)), Math.round(random(40,128)));
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

void keyPressed()
{
  if(key == ' ')
  {
    Date d = new Date();
    long current = d.getTime()/1000; 
    saveFrame("star_generate_2_"+current+".png");
  }
}
