import ddf.minim.*;

Minim minim;
AudioPlayer playerC, playerD, playerE;

void setup()
{
  size(200, 200);
  
  minim = new Minim(this);
  
  playerC = minim.loadFile("c.wav");
  playerD = minim.loadFile("d.wav");
  playerE = minim.loadFile("e.wav");
  
}

void draw()
{
  background(0);
  stroke(255);
  
}

void keyReleased() {
  if (key == 'c' || key == 'C') {playC();}
  else if (key == 'd' || key == 'D') {playD();}
  else if (key == 'e' || key == 'E') {playE();}
}

void playC()
{
  stopAll();
  playerC.play(1);
}
void playD()
{
  stopAll();
  playerD.play(1);
}
void playE()
{
  stopAll();
  playerE.play(1);
}
void stopAll()
{
  if(playerC.isPlaying()){playerC.pause(); playerC.rewind();}
  if(playerD.isPlaying()){playerD.pause(); playerD.rewind();}
  if(playerE.isPlaying()){playerE.pause(); playerE.rewind();}
}
