void setup()
{
  for(int i=0; i<5; i++)
  {
    // todo1: print 50 star using a nested loop
    // todo2: print in the following pattern:
    // *
    // **
    // ***
    // ****
    // *****
    for(int j=1; j<=i+1; j++)
    {
      print("*");
    }
    println();
  }
}
