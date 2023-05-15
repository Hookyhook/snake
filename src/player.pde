class PLAYER {
  float x = 200;
  float y = 200;
  float vx;
  float vy;
  float startv = 1.5;
  float maxv = 1.5;
  float size = 30;

  void update() {
    checkforWall();
    x += vx;
    y += vy;
    ellipse(x, y, size, size);
  }

  void checkforWall() {
    if (x-size/2 <= 0 || x+size/2 >= width || y-size/2 <= 0 || y+size/2 >= height) {
      vx = -vx;
      vy = -vy;
    }
  }

  void move(String direction) {
    switch (direction) {
    case "DOWN":
      vy = maxv;
      vx = 0;
      break;
    case "UP":
      vy = -maxv;
      vx = 0;
      break;
    case "LEFT":
      vx = -maxv;
      vy = 0;
      break;
    case "RIGHT":
      vx = maxv;
      vy = 0;
      break;
    }
  }
}
