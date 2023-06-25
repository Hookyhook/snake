class GAMEOVER {

  BUTTON b1 = new BUTTON(width/2, height/2+125, "Play Again");
  INPUTFIELD i1 = new INPUTFIELD(width/2, height/2-50, 300, 100, "Enter Name");
  SCOREBOARD sb = new SCOREBOARD(50, 125);
  boolean submitted = false;

  void update () {
    fill(0);
    textSize(75);
    textAlign(CENTER);
    text("GAMEOVER", width/2, height/2-200);
    textSize(45);
    text("Score: " + score, width/2, height/2-150);
    fill(255);
    b1.display();
    i1.display();
    sb.display();
    if(i1.submit && !submitted){
      submitscore(score);
      loadScoreboard();
    }

    
    if (b1.clicked) {
      restartGame();
      b1.clicked = false;
    }
  }
}
