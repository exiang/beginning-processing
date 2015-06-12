void setup()
{
  size(200, 200);
  background(255);
  
  rotate(radians(30));
  
  // black box
  fill(0);
  rect(40, 40, 40, 40);
  
  // red box
  fill(255,0,0);
  rect(80, 80, 40, 40);
  
  // todo: only rotate the red box
}
