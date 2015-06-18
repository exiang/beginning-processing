/* 
Thisi is an open source code release by Tan Yee Siang, aka exiang.
Feel free to use it for educational purposes.
Please write to me to ask for permission if you like to use it in commercial.
My email address is exiang83 at yahoo dot com
More information can be acquired from here: https://github.com/exiang/beginning-processing
Use the code at your own risk :)
*/

Puppet p1;
int parts = 12;

void setup()
{
  size(640, 480);
  background(255);
  smooth();
  p1 = new Puppet(0,0);
  p1.move(320, 240);
}

void draw()
{  
  background(255);
  // draw control hint
  for(int i=0; i<parts; i++)
  {
    int y = height/parts * i;
    stroke(128,128,128);
    line(0, y, width, y);
  }
  
  pushMatrix();
  translate(p1.xPos, p1.yPos);
  if (mousePressed)
  {
    int d = int(map(mouseX, 0, 640, 0, 360));
    println(d);
    
    if(mouseY>0 && mouseY<(height/parts)*1)
    {
      p1.updateHead(d);
    }
    else if(mouseY>(height/parts)*1 && mouseY<(height/parts)*2)
    {
      p1.updateLeftHand(d);
    }
    else if(mouseY>(height/parts)*2 && mouseY<(height/parts)*3)
    {
      p1.updateLeftHand(d);
    }
    else if(mouseY>(height/parts)*3 && mouseY<(height/parts)*4)
    {
      p1.updateRightHand(d);
    }
    else if(mouseY>(height/parts)*4 && mouseY<(height/parts)*5)
    {
      p1.updateRightHand(d);
    }
    else if(mouseY>(height/parts)*5 && mouseY<(height/parts)*6)
    {
      p1.updateLeftLeg(d);
    }
    else if(mouseY>(height/parts)*6 && mouseY<(height/parts)*7)
    {
      p1.updateLeftLeg(d);
    }
    else if(mouseY>(height/parts)*7 && mouseY<(height/parts)*8)
    {
      p1.updateRightLeg(d);
    }
    else if(mouseY>(height/parts)*8 && mouseY<(height/parts)*9)
    {
      p1.updateRightLeg(d);
    }
    else if(mouseY>(height/parts)*9 && mouseY<(height/parts)*10)
    {
      p1.updateTorso(d);
    }
    else if(mouseY>(height/parts)*10 && mouseY<(height/parts)*11)
    {
      p1.updateX(mouseX);
    }
    else if(mouseY>(height/parts)*11 && mouseY<(height/parts)*12)
    {
      p1.updateY(int(map(mouseX, 0, width, 0, height)));
    }
    
  }
  p1.draw();  
  fill(0, 255, 0);
  ellipse(0, 0, 10, 10);
  popMatrix();
  
  
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == LEFT) 
    {
      p1.xPos -= 2;
    } 
    else if (keyCode == RIGHT) 
    {
      p1.xPos += 2;
    } 
  } else {

  }
}
