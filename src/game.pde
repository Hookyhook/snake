class GAME {
  PLAYER p1 = new PLAYER();
  float numberofpickables = 5;
  int score = 0;
  Boolean gamestarted = false;
  ArrayList <PICKABLE> pickables = new ArrayList<PICKABLE>();
  GAME() {
    for (int i = 0; i<numberofpickables; i++) {
      pickables.add(new PICKABLE());
    }
    score = 0;
  }
  void update() {
    UpdatePlayerSpeed();
    PlayerPicksUp();
    p1.update();
    for (int i = 0; i<numberofpickables; i++) {
      pickables.get(i).update();
      fill(0);
      textSize(14);
      textAlign(CENTER);
      text("Score: " + score, 30, 15);
      fill(255);
    }
  }
  void PlayerPicksUp() {
    for (int i = 0; i<numberofpickables; i++) {
      if (dist(pickables.get(i).x, pickables.get(i).y, p1.x, p1.y)< p1.size/2+pickables.get(i).size/2+2 && gamestarted) {
        pickables.get(i).reposition();
        score++;
      }
    }
  }
  void startgame() {
    if (!gamestarted) {
      gamestarted = true;
    }
  }
  void UpdatePlayerSpeed(){
   p1.maxv = 1.5 + floor(score/5)*0.3;
  }
}
