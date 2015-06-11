import processing.video.*;

Capture cam;

void setup() 
{
  size(640, 480);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) 
  {
    println("There are no cameras available for capture.");
    exit();
  } 
  else 
  {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() 
{
  if (cam.available() == true) 
  {
    cam.read();
  }
  
  // todo 1: mirror your image to fix some front web cam issue (hint: http://forum.processing.org/one/topic/mirroring-a-webcam-in-a-sketch.html)
  image(cam, 0, 0);
}
