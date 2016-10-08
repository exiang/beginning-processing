import g4p_controls.*;
import java.awt.Font;

GTextField txfName;
GTextField txfName2;
GButton btnOk;

int tmpName;

public void setup() 
{
  size(500, 300);
  G4P.setGlobalColorScheme(GCScheme.GREEN_SCHEME);
  
  txfName = new GTextField(this, 10, 10, 200, 30);
  txfName.setFont(new Font("Dialog", Font.PLAIN, 20));
  txfName.setPromptText("Your Number 1");
  
  txfName2 = new GTextField(this, 10, 50, 200, 30);
  txfName2.setFont(new Font("Dialog", Font.PLAIN, 20));
  txfName2.setPromptText("Your Number 2");
  
  btnOk = new GButton(this, 250, 10, 50, 20);
  btnOk.setText("SUM!");
  
  btnOk.addEventHandler(this, "btnOkClick");
  
  // todo 1: when user click ok button, instead of output the name in cli, output it to screen using text element (hint: https://processing.org/reference/text_.html)
  
}

public void draw() 
{
  background(128, 200, 128);
  // Draw tab order
  stroke(0);
  strokeWeight(2);
  
  textSize(32);
  text(Integer.toString(tmpName), 50, 120); 
}


public void btnOkClick(GButton source, GEvent event) 
{
  tmpName = Integer.parseInt(txfName.getText()) + Integer.parseInt(txfName2.getText());
}