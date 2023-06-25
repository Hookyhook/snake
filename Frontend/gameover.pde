class GAMEOVER {
  
  BUTTON b1 = new BUTTON(width/2, height/2+25, "Play Again");
  
  void update (){
     fill(0);
      textSize(25);
      textAlign(CENTER);
      text("GAMEOVER", width/2, height/2-50);
      textSize(15);
      text("Score: " + score, width/2, height/2-25);
      fill(255);
      b1.display();
      if(b1.clicked){
        restartGame();
        b1.clicked = false;
      }
  }  
}
