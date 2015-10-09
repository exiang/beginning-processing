/* 
https://processing.org/tutorials/pvector/
turn this into Mover class and object
with functions like:

mover.update();
mover.checkEdges();
mover.display(); 
*/


PVector location;
PVector velocity;

void setup() 
{
  size(640,360);
  background(255);
  location = new PVector(100,100);
  velocity = new PVector(2, 5);
}

void draw() 
{
  background(255);

  // Move the ball according to its speed.
  location.add(velocity);
  
  // Check for bouncing.
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  // todo 1: add y-axis implementation
  if ((location.y >= height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }

  stroke(0);
  fill(175);
  // Display the ball at the location (x,y).
  ellipse(location.x, location.y, 16,16);
}
