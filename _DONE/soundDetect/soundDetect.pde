import ddf.minim.*;

Minim minim;
AudioInput in;

int ballX=320, ballY=10, ballYMax=480;
int screenW=640, screenH=480;
int sensitivity = 250;

void setup()
{
  size(640, 480);
  
  minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void draw()
{
  background(0);
  listenSound();
  moveBall();
  drawBall();
}

void listenSound()
{
  float soundLevel = in.left.level() * 10000;
  text(str(soundLevel), 10, 10);
  if(soundLevel > sensitivity) ballY=screenH/10*1;
  else if(soundLevel > sensitivity-5 && soundLevel < sensitivity) ballY=screenH/10*2;
  else if(soundLevel > sensitivity-10 && soundLevel < sensitivity-5) ballY=screenH/10*3;
}
void moveBall()
{
  if(ballY<ballYMax) ballY++;
}

void drawBall()
{
  fill(255);
  ellipse(ballX, ballY, 20, 20);
}

void keyReleased() 
{
  println(key);
  if (key == '1') ballY=screenH/10*10;
  if (key == '2') ballY=screenH/10*9;
  if (key == '3') ballY=screenH/10*8;
  if (key == '4') ballY=screenH/10*7;
  if (key == '5') ballY=screenH/10*6;
  if (key == '6') ballY=screenH/10*5;
  if (key == '7') ballY=screenH/10*4;
  if (key == '8') ballY=screenH/10*3;
  if (key == '9') ballY=screenH/10*2;
  if (key == '0') ballY=screenH/10*1;
  
}