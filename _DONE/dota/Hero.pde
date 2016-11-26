class Hero
{
  String name = "";
  int xPos = 0;
  int yPos = 0;
  float hp = 100.0;
  int w = 50;
  int h = 50;
  int speed = 1;
  boolean autoMove = true;
  PImage avatar = null;
  
  Hero(String pName, int pXPos, int pYPos, int pW, int pH, int pSpeed)
  {
    name = pName;
    xPos = pXPos;
    yPos = pYPos;
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
    text(name, xPos, yPos-(h/2)-20); 
  }
  
  void moveMe()
  {
    if(autoMove)
    {
      xPos = xPos + speed;
      if(xPos > width) xPos = -100;
    }
  }
}