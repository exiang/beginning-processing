void setup()
{
  size(200, 200);
  background(255);
  smooth();
  fill(255, 0, 0);
  noStroke();
  rect(50, 50, 50, 50);
  
  // todo: fix the rotation to be rotate at origin   
  pushMatrix();
    rotate(radians(45));
    fill(0,0,255);
    rect(50, 50, 50, 50);
  popMatrix();
  

}