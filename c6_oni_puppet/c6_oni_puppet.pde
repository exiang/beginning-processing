/* 
Thisi is an open source code release by Tan Yee Siang, aka exiang.
Feel free to use it for educational purposes.
Please write to me to ask for permission if you like to use it in commercial.
My email address is exiang83 at yahoo dot com
More information can be acquired from here: https://github.com/exiang/beginning-processing
Use the code at your own risk :)
*/

import SimpleOpenNI.*;

SimpleOpenNI  context;
color[]       userClr = new color[]{ color(255,0,0),
                                     color(0,255,0),
                                     color(0,0,255),
                                     color(255,255,0),
                                     color(255,0,255),
                                     color(0,255,255)
                                   };
PVector com = new PVector();                                   
PVector com2d = new PVector();                                   

Puppet p1;

void setup()
{
  size(640,480);
  
  context = new SimpleOpenNI(this);
  if(context.isInit() == false)
  {
     println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
     exit();
     return;  
  }
  
  // enable depthMap generation 
  context.enableDepth();
   
  // enable skeleton generation for all joints
  context.enableUser();
 
  p1 = new Puppet(0, 0);
  p1.move(500, 280);

  stroke(0,0,255);
  strokeWeight(3);
  smooth();  
}

void draw()
{
  background(255,255,255);
  // update the cam
  context.update();
  
  // draw depthImageMap
  image(context.depthImage(),0,0);
  //image(context.userImage(),0,0);
  
  
  // draw the skeleton if it's available
  int[] userList = context.getUsers();
  for(int i=0;i<userList.length;i++)
  {
    if(context.isTrackingSkeleton(userList[i]))
    {
      stroke(userClr[ (userList[i] - 1) % userClr.length ] );
      drawSkeleton(userList[i]);
    }      
      
    // draw the center of mass
    /*if(context.getCoM(userList[i],com))
    {
      context.convertRealWorldToProjective(com,com2d);
      stroke(100,255,0);
      strokeWeight(1);
      beginShape(LINES);
        vertex(com2d.x,com2d.y - 5);
        vertex(com2d.x,com2d.y + 5);

        vertex(com2d.x - 5,com2d.y);
        vertex(com2d.x + 5,com2d.y);
      endShape();
      
      fill(0,255,100);
      text(Integer.toString(userList[i]),com2d.x,com2d.y);
    }*/
  }  
   
  pushMatrix();
  translate(p1.xPos, p1.yPos);
  p1.draw();  
  popMatrix();
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  p1.updateHead(joint2Degree(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_HEAD));
  p1.updateLeftHand(joint2Degree(userId, SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_LEFT_SHOULDER));
  p1.updateRightHand(joint2Degree(userId, SimpleOpenNI.SKEL_RIGHT_HAND, SimpleOpenNI.SKEL_RIGHT_SHOULDER));
  p1.updateLeftLeg(joint2Degree(userId, SimpleOpenNI.SKEL_LEFT_FOOT, SimpleOpenNI.SKEL_LEFT_HIP));
  p1.updateRightLeg(joint2Degree(userId, SimpleOpenNI.SKEL_RIGHT_FOOT, SimpleOpenNI.SKEL_RIGHT_HIP));

  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  

}

// -----------------------------------------------------------------
// SimpleOpenNI events

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  
  curContext.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}

void onStartCalibration(int userId)
{
  println("Beginning Calibration - userId: " + userId);
}
 
// when calibaration ends - successfully or unsucessfully 
void onEndCalibration(int userId, boolean successfull)
{
  println("Calibration of userId: " + userId + ", successfull: " + successfull);
 
  if (successfull) 
  { 
    println("  User calibrated !!!");
 
    // begin skeleton tracking
    context.startTrackingSkeleton(userId); 
  } 
  else 
  { 
    println("  Failed to calibrate user !!!");
 
    // Start pose detection
    //context.startPoseDetection("Psi", userId);
  }
}


void keyPressed()
{
  switch(key)
  {
  case ' ':
    context.setMirror(!context.mirror());
    break;
  }
}  

int joint2Degree(int userId, int centerJoint, int targetJoint)
{
  // target
  PVector targetJointPos = new PVector();
  context.getJointPositionSkeleton(userId, targetJoint, targetJointPos);
  PVector targetProjPos = new PVector(); 
  context.convertRealWorldToProjective(targetJointPos, targetProjPos);
  
  // center
  PVector centerJointPos = new PVector();
  context.getJointPositionSkeleton(userId, centerJoint, centerJointPos);
  PVector centerProjPos = new PVector(); 
  context.convertRealWorldToProjective(centerJointPos, centerProjPos);
  
  int a = degree2Point(centerProjPos, targetProjPos);
  
  print("center: "+centerJoint+" x:"+int(centerProjPos.x)+" y: "+int(centerProjPos.y));
  print(" | ");
  print("target: "+targetJoint+": x:"+int(targetProjPos.x)+" y: "+int(targetProjPos.y));
  print(" | ");
  print("angle: "+a);
  println();

  return a;
}

int degree2Point(PVector centerPt, PVector targetPt)
{
    // calculate the angle theta from the deltaY and deltaX values
    // (atan2 returns radians values from [-PI,PI])
    // 0 currently points EAST.  
    // NOTE: By preserving Y and X param order to atan2,  we are expecting 
    // a CLOCKWISE angle direction.  
    float theta = atan2(targetPt.y - centerPt.y, targetPt.x - centerPt.x);

    // rotate the theta angle clockwise by 90 degrees 
    // (this makes 0 point NORTH)
    // NOTE: adding to an angle rotates it clockwise.  
    // subtracting would rotate it counter-clockwise
    theta += PI/2.0;

    // convert from radians to degrees
    // this will give you an angle from [0->270],[-180,0]
    int angle = int(degrees(theta));

    // convert to positive range [0-360)
    // since we want to prevent negative angles, adjust them now.
    // we can assume that atan2 will not return a negative value
    // greater than one partial rotation
    if (angle < 0) {
        angle += 360;
    }

    return angle;
}

