String currentPage = "index";

void start()
{
  size(640, 480);
}

void draw()
{
  background(255);
  
  if(currentPage=="page1")
    drawPage1();
  else if(currentPage=="page2")
    drawPage2();
  else if(currentPage=="page3")
    drawPage3();
  else drawIndex();
}

void drawIndex()
{
  fill(0);
  textSize(32); 
  textAlign(CENTER);
  text("Press 1,2 or 3 to switch page", width/2, height/2);
}

void drawPage1()
{
  background(255,0,0);
  fill(0);
  textSize(32); 
  textAlign(CENTER);
  text("Page 1", width/2, height/2);
}

void drawPage2()
{
  background(0,255,0);
  fill(0);
  textSize(32); 
  textAlign(CENTER);
  text("Page 2", width/2, height/2);
}

void drawPage3()
{
  background(0,0,255);
  fill(0);
  textSize(32); 
  textAlign(CENTER);
  text("Page 3", width/2, height/2);
}

void keyReleased() 
{
  if(key == '1')
    currentPage = "page1";
  else if(key == '2')
    currentPage = "page2";
  else if(key == '3')
    currentPage = "page3";
  else 
    currentPage = "index";
}
