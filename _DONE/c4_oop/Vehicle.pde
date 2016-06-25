class Vehicle
{
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  
  PImage car;
  
  Vehicle(color pColor, float pXPos, float pYPos, float pXSpeed, PImage pCar) 
  { 
    c = pColor;
    xPos = pXPos;
    yPos = pYPos;
    xSpeed = pXSpeed;
    
    car = pCar;
  }
  
  void displayReal()
  {
    imageMode(CENTER);
    tint(c, 255);
    image(car, xPos, yPos, 120, 60);
  }
  
  void display() 
  {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xPos, yPos, 20, 10);
    
    // back left tyre
    rect(xPos-6, yPos-6, 4, 2);
    rect(xPos+6, yPos+6, 4, 2);    
    rect(xPos+6, yPos-6, 4, 2);    
    rect(xPos-6, yPos+6, 4, 2);
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
