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
    
    // todo3: print in the following pattern:
    //     *
    //    **
    //   ***
    //  ****
    // *****
    int spaces = 5-(i+1);
    
    for(int k=1; k<=spaces; k++)
    {
      print(" ");
    }
    
    for(int j=1; j<=5-spaces; j++)
    {
      print("*");
    }
    
    println();
  }
}
