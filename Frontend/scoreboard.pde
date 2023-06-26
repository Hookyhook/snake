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
    fill(255, 125);
    textSize(60);
    text("SCOREBOARD", 0, -40);
    textSize(40);
    int currentpage = 0;
    int limit;
    if(scorelist.size()-(currentpage)*5 < 5 && scorelist.size()-(currentpage)*5 != 0){
      limit = scorelist.size()-(currentpage)*5;
    }else{
      limit = (currentpage)*5;
      if(limit == 0){
        limit = 5;
      }
    }
    for (int i=0+currentpage*5; i < limit; i++) {
      JSONObject scoreentry = scorelist.getJSONObject(i);
      String name = scoreentry.getString("username");
      int userscore = scoreentry.getInt("score");
      text((i+1)+"."+" "+name + " " + userscore, 0, i*40);
    }
    popMatrix();
  }
}
