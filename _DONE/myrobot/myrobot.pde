PImage imgHead, imgBody, imgLegLeft, imgLegRight;
float angleLegLeft = 0;
float angleLegRight = 0;
float xPos = 0; float yPos = 0;
float speed = 2;
boolean isMouseControl = false;

void setup()
{
  size(800, 800, P3D);
  background(255);
  smooth();
  
  imgHead = loadImage("head.png");
  imgBody = loadImage("body.png");
  imgLegLeft = loadImage("leg.left.png");
  imgLegRight = loadImage("leg.right.png");
}

void draw()
{
  background(255);
  
  angleLegLeft = map(mouseX, 0, width, 0, 50);
  angleLegRight = map(mouseX, 0, width, -50, 0);
  
  if(!isMouseControl)
  {
    yPos = 300;
    xPos += speed;
    if(xPos>width) xPos=0;
  }
  else
  {
    xPos = mouseX;
    yPos = mouseY;
  }
  
  pushMatrix();
    translate(xPos, yPos);
    drawRobot();
  popMatrix();
}

void drawRobot()
{
  pushMatrix();
    translate(0,-120);
    noStroke();
    drawRobotLegLeft();
    drawRobotLegRight();
    drawRobotBody();
    drawRobotHead();
  popMatrix();
}
void drawRobotHead()
{
  imageMode(CENTER);
  image(imgHead, 0, 0);
}
void drawRobotBody()
{
  imageMode(CENTER);
  image(imgBody, 0, 110);
}
void drawRobotLegLeft()
{
  pushMatrix();
    translate(-35, 150);
    rotate(radians(angleLegLeft));
    imageMode(CORNER);
    image(imgLegLeft, -35, 0);
  popMatrix();
}
void drawRobotLegRight()
{  
   pushMatrix();
    translate(35, 150);
    rotate(radians(angleLegRight));
    imageMode(CORNER);
    image(imgLegRight, -35, 0);
  popMatrix();
}

void mouseClicked() {
  isMouseControl = !isMouseControl;
}