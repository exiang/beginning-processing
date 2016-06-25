Vehicle car;
Vehicle taxi;
Vehicle taxiAmerica;
Vehicle joshuaCar;

ArrayList<Vehicle> listOfVehicles = new ArrayList<Vehicle>();
boolean isPause = false;
PImage background, iCar;

void setup() 
{
  size(800, 600, P3D);
  background = loadImage("background.jpg");
  iCar = loadImage("car-top-view.png");
  
  // color, xPos, yPos, xSpeed
  car = new Vehicle(color(200,200,200), 0, 100, 1, iCar); 
  listOfVehicles.add(car);
  
  taxi = new Vehicle(color(255,0,0), 0, 200, 2, iCar);
  listOfVehicles.add(taxi);
  
  taxiAmerica = new Vehicle(color(255,255,0), 0, 300, 3, iCar);
  listOfVehicles.add(taxiAmerica);
  
  joshuaCar = new Vehicle(color(0,0,255), 0, 400, 10, iCar);
  listOfVehicles.add(joshuaCar);

  //println(listOfVehicles.size());
  
  // todo 1: add tyres to vehicle class
  // todo 2: use arraylist and for loop to create more than 1 vehicle (hint: https://processing.org/reference/ArrayList.html)
  // todo 3: add vehicle when user perform a mouse click
}

void draw() 
{
  background(255);
 imageMode(CENTER);
 tint(color(255,255,255), 255);
 image(background, 400, 300, 800, 600);
 
 for(int i=0; i<listOfVehicles.size(); i++)
 {
    if(!isPause)
    { 
      listOfVehicles.get(i).drive();
    }
    listOfVehicles.get(i).displayReal();
 }
  
  
}


void mouseReleased() 
{
  Vehicle tmpCar = new Vehicle(color(random(50,250), random(50,255), random(50,250)), mouseX, mouseY, random(6,60), iCar);
  listOfVehicles.add(tmpCar);
}

void keyPressed() 
{
  if (key == ' ') 
  {
    isPause = !isPause;
  }
}

