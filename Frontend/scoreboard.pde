class SCOREBOARD {
  int x;
  int y;
  int pages;
  int currentpage;
  BUTTON b1;
  BUTTON b2;

  SCOREBOARD(int tx, int ty) {

    x=tx;
    y=ty;    
    b1 = new BUTTON(x+350, y+15, "BACK", 200, 75);
    b2 = new BUTTON(x+350, y+100, "NEXT",200, 75);
    loadScoreboard();
    pages = ceil(scorelist.size()/10);
    currentpage = 0;
  }

  void display() {
    pages = ceil(scorelist.size()/5);
    pushMatrix();
    translate(x, y);
    textAlign(LEFT);
    fill(255, 125);
    textSize(60);
    text("SCOREBOARD", 0, -40);
    textSize(40);
    int limit;
    if(currentpage == pages){
      limit = scorelist.size()%5;
    }else{
      limit = 5;
    }
  
    for (int i=0+currentpage*5; i < limit+currentpage*5; i++) {
      JSONObject scoreentry = scorelist.getJSONObject(i);
      String name = scoreentry.getString("username");
      int userscore = scoreentry.getInt("score");
      text((i+1)+"."+" "+name + " " + userscore, 0, (i-currentpage*5)*40);
    }
    if(b1.clicked){
      if(currentpage > 0){
        currentpage--;
      }
      b1.clicked = false;
    }
    if(b2.clicked){
      if(currentpage < pages){
        currentpage++;
      }
      print(currentpage);
      b2.clicked = false;
    }
    
    popMatrix();
    b1.display();
    b2.display();
  }
  
}
