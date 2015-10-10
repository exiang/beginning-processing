import g4p_controls.*;

int bgColor = 255;
Vehicle car;
Vehicle taxi;
ArrayList<Vehicle> cars = new ArrayList<Vehicle>();

void setup() 
{
  size(500, 500);
  // color, xPos, yPos, xSpeed
  car = new Vehicle(color(200,200,200), 0, 100, 1); 
  taxi = new Vehicle(color(255,0,0), 0, 10, 2);
  createGUI();
  customGUI();
}

void draw() 
{
  background(bgColor);
  
  car.drive();
  car.display();
  
  taxi.drive();
  taxi.display();
  
  for (int i=0; i<cars.size(); i++) 
  {
    cars.get(i).drive();
    cars.get(i).display();
  }
}

void mouseReleased() 
{
  /*cars.add(new Vehicle(
    color(random(255), random(255), random(255)),
    mouseX, mouseY, random(5)
   ));*/
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

public void reset()
{
  bgColor = round(random(0, 255));
}
