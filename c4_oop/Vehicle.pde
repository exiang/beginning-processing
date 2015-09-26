class Vehicle
{
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  Vehicle(color pColor, float pXPos, float pYPos, float pXSpeed) 
  { 
    c = pColor;
    xPos = pXPos;
    yPos = pYPos;
    xSpeed = pXSpeed;
  }
  
  void display() 
  {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xPos, yPos, 20, 10);
 
  }

  void drive() 
  {
    xPos = xPos + xSpeed;
    if (xPos > width) 
    {
      xPos = 0;
    }
  }
}
