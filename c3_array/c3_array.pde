int i;
int x1Width = 50; int x1Color=255;
int x2Width = 80; int x2Color=100;

void setup() 
{
  size(100, 100);
  
  // todo 1: use array to reimplement this code, output should remain the same
  // todo 2: set different grayscale for each bar using 2D array
  // todo 3: instead of grayscale color, use RGB color (4D array)
}

void draw()
{
  background(255,255,0);
  
  i=0;
  fill(x1Color);
  rect(0, i*10, x1Width, 8);
  
  i=1;
  fill(x2Color);
  rect(0, i*10, x2Width, 8);
}

