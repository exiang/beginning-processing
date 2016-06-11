void setup()
{
  size(200, 200);
  background(255);
  smooth();
  fill(255, 0, 0);
  noStroke();
  rect(50, 50, 50, 50);
  
  // todo 1: fix the rotation to be rotate at origin (corner)
  /*pushMatrix();
    translate(50, 50);
    rotate(radians(45));
    fill(0,0,255);
    rect(0, 0, 50, 50);
  popMatrix();*/
  
  
  // todo 2: fix the rotation to be rotate at origin (center)
  pushMatrix();
    translate(50+25, 50+25);
    rotate(radians(45));
    fill(0,255,255);
    rectMode(CENTER);
    rect(0, 0, 50, 50);
  popMatrix();

}