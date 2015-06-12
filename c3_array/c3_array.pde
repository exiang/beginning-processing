int[][] x = {
  // bar 1  
  {50, 255, 0, 0}, 
  // bar 2
  {61, 0, 128, 0}, 
  {83, 0, 255, 0}, 
  {69, 10, 30, 230}, 
  {71, 12, 31, 45}, 
  {50, 190, 123, 0}, 
  {29, 10, 22, 230}, 
  {31, 110, 102, 44}, 
  {17, 90, 202, 255}, 
  {39, 255, 134, 62}
};

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
  
  
  for(int i=0; i<10; i++)
  {
    fill(x[i][1], x[i][2], x[i][3]);
     rect(0, i*10, x[i][0], 8);
  }
}

