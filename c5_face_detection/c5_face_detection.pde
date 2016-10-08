import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;
ArrayList<PImage> smileys = new ArrayList<PImage>();


void setup() {
  opencv = new OpenCV(this, "1408.jpg");
  size(1200, 800);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
  
  // todo 1: take a selfie of the class and replace the test.jpg, observe how well the algorithm works
  // todo 2: overlay a smiley image to of all faces
}

void draw() {
  image(opencv.getInput(), 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  
  for (int i = 0; i < faces.length; i++) 
  {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);

  }
}