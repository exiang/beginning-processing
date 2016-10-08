// Need G4P library
import g4p_controls.*;

int counter = 0;

public void setup(){
  size(480, 320, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  background(230);
  
  for(int i=0; i<counter; i++)
  {
    ellipse(random(0,width), random(0,height), 10, 10);
  }
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){
}