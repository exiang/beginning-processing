Vehicle car;
Vehicle taxi;
ArrayList<Vehicle> cars = new ArrayList<Vehicle>();

void setup() 
{
  size(500, 500);
  // color, xPos, yPos, xSpeed
  car = new Vehicle(color(200,200,200), 0, 100, 1); 
  taxi = new Vehicle(color(255,0,0), 0, 10, 2);
}

void draw() 
{
  background(255);
  
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
  cars.add(new Vehicle(
    color(random(255), random(255), random(255)),
    mouseX, mouseY, random(5)
   ));
}


