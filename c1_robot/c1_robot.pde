void setup() 
{
  size(1000, 1000);
}

void draw() 
{
  background(255);
  //translate(0, -100);
  //scale(0.5, 0.5);
  
  // head
  fill(37, 205, 247);
  rect(300, 125, 200, 150);
  fill(255,73,73);
  ellipse(400,200,100,100);
  // body
  fill(33, 120, 160);
  rect(200, 275, 400, 200);
  // hands
  fill(255, 130, 190);
  rectMode(CORNERS);
  rect(200, 275, 50, 325);
  rect(600, 275, 750, 325);
  // legs
  fill(255, 93, 0);
  rectMode(CORNER);
  rect(200, 475, 50, 200);
  rect(550, 475, 50, 200);
  
  
}
