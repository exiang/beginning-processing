import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

Sprite aunty, tourist;
StopWatch sw = new StopWatch();

public void setup() {
  size(320, 240);

  aunty = new Sprite(this, "prayingAunty.png", 2, 1, 99);
  aunty.setXY(width/2, height/2);
  aunty.setFrameSequence(0, 2, 0.5f);
  
  tourist = new Sprite(this, "tourist.png", 4, 1, 99);
  tourist.setXY(width/2+100, height/2);
  tourist.setFrameSequence(0, 4, 0.5f);
  
  //registerMethod("pre", this);
}

public void draw() 
{
  background(244);
  float elapsedTime = (float) sw.getElapsedTime();
  aunty.update(elapsedTime);
  tourist.update(elapsedTime);
  aunty.draw();
  tourist.draw();
}
