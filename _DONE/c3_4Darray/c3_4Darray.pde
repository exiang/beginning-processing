int[][] x = 
{ 
  {50, 255, 0, 0}, 
  {61, 0, 255, 0}, 
  {83, 0, 0, 255}, 
  {69, 0,255,255},
  {71, 255, 0, 255}, 
  {50, 255, 255, 0}, 
  {29, 100, 200, 0}, 
  {31, 51, 14, 23},
  {17, 102, 234,22}, 
  {39, 23, 204, 12} 
};

void setup() 
{
  size(100, 100);
}

void draw()
{
  fill(0);
  
  for (int i = 0; i < x.length; i++) 
  {
    fill(x[i][1], x[i][2], x[i][3]);
    rect(0, i*10, x[i][0], 8);
  }
}
