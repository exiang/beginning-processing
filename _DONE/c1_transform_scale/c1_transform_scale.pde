void setup()
{
  size(200, 200);
  background(255);
  
  stroke(128);
  rect(20, 20, 40, 40);
  
  stroke(0);
  pushMatrix();
    // todo: Scale up the black square, but keep its upper left corner in the same place
    translate(-20, -20);
    scale(2.0);
    fill(255,255,255, 128);
    rect(20, 20, 40, 40);
  popMatrix();
}