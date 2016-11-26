PImage img;
String url;
void setup() 
{
  size(500, 375);
  
  
}

void draw() 
{
  url = "http://www.hetemeel.com/einsteinshow.php?text=mouseX:+"+mouseX;
  img = loadImage(url, "jpg");
  background(0, 0, 0);
  tint(255, 255, 1);
  image(img, 0, 0);
  
  // todo 1: change the text on the image to your own
} 