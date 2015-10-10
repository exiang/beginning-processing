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
    
    fill(0);
    // back left tyre
    rect(xPos-6, yPos-6, 4, 2);
    // back right tyre
    rect(xPos-6, yPos+6, 4, 2);
    // front left tyre
    rect(xPos+6, yPos-6, 4, 2);
    // front right tyre
    rect(xPos+6, yPos+6, 4, 2);
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
