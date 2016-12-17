import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;
import org.apache.commons.codec.binary.Base64;
import http.requests.*;
import java.nio.file.Files;
import java.io.File;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.awt.image.WritableRaster;
import java.awt.image.DataBufferByte;
import javax.xml.bind.DatatypeConverter;

PrintWriter output;

float c;
int pppmouseX, pppmouseY, ppmouseX, ppmouseY;
PImage imgUpload;
String base64Upload;
String urlServer = "http://testbase/phpBase64Upload/index.php";

void setup() 
{
  
  size(640, 360);
  colorMode(RGB);
  background(0);
  
  smooth(2);
  
  output = createWriter("upload.txt"); 
}

void draw() 
{
  colorMode(HSB);
  if (c >= 255)  c=0;  else  c++;
  stroke(c, 255, 255);
  strokeWeight(4);
  
  if(mousePressed)
  {
    beginShape();
    curveVertex(pppmouseX,pppmouseY);
    curveVertex(ppmouseX,ppmouseY);
    curveVertex(pmouseX,pmouseY);
    curveVertex(mouseX,mouseY);
    endShape();
  }
  
  pppmouseX = ppmouseX;
  pppmouseY = ppmouseY;
  ppmouseX = pmouseX;
  ppmouseY = pmouseY;
}

void keyReleased() 
{
  if(key == 's')
  {
    saveFrame("upload.png");  
    delay(100);
    upload2Server();
  }
}
 
void upload2Server()
{
  println("upload to server...");
  imgUpload = loadImage("upload.png");
  base64Upload = encodeImage2Base64("upload.png");
  
  println("base64:", base64Upload);
  if(!base64Upload.isEmpty())
  {
    output.println(base64Upload);
    output.flush();  // Writes the remaining data to the file
    output.close();
    
    println("call url:", urlServer);
    PostRequest post = new PostRequest(urlServer);
    post.addData("base64PngImage", base64Upload);
    post.send();
  }
}

public String encodeImage2Base64(String ImageName)
{
  println("Loading...", ImageName);
  String result = null;
  byte[] bytes = null;
  bytes = loadBytes(ImageName); 
  byte[] encoded = Base64.encodeBase64(bytes);
  result = new String(encoded);
  return result;
}