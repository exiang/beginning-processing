void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background(255);
  stroke(0);
  noFill();
  drawCircle(width/2,height/2,300);
}

void drawCircle(float x, float y, float radius) 
{
  // todo 1: add a semi gray background color to the circles
  // todo 2: try cut down the loop of the circles by playing with if condition logic below
  // todo 3: grow circles to the right only
  fill(128, 55);
  ellipse(x, y, radius, radius);
  if(radius > 100) 
  {
    // drawCircle() calls itself twice, creating a branching effect. 
    // For every circle, a smaller circle is drawn to the left and right.
    // right
    drawCircle(x + radius/2, y, radius/2);
    // left
    //drawCircle(x - radius/2, y, radius/2); 
  }
}
