JSONObject json;
PImage imgIcon;

void setup() 
{
  size(320, 240);
  background(100,100,0);
  
  // api refer to: http://openweathermap.org/current#name
  json = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=himalaya&units=metric");

  String city = json.getString("name");
  println(city);
  
  // http://openweathermap.org/weather-conditions
  JSONArray weather = json.getJSONArray("weather");
  String weatherIconCode = (weather.getJSONObject(0)).getString("icon");
  println(weatherIconCode);
  String weatherCondition = (weather.getJSONObject(0)).getString("description");
  println(weatherCondition);
  
  
  JSONObject main = json.getJSONObject("main");
  String weatherTemp = str((main).getInt("temp"))+" Celsius";
  
  String weatherIconUrl = "http://openweathermap.org/img/w/"+weatherIconCode+".png";
  imgIcon = loadImage(weatherIconUrl);
  imageMode(CENTER);
  image(imgIcon, width/2, 100);
  
  textAlign(CENTER);
  text(weatherCondition, width/2, 100+30);
  text(city, width/2, 100+60);
  text(weatherTemp, width/2, 100+90);
  
}

