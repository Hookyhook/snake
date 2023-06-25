class MAINMENU {

  BUTTON b1 = new BUTTON(width/2, height/2, "Play");
  BUTTON b2 = new BUTTON(width/2, height/2+150, "Quit");
  SCOREBOARD sb = new SCOREBOARD(50,50);

  void update (){
     fill(0);
      textSize(100);
      textAlign(CENTER);
      text("SNAKE", width/2, height/2-200);
      textSize(25);
      text("by Q11 studios ", width/2, height/2-175);
      fill(255);
      b1.display();
      b2.display();
      if(b1.clicked){
        restartGame();
        b1.clicked = false;
      }
      if(b2.clicked){
        exit();
      }
  }  
}
