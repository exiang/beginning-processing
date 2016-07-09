PImage back, middle, front;
PVector vback, vmiddle, vfront;

void setup()
{
  back = loadImage("back.png");
  middle = loadImage("middle.png");
  front = loadImage("front.png");
  
  size(640, 420);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 0);
  
  frameRate(24);
}

void draw()
{
  background(255);
  
  paraDraw(back, vback, 10);
  paraDraw(middle, vmiddle, 20);
  paraDraw(front, vfront, 30);
}

void paraDraw(PImage img, PVector pos, float vel)
{
  imageMode(CORNER);
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  
  image(img, pos.x, pos.y);
}
