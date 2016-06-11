Flock flock;
int box_width;
int box_height;
int border_mode;
float max_speed;
int frames_number = 3;
int show_boid_border = 0;
PImage[] ant = new PImage[frames_number];
int ants_limit = 30;
int ants_count = 1;
int ants_init = 20;

void setup() 
{
  size(640, 480, P3D);
  frameRate(30);

  ant[0]  = loadImage("ants1.png");
  ant[1]  = loadImage("ants2.png");
  ant[2]  = loadImage("ants3.png");

  box_width = 300;
  box_height = 300;
  border_mode = 0;
  max_speed = 6.0;

  flock = new Flock();

  // Add an initial set of boids into the system
  for (int i = 0; i < ants_init; i++) 
  {
    flock.addBoid(new Boid(new PVector(random(0, displayWidth), random(0, displayHeight)), max_speed, 0.05f));
  }
  smooth();
}

void draw()
{
  background(250);
  flock.run();
  fill(0, 0);
  if(border_mode == 0){stroke(0,0,255);}else{stroke(0,255,0);}
  rect((width/2)-(box_width/2), (height/2)-(box_height/2), box_width, box_height);
}

// todo: catch boid and place to new location
void mousePressed() 
{
  cursor(HAND);
}

void mouseReleased()
{
  cursor(ARROW);
}

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == UP)
    {
      box_width+=5;
      box_height+=5;
    } 
    else if (keyCode == DOWN) 
    {
      box_width-=5;
      box_height-=5;
    }

  }
  
  // todo: for student, try add ants dynamically

  if (key == ' ') 
  {
    if(border_mode == 0){border_mode = 1;}else{border_mode = 0;}
  }

  if (key == DELETE) 
  {
    flock.clearAll();
  }
  
  if (key == 'b') 
  {
    if(show_boid_border == 0){show_boid_border = 1;}else{show_boid_border = 0;}
  }
}
