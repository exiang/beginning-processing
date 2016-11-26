int i;
int bar1Width = 50; int bar1Color=255;
int bar2Width = 80; int bar2Color=100;

int[] barWidth = {50, 80, 60, 120, 40, 10, 200, 190, 200};
int[] barColor = {255, 100, 50, 0, 60, 120, 160, 200, 255};


void setup() 
{
  size(600, 600);
  
  // todo 1: use array to reimplement this code, output should remain the same
  // todo 2: set different grayscale for each bar using 2D array
  // todo 3: instead of grayscale color, use RGB color (4D array)
}

void draw()
{
  background(255,255,0);

  for(int i=0; i<barWidth.length; i++)
  {
    rect(0, 20*i, barWidth[i], 20);
  }
    
}