int screenWidth = 640, screenHeight = 480;
int totalSnow = 500;

Snow s[] = new Snow[totalSnow];
double x, y, d, a, k, ac;
double droppingSpeed;
int rotationSpeed; // 1 to 360

PImage bg;

void setup()
{
  // background
  size(screenWidth, screenHeight, P3D);
  background(0);
  
  bg = loadImage("bg.jpg")
 
  // general
  frameRate(30);

  // snow
  // variables that will modify the falling snow
  droppingSpeed = 1 + Math.random() * 2;
  rotationSpeed = 3;
  
  // create  and giving each snowflake unique characteristics
  for(int i=0; i<totalSnow; i++)
  {  
    x = random(-50, screenWidth+50);
    y = random(-100, 1000) % screenHeight;
    d = 4 + random(0, 5);
    k = PI + Math.random() * PI;
    ac = random(0.01, 1);
    s[i] = new Snow(x, y, d, 100, k, ac);
  }
  

}

void draw()
{
  // draw background
  background(0);
  
  image(bg, 0, 0);
  
  if(keyPressed) 
  {
    if(key == '+')
    {
      droppingSpeed++;
    }
    if(key == '-')
    {
      droppingSpeed--;
    }
  }

  for(int i=0; i<totalSnow; i++)
  {  
    s[i]._r += (s[i]._k/180)*Math.PI;
    s[i]._x -= Math.cos(s[i]._r) + ((mouseX-(screenWidth/2))/50) * 2;
    s[i]._y += droppingSpeed + s[i]._ac;
    s[i]._rotation += rotationSpeed;
    
    // slowly increase the transparency as it reaching bottom
    if(s[i]._y > screenHeight - 100)
    {
      s[i]._alpha -= 10; 
    }
    
    // remove clips when they misbehave (overstep boundaries)
    if (s[i]._x>(screenWidth+50)) 
    {
        s[i]._x = -45;
        s[i]._y = Math.random()*screenHeight*2;
    }
    
    if (s[i]._x<-50) 
    {
        s[i]._x = screenWidth+45;
        s[i]._y = Math.random()*screenHeight*2;
    }
    
    if (s[i]._y>=screenHeight) 
    {
        s[i]._y = -50;
        s[i]._x = -screenWidth+Math.random()*(3*screenWidth);
        s[i]._alpha = s[i].generateRandomAlpha(s[i]._dimension);
    }
  
    s[i].display();
  }
  
  
}

public void stop() 
{
  super.stop();
}


class Snow
{
  double _x, _y;
  double _r, _k, _ac;
  double _dimension, _alpha, _rotation;
  PImage _snowFlakeImage;
  
  Snow(double x, double y, double d, double a, double k, double ac)
  {
    _x = x; _y = y; _dimension = d; _alpha = this.generateRandomAlpha(d); _r=0; _k=k; _ac=ac; _rotation=0;
  }
  
  void display()
  {
    // using ellipse as snow
    noStroke();
    smooth();
    fill(255, 255, 255, (int)_alpha);
    ellipse((float)_x, (float)_y, (float)_dimension, (float)_dimension);
  }
  
  float generateRandomAlpha(double dimension)
  {
    return (150 + random((float)1, (float)dimension*10)) % 255;
  }
}


