/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:txWeight:604043:
  //println("txWeight - GTextField event occured " + System.currentTimeMillis()%10000000 );
  weight = Float.parseFloat(source.getText());
} //_CODE_:txWeight:604043:

public void textfield1_change2(GTextField source, GEvent event) { //_CODE_:txHeight:256948:
  //println("textfield1 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  height = Float.parseFloat(source.getText());
  
} //_CODE_:txHeight:256948:

public void button1_click1(GButton source, GEvent event) { //_CODE_:btnCalc:780422:
  // println("btnCalc - GButton event occured " + System.currentTimeMillis()%10000000 );
  renderResult();
} //_CODE_:btnCalc:780422:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  txWeight = new GTextField(this, 160, 70, 160, 30, G4P.SCROLLBARS_NONE);
  txWeight.setOpaque(true);
  txWeight.addEventHandler(this, "textfield1_change1");
  lblWeight = new GLabel(this, 30, 70, 120, 30);
  lblWeight.setText("Weight (KG)");
  lblWeight.setOpaque(false);
  lblHeight = new GLabel(this, 30, 120, 120, 30);
  lblHeight.setText("Height (M)");
  lblHeight.setOpaque(false);
  txHeight = new GTextField(this, 160, 120, 160, 30, G4P.SCROLLBARS_NONE);
  txHeight.setOpaque(true);
  txHeight.addEventHandler(this, "textfield1_change2");
  btnCalc = new GButton(this, 160, 170, 80, 30);
  btnCalc.setText("Calculate");
  btnCalc.addEventHandler(this, "button1_click1");
  lblResult = new GLabel(this, 160, 220, 310, 50);
  lblResult.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GTextField txWeight; 
GLabel lblWeight; 
GLabel lblHeight; 
GTextField txHeight; 
GButton btnCalc; 
GLabel lblResult; 

