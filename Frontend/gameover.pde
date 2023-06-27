class GAMEOVER {

  BUTTON b1 = new BUTTON(width/2, height/2+25, "Play Again", 250*relativesize, 55*relativesize);
  BUTTON b3 = new BUTTON(width/2, height/2+175, "MAINMENU", 250*relativesize, 55*relativesize);
  INPUTFIELD i1 = new INPUTFIELD(50+150, height/2-180, 300, 100, "Enter Name");
  SCOREBOARD sb = new SCOREBOARD(50, 125);
  boolean submitted = false;

  void update () {
    fill(0);
    textSize(75);
    textAlign(CENTER);
    text("GAMEOVER", width/2, height/2-200);
    textSize(45);
    text("Score: " + score, width/2, height/2-150);
    textSize(30);
    textAlign(LEFT);
    fill(255, 125);
    if(i1.textlimit){
        text("You have reached the character limit!", 50, height/2-90);

    }
    else if(!submitted){
        text("Submit you score with Enter", 50, height/2-90);
    }else{
        text("Submitted!", 50, height/2-90);
    }
    textAlign(CENTER);
    fill(255);
    b1.display();
    b3.display();
    i1.display();
    sb.display();
    if(i1.submit && !submitted){
      username = i1.text;
      submitted = true;
      submitscore(score);
      loadScoreboard();
    }

    
    if (b1.clicked) {
      restartGame();
      b1.clicked = false;
    }else if(b3.clicked){
      restartGame();
      b3.clicked = false;
      status = "MAINMENU";
    }
  }
}
