int i;
int bar1Width = 50; int bar1Color=255;
int bar2Width = 80; int bar2Color=100;

int[] barWidth = {50, 80, 60, 120, 40, 10, 200, 190};
int[] barColor = {255, 100, 50, 0, 60, 120, 160, 200};

int[][] bar = {
  // bar 1
  {50,   255, 100, 100},
  // bar 2
  {80,   100, 255, 100},
  // bar 3
  {60,   100, 100, 255},
  // bar 4
  {120,  255, 255, 100}
};

ArrayList<Bar> listBar = new ArrayList<Bar>();

void setup() 
{
  size(600, 600);
  
  listBar.add(new Bar(50,   255, 100, 100));
  listBar.add(new Bar(80,   100, 255, 100));
  listBar.add(new Bar(60,   100, 100, 255));
  listBar.add(new Bar(120,  255, 255, 100));
  
  print((listBar.get(0)).width);
  // todo 1: use array to reimplement this code, output should remain the same
  // todo 2: set different grayscale for each bar using 2D array
  // todo 3: instead of grayscale color, use RGB color (4D array)
}

void draw()
{
  background(255);

  for(int i=0; i<listBar.size(); i++)
  {
    fill(listBar.get(i).red, listBar.get(i).green, listBar.get(i).blue);
    rect(0, i*20, listBar.get(i).width, 20);
  }
    
}

