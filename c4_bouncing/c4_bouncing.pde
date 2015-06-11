float x = 100;
float y = 100;
float xspeed = 2;
float yspeed = 3.3;

void setup() 
{
  size(640,360);
  background(255);
}

void draw() 
{
  background(255);

  // Move the ball according to its speed.
  x = x + xspeed;
  // todo 1: add y-axis implementation
  
  // Check for bouncing.
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  // todo 1: add y-axis implementation
  

  stroke(0);
  fill(175);
  // Display the ball at the location (x,y).
  ellipse(x,y,16,16);
}