class Hero
{
  String name = "";
  float easing = 0.05;
  int xPos = 0;
  int yPos = 0;
  int xDest = 0;
  int yDest = 0;
  int slope;
  float hp = 100.0;
  int w = 50;
  int h = 50;
  int speed = 1;
  boolean autoMove = true;
  PImage avatar = null;
  
  Hero(String pName, int pXPos, int pYPos, int pW, int pH, int pSpeed)
  {
    name = pName;
    xPos = xDest = pXPos;
    yPos = yDest = pYPos;
    w = pW;
    h = pH;
    speed = pSpeed;
  }
  
  void sayMyName()
  {
    println(name);
  }
  
  void sayMyPosition()
  {
    println("x: "+xPos+", y:"+yPos);
  }
  
  void drawMe()
  {
    moveMe();
    
    if(avatar != null)
    {
      imageMode(CENTER);
      image(avatar, xPos, yPos, w, h);
    }
    else
    {
      fill(255);
      ellipse(xPos, yPos, w, h);
    }
    
    fill(0);
    textAlign(CENTER);
    text(name, xPos, yPos-(h/2)-20); 
  }
  
  void moveMe()
  {
    if(autoMove)
    {
      xPos = xPos + speed;
      if(xPos > width) xPos = -100;
    }
    else
    {
       int xDistance = xDest - xPos;
       int yDistance = yDest - yPos;
       xPos += xDistance * easing;
       yPos += yDistance * easing;
    }
  }
}