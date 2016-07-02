import g4p_controls.*;
GSlider slider1, slider2;
int posX, posY = 0;

public void setup() 
{
  size(500, 300);
  G4P.setGlobalColorScheme(GCScheme.PURPLE_SCHEME);
  
  posX = width/2;
  posY = height/2;
  
  slider1 = new GSlider(this, 10, 10, 200, 20, 20);
  slider1.addEventHandler(this, "eventSlider");
  slider1.setLimits(0, width);
  slider1.setValue(posX);
  
  slider2 = new GSlider(this, 10, 40, 200, 20, 20);
  slider2.addEventHandler(this, "eventSlider");
  slider2.setLimits(0, height);
  slider2.setValue(posY);
  
}

public void draw() 
{
  background(0, 0, 0);
  fill(255);
  ellipse(posX, posY, 55, 55);
}


public void eventSlider(GSlider source, GEvent event) 
{
  posX = slider1.getValueI();
  posY = slider2.getValueI();
}

