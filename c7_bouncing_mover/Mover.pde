class Mover
{

  PVector location;
  PVector speed;
    
  Mover(int x, int y, int xSpeed, int ySpeed)
  {  
    location = new PVector(x, y);
    speed = new PVector(xSpeed, ySpeed);
  }

  void display()
  {
    stroke(0);
    fill(175);
    // Display the ball at the location (x,y).
    ellipse(location.x,location.y,16,16);
  }
  
  void move()
  {
    location.add(speed);
    // or
    //location.x = location.x + speed.x;
    //location.y = location.y + speed.y;
  }
  
  void checkEdges()
  {
    // Check for bouncing.
    if ((location.x > width) || (location.x < 0)) {
      speed.x = speed.x * -1;
    }
    // todo 1: add y-axis implementation
    if ((location.y >= height) || (location.y < 0)) {
      speed.y = speed.y * -1;
    }
  }
  
}
