PImage img;
void setup() 
{
  size(640, 480);
  img = loadImage("hulk.jpg");
}

void draw() 
{
  background(0, 0, 0);
  //tint(0, 128, 255);
  image(img, 0, 0);
  
  // todo 1: add a blue tint to the image (hint: https://processing.org/reference/tint_.html)
  // todo 2: how bout changing to semi transparent?
  // todo 3: can you center position the image within the canvas? (hint: https://processing.org/reference/imageMode_.html)
} 

