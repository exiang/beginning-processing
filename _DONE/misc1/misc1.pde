import sprites.utils.*;
import sprites.maths.*;
import sprites.*;
import g4p_controls.*;

GButton btnAdd, btnAdd2, btnAdd3;
StopWatch sw = new StopWatch();
ArrayList<Sprite> sprites = new ArrayList<Sprite>();
ArrayList<Vehicle> listOfVehicles = new ArrayList<Vehicle>();
PImage iCar;

void setup()
{
  size(640, 480, P3D);
  
  iCar = loadImage("car-top-view.png");
  
  btnAdd = new GButton(this, 10, 10, 100, 20);
  btnAdd.setText("ADD Tourist!");
  btnAdd.addEventHandler(this, "btnAddClick");
  
  btnAdd2 = new GButton(this, 120, 10, 100, 20);
  btnAdd2.setText("ADD Aunty!");
  btnAdd2.addEventHandler(this, "btnAdd2Click");
  
  btnAdd3 = new GButton(this, 240, 10, 100, 20);
  btnAdd3.setText("ADD Vehicle!");
  btnAdd3.addEventHandler(this, "btnAdd3Click");
}

void draw()
{
  background(244);
  float elapsedTime = (float) sw.getElapsedTime();

  for(int i=0; i<listOfVehicles.size(); i++)
  {
    listOfVehicles.get(i).drive();
    listOfVehicles.get(i).displayReal();
  }
  
  noTint();
  for(int i=0; i<sprites.size(); i++)
  {
    Sprite sp = sprites.get(i);
    sp.setX(sp.getX()-1);
    sp.update(elapsedTime);
    sp.draw();
  }
}

public void btnAddClick(GButton source, GEvent event) 
{
  Sprite tourist = new Sprite(this, "tourist.png", 4, 1, 99);
  tourist.setXY(width, height/2);
  tourist.setFrameSequence(0, 4, 0.5f);
  sprites.add(tourist); 
}

public void btnAdd2Click(GButton source, GEvent event) 
{
  Sprite aunty = new Sprite(this, "prayingAunty.png", 2, 1, 99);
  aunty.setXY(width, height/2);
  aunty.setFrameSequence(0, 2, 0.5f);
  sprites.add(aunty); 
}

public void btnAdd3Click(GButton source, GEvent event)
{
  Vehicle tmpCar = new Vehicle(color(random(50,250), random(50,255), random(50,250)), 0, random(0, height), random(1,2), iCar);
  listOfVehicles.add(tmpCar);
}
