/* 
Thisi is an open source code release by Tan Yee Siang, aka exiang.
Feel free to use it for educational purposes.
Please write to me to ask for permission if you like to use it in commercial.
My email address is exiang83 at yahoo dot com
More information can be acquired from here: https://github.com/exiang/beginning-processing
Use the code at your own risk :)
*/

class Puppet 
{ 
  int xPos, yPos;
  int xHead, yHead, wHead, hHead, rHead;
  int xTorso, yTorso, wTorso, hTorso;
  int xLeftHand, yLeftHand, wLeftHand, hLeftHand, rLeftHand;
  int xLeftLeg, yLeftLeg, wLeftLeg, hLeftLeg, rLeftLeg;
  int xRightHand, yRightHand, wRightHand, hRightHand, rRightHand;
  int xRightLeg, yRightLeg, wRightLeg, hRightLeg, rRightLeg;

  Puppet (int x, int y) 
  {  
    xPos = x; 
    yPos = y; 
    
    xTorso = xPos;
    yTorso = yPos;
    wTorso = 150;
    hTorso = 150;
    
    xHead = xPos;
    yHead = yPos-75;
    wHead = 100;
    hHead = 150;    
    rHead = 0;
    
    xLeftHand = xPos-80;
    yLeftHand = yPos-75;
    wLeftHand = 20;
    hLeftHand = 80;
    rLeftHand = 30;
    
    xLeftLeg = xPos-45;
    yLeftLeg = yPos+75;
    wLeftLeg = 40;
    hLeftLeg = 120;    
    rLeftLeg = 0;
    
    xRightHand = xPos+80;
    yRightHand = yPos-75;
    wRightHand = 20;
    hRightHand = 80;
    rRightHand = -30;
    
    xRightLeg = xPos+45;
    yRightLeg = yPos+75;
    wRightLeg = 40;
    hRightLeg = 120;    
    rRightLeg = 0;
  } 
  
  void draw() 
  { 
    stroke(0,0,255);
    strokeWeight(3);
    
    drawLeftHand();
    drawRightHand();
    drawLeftLeg();
    drawRightLeg();
    drawTorso();
    drawHead();
  } 
  
  void drawHead()
  {
    ellipseMode(CENTER);
    pushMatrix();
    translate(xHead, yHead);
    rotate(radians(rHead));
    ellipse(0, yHead, wHead, -hHead);
    popMatrix();
    
  }
  
  void drawLeftHand()
  {
    rectMode(CENTER);  
    pushMatrix();
   translate(xLeftHand, yLeftHand);
    rotate(radians(rLeftHand));
    rect(0, hLeftHand/2, wLeftHand, hLeftHand);
    popMatrix();
  }
  
  void drawLeftLeg()
  {
    rectMode(CENTER);  
    pushMatrix();
    translate(xLeftLeg, yLeftLeg);
    rotate(radians(rLeftLeg));
    rect(0, hLeftLeg/2, wLeftLeg, hLeftLeg);
    popMatrix();
  }
  
  void drawRightHand()
  {
    rectMode(CENTER);  
    pushMatrix();
    translate(xRightHand, yRightHand);
    rotate(radians(rRightHand));
    rect(0, hRightHand/2, wRightHand, hRightHand);
    popMatrix();
  }
  
  void drawRightLeg()
  {
    rectMode(CENTER);  
    pushMatrix();
    translate(xRightLeg, yRightLeg);
    rotate(radians(rRightLeg));
    rect(0, hRightLeg/2, wRightLeg, hRightLeg);
    popMatrix();
  }
  
  void drawTorso()
  {
    rectMode(CENTER);
    rect(xTorso, yTorso, wTorso, hTorso);
  }
  
  void updateHead(int r)
  {
    rHead = r;
  }
  
  void updateLeftHand(int r)
  {
    rLeftHand = r;
  }
  
  void updateLeftLeg(int r)
  {
    rLeftLeg = r;
  }
  void updateRightHand(int r)
  {
    rRightHand = r;
  }
  
  void updateRightLeg(int r)
  {
    rRightLeg = r;
  }
  
  void move(int x, int y)
  {
    xPos = x;
    yPos = y;
  }
} 
