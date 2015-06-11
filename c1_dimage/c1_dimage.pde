PImage img;
void setup() 
{
  size(500, 375);
  String url = "http://www.hetemeel.com/einsteinshow.php?text=Hello+World";
  img = loadImage(url, "jpg");
}

void draw() 
{
  background(0, 0, 0);
  //tint(0, 128, 255);
  image(img, 0, 0);
  
  // todo 1: change the text on the image to your own
} 

