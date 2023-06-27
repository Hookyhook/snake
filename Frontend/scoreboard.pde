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
    b1 = new BUTTON(x+400, y+15, "BACK", 220, 85);
    b2 = new BUTTON(x+400, y+130, "NEXT",220, 85);
    loadScoreboard();
    pages = ceil(scorelist.size()/5);
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
      String text = (i+1)+"."+" "+name + " " + userscore;
      if(textWidth(text)>300){
        textSize(30);
      }
      text(text , 0, (i-currentpage*5)*40);
    }
    if(b1.clicked){
      if(currentpage > 0){
        currentpage--;
      }
      b1.clicked = false;
    }
    if(b2.clicked){
      if(currentpage < pages-1){
        currentpage++;
      }
      b2.clicked = false;
    }
    
    popMatrix();
    b1.display();
    b2.display();
  }
  
}
