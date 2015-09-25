// https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=klcc

JSONObject json;
String url = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=klcc&rsz=8&imgSize=icon";
ArrayList <PImage> imgList = new ArrayList<PImage>();

void setup() 
{
  size(800, 400);
  background(0);
  
  json = loadJSONObject(url);

  JSONObject responseData = json.getJSONObject("responseData");
  JSONArray resultList = responseData.getJSONArray("results");
  for(int i=0; i<resultList.size(); i++)
  {
     String url = (resultList.getJSONObject(i)).getString("unescapedUrl");
     //println(url);
     try
     {
       PImage tmp = loadImage(url);
       imgList.add(tmp);
     }
     catch(Exception e){}
  }
  
  frameRate(4);
}

void draw()
{
  for(int i=0; i<imgList.size(); i++)
  {
    int y=0; if(i>=4){y=200;}
    image(imgList.get(i), (i%4)*200, y, 200, 200);
  }
}
