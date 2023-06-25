class SCOREBOARD {
  int x;
  int y;
  int pages;

  SCOREBOARD(int tx, int ty) {
    x=tx;
    y=ty;
    loadScoreboard();
    pages = ceil(scorelist.size()/10);
  }

  void display() {
    pushMatrix();
    translate(x, y);

    textAlign(LEFT);
    fill(0);
    textSize(60);
    text("SCOREBOARD", 0, -40);
    textSize(40);
    int currentpage = 0;
    for (int i=0+currentpage*5; i <= 5-1; i++) {
      JSONObject scoreentry = scorelist.getJSONObject(i);
      String name = scoreentry.getString("username");
      int userscore = scoreentry.getInt("score");
      text((i+1)+"."+" "+name + " " + userscore, 0, i*40);
    }
    popMatrix();
  }
}
