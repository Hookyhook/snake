class MAINMENU {

  BUTTON b1 = new BUTTON(width/2, height/2+50, "Play");
  
  void update (){
     fill(0);
      textSize(25);
      textAlign(CENTER);
      text("SNAKE", width/2, height/2-50);
      textSize(10);
      text("by Q11 studios ", width/2, height/2-25);
      fill(255);
      b1.display();
      if(b1.clicked){
        restartGame();
        b1.clicked = false;
      }
  }  
}
