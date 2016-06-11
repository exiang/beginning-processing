void setup()
{
  size(200, 200);
  background(255);
  
  stroke(128);
  rect(20, 20, 40, 40);
  
  stroke(0);
  pushMatrix();
    // todo: Scale up the black square, but keep its upper left corner in the same place 
    scale(2.0);
    rect(20, 20, 40, 40);
  popMatrix();
}