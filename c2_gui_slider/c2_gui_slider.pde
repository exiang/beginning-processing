import g4p_controls.*;
GSlider slider1;
int bgRed = 0;

public void setup() 
{
  size(500, 300);
  G4P.setGlobalColorScheme(GCScheme.PURPLE_SCHEME);
  
  slider1 = new GSlider(this, 10, 10, 200, 20, 20);
  slider1.addEventHandler(this, "eventSlider");
  slider1.setLimits(0, 255);
  slider1.setValue(0);
}

public void draw() 
{
  background(bgRed, 0, 0);
  // Draw tab order
  stroke(0);
  strokeWeight(2);
}


public void eventSlider(GSlider source, GEvent event) 
{
  bgRed = source.getValueI();
  println(bgRed);
}

