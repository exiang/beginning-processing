Mover ball1, ball2;

void setup() 
{
  size(640,360);
  background(255);
  
  ball1 = new Mover(100, 100, 2, 5);
  ball2 = new Mover(200, 200, 3, 1);
}

void draw() 
{
  background(255);
  
  ball1.move();
  ball1.checkEdges();
  ball1.display();
  
  
  ball2.move();
  ball2.checkEdges();
  ball2.display();
}

