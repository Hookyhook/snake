class BUTTON {
  int x;
  int y;
  int l = 150*relativesize;
  int h = 55*relativesize;
  String buttontext;
  boolean clicked = false;

  BUTTON(int z1, int z2, String z3, int l, int h) {
    x = z1;
    y = z2;
    buttontext = z3;
    this.l = l;
    this.h = h;
  }
  void display() {
    fill(200, 200, 200, 100);
    onClick();
    noStroke();
    rectMode(CENTER);
    rect(x, y, l, h, 12.5*relativesize);
    fill(0);
    stroke(0);
    textAlign(CENTER, CENTER);
    textSize(75);
    text(buttontext, x, y-4*relativesize);
    fill(255);
  }
  void onClick() {
    if (mouseX > x - l/2 && mouseX < x + l/2) {
      if (mouseY > y - h/2 && mouseY < y + h/2) {

        if (mousePressed && mouseButton==37) {
          clicked = true;
          fill(200, 200, 200, 200);
        } else {
          fill(200, 200, 200, 150);
        }
      }
    }
  }
}
