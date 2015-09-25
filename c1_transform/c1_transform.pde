void setup()
{
  size(200, 200);
  background(255);
  
  
  // black box
  fill(0);
  rect(40, 40, 40, 40);
  
  pushMatrix();
    // red box
    rectMode(CENTER);
    fill(255,0,0);
    rect(80, 80, 40, 40);
  popMatrix();
  
  
  fill(0,0,255);
  rect(120, 120, 40, 40);
  // todo: only rotate the red box
}
