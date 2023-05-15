class PICKABLE {
  float x;
  float y;
  String type;
  float size = 20;


  PICKABLE() {
    reposition();
  }

  void update() {
    ellipse(x, y, size, size);
  }

  void reposition() {
    x = random(400-size)+size/2;
    y = random(400-size)+size/2;
  }
}
