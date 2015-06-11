import processing.video.*;
Movie theMov;
boolean isPlaying;
boolean isLooping;

void setup() {
  size(960, 540);
  frameRate(30);
  theMov = new Movie(this, "0293_earthonblackflair.mp4");
  theMov.loop();
  
  // todo 1: try to add filter here, change the video color to grayscale
  //theMov.filter(GRAY);
  // todo 2: try different filter
  //theMov.filter(THRESHOLD);
  //theMov.filter(POSTERIZE, 4);
  // todo 3: when user hit 'p', toggle the movie between pause/play
  
  isPlaying = true;
  isLooping = true;
}


void draw() {
  //background(0);
  println(theMov.time()+" vs " +theMov.duration());
  
  if (theMov.time() == theMov.duration()) 
  { 
    println("movie ended");
    //theMov.jump(1);
    theMov.stop();
    isPlaying = false;
  }
  
  
  // YEESIANG: notice the flickering issue
  theMov.filter(GRAY);
  //theMov.filter(THRESHOLD);
  // theMov.filter(POSTERIZE, 4);

  image(theMov, 0, 0);   
}

void movieEvent(Movie m) { 
  m.read(); 
} 

void keyPressed() {
    if (key == 'p') {
      // toggle pausing
      if (isPlaying) {
        theMov.pause();
      } else {
        theMov.play();
      }
      isPlaying = !isPlaying;
    }
}
