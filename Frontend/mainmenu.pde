class MAINMENU {

  BUTTON b1 = new BUTTON(width/2, height/2, "Play", 175*relativesize, 55*relativesize);
  BUTTON b2 = new BUTTON(width/2, height/2+150, "Quit", 175*relativesize, 55*relativesize);
  SCOREBOARD sb = new SCOREBOARD(50, 125);

  void update() {
    fill(0);
    textSize(100);
    textAlign(CENTER);
    text("SNAKE", width/2, height/2-200); // Display the title of the game
    textSize(25);
    text("by Q11 studios", width/2, height/2-175); // Display the name of the game developer
    fill(255);
    b1.display(); // Display the "Play" button
    b2.display(); // Display the "Quit" button
    sb.display(); // Display the scoreboard
    if (b1.clicked) {
      restartGame(); // Restart the game if the "Play" button is clicked
      b1.clicked = false;
    }
    if (b2.clicked) {
      exit(); // Exit the game if the "Quit" button is clicked
    }
  }
}
