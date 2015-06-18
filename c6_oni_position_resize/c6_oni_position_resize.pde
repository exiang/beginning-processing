/* 
Thisi is an open source code release by Tan Yee Siang, aka exiang.
Feel free to use it for educational purposes.
Please write to me to ask for permission if you like to use it in commercial.
My email address is exiang83 at yahoo dot com
More information can be acquired from here: https://github.com/exiang/beginning-processing
Use the code at your own risk :)
*/

// reposition by scalling into a wide screen

import SimpleOpenNI.*;

SimpleOpenNI context;
PImage tmp, newy;

void setup()
{
  size(1280, 600);
  
  // Enable Kinect
  context = new SimpleOpenNI(this);
  
  // or
  // Enable and load recording in data folder
  //context = new SimpleOpenNI(this, "Kinect_02.oni");
  
  context.setMirror(false);
  context.enableDepth();

  // Enable skeleton generation for all joints
  context.enableUser();

  noStroke();
}

void draw()
{
  background(0);

  // Update Kinect
  context.update();
  
  // Draw depth image
  tmp = context.depthImage();
  newy = tmp.get(0, 0, 640, 480); 
  newy.resize(1280, 600);
  image(newy, 0, 0);
  
  // Get number of users in scene
  int userCount = context.getNumberOfUsers();
  
  textSize(26);
  fill(255, 0, 0);
  textAlign(LEFT, LEFT);
  text("Users: " + userCount, 20, 20);
  
  PVector world_pos = new PVector();
  PVector proj_pos = new PVector();
  context.getCoM(userCount, world_pos);
  context.convertRealWorldToProjective(world_pos, proj_pos);

  int newX = int(map(proj_pos.x, 0, 640, 0, width));
  text("x: " + newX, 20, 40);
  int newZ = (int)proj_pos.z;
  text("z: " + newZ, 20, 60);
}
