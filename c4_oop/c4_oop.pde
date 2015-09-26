Vehicle car;
Vehicle taxi;
Vehicle taxiAmerica;

ArrayList<Vehicle> listOfCars = new ArrayList<Vehicle>();

void setup() 
{
  size(500, 500);
  // color, xPos, yPos, xSpeed
  car = new Vehicle(color(200,200,200), 0, 100, 1); 
  listOfCars.add(car);
  
  taxi = new Vehicle(color(255,0,0), 0, 200, 2);
  listOfCars.add(taxi);
  
  taxiAmerica = new Vehicle(color(255,255,0), 0, 300, 1.5);
  listOfCars.add(taxiAmerica);
  
  
  // todo 1: add tyres to vehicle class
  // todo 2: use arraylist and for loop to create more than 1 vehicle (hint: https://processing.org/reference/ArrayList.html)
  // todo 3: add vehicle when user perform a mouse click
}

void draw() 
{
  background(255);
 
  car.drive();
  car.display();
  
  
}


void mouseReleased() 
{
  
}

