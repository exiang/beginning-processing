import gifAnimation.*;

Gif loopingGif;

public void setup() {
  size(400, 200);
  
  loopingGif = new Gif(this, "lavalamp.gif");
  loopingGif.loop();
}

void draw() {
  background(0);
  image(loopingGif, 10, 10);
 
}

