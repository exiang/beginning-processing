/* 
Thisi is an open source code release by Tan Yee Siang, aka exiang.
Feel free to use it for educational purposes.
Please write to me to ask for permission if you like to use it in commercial.
My email address is exiang83 at yahoo dot com
More information can be acquired from here: https://github.com/exiang/beginning-processing
Use the code at your own risk :)
*/

// detect the user torso position and label him with a user id

import SimpleOpenNI.*;

SimpleOpenNI context;

void setup()
{
  size(640, 480, P3D);
  
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
  image(context.depthImage(), 0, 0);
  
  // Get number of users in scene
  int userCount = context.getNumberOfUsers();
  
  textAlign(LEFT, LEFT);
  text("Users: " + userCount, 20, 20);

  // Draw ellipse at each user's position
  for (int userId=1; userId<=userCount; userId++)
  {
    // Calculate position
    PVector world_pos = new PVector();
    PVector proj_pos = new PVector();
    context.getCoM(userId, world_pos);
    context.convertRealWorldToProjective(world_pos, proj_pos);

    // Draw ellipse
    pushMatrix();
    translate(proj_pos.x, proj_pos.y, 0);
    fill(255, 0, 100);
    ellipse(0, 0, 20, 20);
    
    // Draw user id
    textAlign(CENTER, CENTER);
    fill(255);
    text(userId, 0, 0);
    popMatrix();
  }
}
