void setup() {
  size(400, 400);
  frameRate(60);
}
GAME g1 = new GAME();
void draw() {
  background(255);
  g1.update();
}



void keyPressed() {

  switch (keyCode) {
  case 40:
    g1.startgame();
    g1.p1.move("DOWN");
    break;
  case 38:
    g1.startgame();
    g1.p1.move("UP");
    break;
  case 37:
    g1.startgame();

    g1.p1.move("LEFT");
    break;
  case 39:
    g1.startgame();

    g1.p1.move("RIGHT");
    break;
  }
}
