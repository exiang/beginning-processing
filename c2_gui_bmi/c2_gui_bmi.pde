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
  if(bmi<18.5) return "Underweight";
  if(bmi>=18.5 && bmi<24.9) return "Normal Weight";
  if(bmi>=25 && bmi<29.9) return "Overweight";
  if(bmi>=30 && bmi<34.9) return "Obesity I";
  if(bmi>=35 && bmi<39.9) return "Obesity II";
  if(bmi>40) return "Extreme Obesity";
  
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
