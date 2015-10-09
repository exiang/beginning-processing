import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A list for all of our rectangles
ArrayList<Box> boxes;
ArrayList<Boundary> boundaries;

Box2DProcessing box2d;
int screenW = 400;
int screenH = 300;
int borderWeight = 4;

void setup() 
{
  size(screenW,screenH);
  smooth();
  
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();
  
  // Create ArrayLists
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
  Boundary brLeft = new Boundary(0, 0, borderWeight, screenH*2);
  Boundary brRight = new Boundary(screenW-(borderWeight/2), 0, borderWeight/2, screenH*2);
  Boundary brBottom = new Boundary(0, screenH-(borderWeight/2), screenW*2, borderWeight/2);
  boundaries.add(brLeft); boundaries.add(brRight); boundaries.add(brBottom);
}

void draw() 
{
  background(255);
  
  box2d.step(); 

  // When the mouse is clicked, add a new Box object
  if (mousePressed) {
    Box p = new Box(mouseX, mouseY);
    boxes.add(p);
  }

  // Display all the boxes
  for (Box b: boxes) 
  {
    b.display();
  }
  
  for (Boundary br: boundaries) 
  {
    br.display();
  }
}
