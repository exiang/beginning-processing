int x = 0;
int y = 0;

void setup() 
{
  //size(480, 120);
  fullScreen();
  noCursor();
  //frameRate(10);
}

void draw() 
{
  // todo 1: clear the screen buffer everytime you draw
  //background(255);
  float mySize = random(20,100);
  fill(random(0,255), random(0,255), random(0,255), map(mySize, 80, width, 80, 100));
  noStroke();
  ellipse(x, y, mySize, mySize);
  x+=100;
  if(y<height)
  {
    if(x>width){y+=100; x=0;}
  }
  else{
    if(x>width) y =x= 0;
  }
}