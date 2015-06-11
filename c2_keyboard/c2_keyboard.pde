color bgColor = color(255, 255, 255); 
void setup() 
{
  size(100, 100);
}

void draw() 
{
  background(bgColor);
}

void keyPressed() 
{
  bgColor = color(random(255), random(255), random(255)); 
  
  // todo 1: change color when 'b' key is pressed (hint: https://processing.org/reference/key.html)
  // todo 2: instead of key press, trigger when key is released (https://processing.org/reference/keyReleased_.html)
}
