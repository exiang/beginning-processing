Hero axe;
Hero sniper;
Hero lion;
ArrayList<Hero> heroes;

void setup()
{
  size(800, 800);
  
  axe = new Hero("Axe", 150, 150, 60, 60, 1);
  
  sniper = new Hero("Sniper", 300, 100, 130, 140, 5);
  sniper.autoMove = false;
  sniper.avatar = loadImage("hero.sniper.png");
  
  lion = new Hero("Lion", 500, 400, 50, 50, 10);
  
  heroes = new ArrayList<Hero>();
  heroes.add(axe);
  heroes.add(sniper);
  heroes.add(lion);
  
  for(int i=0; i<heroes.size(); i++)
  {
    heroes.get(i).sayMyName();
  }
  
  
}


void draw()
{
  background(0, 255, 0);
  // axe
  axe.drawMe();
  
  // sniper
  //sniper.xPos = mouseX; sniper.yPos = mouseY;
  sniper.drawMe();

  // lion
  lion.drawMe();
}

void mousePressed() 
{
  sniper.xDest = mouseX;
  sniper.yDest = mouseY;
}