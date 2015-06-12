// http://forum.processing.org/two/discussion/2792/kinect-skeleton-tracking-robot-arm-questions-/p1

int armAngle = 0;
/* Where upper left of robot appears on screen */
final int ROBOT_X = 0;
final int ROBOT_Y = 0;

/* The robot's midpoint and arm pivot points */
final int MIDPOINT_X = 39;
final int LEFT_PIVOT_X = 12;
final int RIGHT_PIVOT_X = 66;
final int PIVOT_Y = 32;

float leftArmAngle = 0.0;
float rightArmAngle = 0.0;

void setup()
{
  size(200, 200);
  background(255);
  smooth();
  //drawRobot();
}

void draw()
{
  float mX;
  float mY;
  
  background(255);
  pushMatrix();
  translate(ROBOT_X, ROBOT_Y); // place robot so arms are always on screen
  if (mousePressed)
  {
    mX = mouseX - ROBOT_X;
    mY = mouseY - ROBOT_Y;
    if (mX < MIDPOINT_X) // left side of robot
    {
      leftArmAngle = atan2(mY - PIVOT_Y, mX - LEFT_PIVOT_X)
      - HALF_PI;
    }
    else
    {
      rightArmAngle = atan2(mY - PIVOT_Y, mX - RIGHT_PIVOT_X)
      - HALF_PI;
   }
  }
  drawRobot();
  
  popMatrix();
}

void drawRobot()
{
  noStroke();
  fill(38, 38, 200);
  rect(20, 0, 38, 30); // head
  rect(14, 32, 50, 50); // body
  drawLeftArm();
  drawRightArm();
  rect(22, 84, 16, 50); // left leg
  rect(40, 84, 16, 50); // right leg
  
  fill(222, 222, 249);
  ellipse(30, 12, 12, 12); // left eye
  ellipse(47, 12, 12, 12);  // right eye
}

void drawLeftArm()
{
  pushMatrix();
  translate(12, 32);
  //rotate(radians(135));
  //rotate(radians(armAngle));
  rotate(leftArmAngle);
  rect(-12, 0, 12, 37);
  popMatrix();
}

void drawRightArm()
{
  pushMatrix();
  translate(66, 32);
  //rotate(radians(135));
  //rotate(radians(-armAngle));
  rotate(rightArmAngle);
  rect(0, 0, 12, 37);
  popMatrix();
}

