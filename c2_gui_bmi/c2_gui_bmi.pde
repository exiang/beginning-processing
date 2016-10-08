// Need G4P library
import g4p_controls.*;

float weight;
float height;
float bmi;

public void setup(){
  size(480, 320, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  
}

public void draw(){
  background(230);
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

public float calcBmi(float weight, float height){
  float result = weight/(height*height);
  return result;
}

public String translateResult(float bmi)
{
  // todo: search for the formula online and implement the logic here
  return "Unknown";
}

public void renderResult(){
  if(weight >0 && height >0)
  {
    float bmi = calcBmi(weight, height);
    lblResult.setText("Your BMI is: "+ "("+translateResult(bmi)+")");
  }
  else
  {
    lblResult.setText("Please insert valid weight and height value");
  }
}