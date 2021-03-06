import processing.video.*;
Movie theMov;
boolean isPlaying;
boolean isLooping;

PShader blur;

void setup() {
  size(960, 540);
  frameRate(30);
   blur = loadShader("blur.glsl");
   
  theMov = new Movie(this, "0293_earthonblackflair.mp4");
  theMov.loop();
  
  // todo 1: try to add filter here, change the video color to grayscale
  // todo 2: try different filter
  
  // todo 3: when user hit 'p', toggle the movie between pause/play
  
  isPlaying = true;
  isLooping = true;
}


void draw() {
  
  filter(blur);
  background(0);
  println(theMov.time()+" vs " +theMov.duration());
  
  if (theMov.time() == theMov.duration()) 
  { 
    println("movie ended");
    //theMov.jump(1);
    theMov.stop();
    isPlaying = false;
  }

  image(theMov, 0, 0);
  //filter(GRAY);
  //filter(INVERT);
}

void movieEvent(Movie m) { 
  m.read(); 
} 

void keyPressed() 
{
    if (key == 'p') 
    {
      if (isPlaying) 
      {
        theMov.pause();
      } 
      else 
      {
        theMov.play();
      }
      isPlaying = !isPlaying;
    }
}
