// Declare Mover object
Mover mover;

void setup() {
  size(200,200);
  smooth();
  background(255);
  // Make Mover object
  mover = new Mover(); 
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // Call functions on Mover object.
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

class Mover 
{
  PVector location;
  PVector velocity;

  Mover() 
  {
    location = new PVector(100, 100);
    velocity = new PVector(2, 5);
  }

  void update() 
  {
    location.add(velocity);
  }

  void display() 
  {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }

  void checkEdges() {

    if (location.x > width || location.x < 0) {
      velocity.x *= -1;
    }
    
    if (location.y > height || location.y < 0) {
      velocity.y *= -1;
    }

  }

}
