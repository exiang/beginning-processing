import sprites.utils.*;

String currentPage = "index";
StopWatch sw = new StopWatch();
StopWatch sw2 = new StopWatch();

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
  
  textSize(15);
  float runtime = (float) sw.getRunTime();
  text(runtime, width/2, height/2+100);
}

void drawPage1()
{
  background(255,100,100);
  fill(0);
  textSize(32); 
  textAlign(CENTER);
  text("Page 1", width/2, height/2);
  
  textSize(15);
  float runtime = (float) sw.getRunTime();
  text(int(runtime), width/2, height/2+100);
  
  if(int(runtime)>=5)
  {
    changePage("page2");
  }
}

void drawPage2()
{
  background(100,255,100);
  fill(0);
  textSize(32); 
  textAlign(CENTER);
  text("Page 2", width/2, height/2);
  
  textSize(15);
  float runtime = (float) sw.getRunTime();
  text(int(runtime), width/2, height/2+100);
}

void drawPage3()
{
  background(100,100,255);
  fill(0);
  textSize(32); 
  textAlign(CENTER);
  text("Page 3", width/2, height/2);
  
  textSize(15);
  float runtime = (float) sw.getRunTime();
  text(int(runtime), width/2, height/2+100);
}

void changePage(String pageId)
{
  sw.reset();
  currentPage = pageId;
}

void keyReleased() 
{
  if(key == '1')
    changePage("page1");
  else if(key == '2')
    changePage("page2");
  else if(key == '3')
    changePage("page3");
  else 
    changePage("index");
}
