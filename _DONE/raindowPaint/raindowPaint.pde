float c;
int pppmouseX, pppmouseY, ppmouseX, ppmouseY;

void setup() 
{
  
  size(640, 360);
  colorMode(RGB);
  background(0);
  
  smooth(2);
}

void draw() 
{
  colorMode(HSB);
  if (c >= 255)  c=0;  else  c++;
  stroke(c, 255, 255);
  strokeWeight(4);
  
  if(mousePressed)
  {
    beginShape();
    curveVertex(pppmouseX,pppmouseY);
    curveVertex(ppmouseX,ppmouseY);
    curveVertex(pmouseX,pmouseY);
    curveVertex(mouseX,mouseY);
    endShape();
  }
  
  pppmouseX = ppmouseX;
  pppmouseY = ppmouseY;
  ppmouseX = pmouseX;
  ppmouseY = pmouseY;
}