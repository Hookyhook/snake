class BUTTON {
  int x;
  int y;
  int l = 150;
  int h = 50;
  String buttontext;
  boolean clicked = false;

  BUTTON(int z1, int z2, String z3) {
    x = z1;
    y = z2;
    buttontext = z3;
  }
  void display() {
    onClick();
    noFill();
    rectMode(CENTER);
    rect(x, y, l, h);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text(buttontext, x, y);
    fill(255);
  }
  void onClick() {
    if (mouseX > x - l/2 && mouseX < x + l/2) {
      if (mouseY > y - h/2 && mouseY < y + h/2) {
        
        if (mousePressed && mouseButton==37) {
          clicked = true;
        
        }

      }

    }

  }



}
