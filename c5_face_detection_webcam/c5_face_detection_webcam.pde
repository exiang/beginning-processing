import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

Capture cam;

OpenCV opencv;
Rectangle[] faces;

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
    cam =  new Capture(this, 640, 480);
    cam.start();     
  } 
  
  // todo 1: this example load a preset image and auto recognize. change it to load from webcam
  opencv = new OpenCV(this, 640, 480);
  size(opencv.width, opencv.height);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
}

void draw() 
{
  if (cam.available() == true) 
  {
    cam.read();
  }
  
  opencv.loadImage(cam);
  
  image(cam, 0, 0);
  
  //image(opencv.getInput(), 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}

void captureEvent(Capture c) 
{
  c.read();
}
