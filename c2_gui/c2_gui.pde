import g4p_controls.*;
GTextField txfName;
GButton btnOk;

public void setup() 
{
  size(500, 300);
  G4P.setGlobalColorScheme(GCScheme.PURPLE_SCHEME);
  
  txfName = new GTextField(this, 10, 10, 200, 20);
  txfName.setPromptText("Your Name");
  
  
  btnOk = new GButton(this, 250, 10, 50, 20);
  btnOk.setText("OK!");
  
  btnOk.addEventHandler(this, "btnOkClick");
  
  // todo 1: when user click ok button, instead of output the name in cli, output it to screen using text element (hint: https://processing.org/reference/text_.html)
}

public void draw() 
{
  background(200, 128, 200);
  // Draw tab order
  stroke(0);
  strokeWeight(2);
}


public void btnOkClick(GButton source, GEvent event) 
{
  println(txfName.getText());
}

