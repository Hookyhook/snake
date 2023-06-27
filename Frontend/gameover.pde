class GAMEOVER {
  BUTTON b1 = new BUTTON(width/2, height/2+25, "Play Again", 250*relativesize, 55*relativesize); // Create a button for "Play Again"
  BUTTON b3 = new BUTTON(width/2, height/2+175, "MAINMENU", 250*relativesize, 55*relativesize); // Create a button for "MAINMENU"
  INPUTFIELD i1 = new INPUTFIELD(50+150, height/2-180, 300, 100, "Enter Name"); // Create an input field for entering a name
  SCOREBOARD sb = new SCOREBOARD(50, 125); // Create a scoreboard
  boolean submitted = false; // Flag to track if the score has been submitted

  void update() {
    fill(0); // Set the fill color to black
    textSize(75); // Set the text size to 75
    textAlign(CENTER); // Set the text alignment to center
    text("GAMEOVER", width/2, height/2-200); // Display "GAMEOVER" text at the center top of the screen
    textSize(45); // Set the text size to 45
    text("Score: " + score, width/2, height/2-150); // Display the score below the "GAMEOVER" text
    textSize(30); // Set the text size to 30
    textAlign(LEFT); // Set the text alignment to left
    fill(255, 125); // Set the fill color to white with transparency

    // Display appropriate text based on submission status and text limit
    if (i1.textlimit) {
      text("You have reached the character limit!", 50, height/2-90); // Display text if the character limit is reached
    } else if (!submitted) {
      text("Submit your score with Enter", 50, height/2-90); // Display text to prompt score submission
    } else {
      text("Submitted!", 50, height/2-90); // Display text indicating score submission
    }
    textAlign(CENTER); // Set the text alignment to center
    fill(255); // Set the fill color to white

    // Display buttons, input field, and scoreboard
    b1.display(); // Display the "Play Again" button
    b3.display(); // Display the "MAINMENU" button
    i1.display(); // Display the input field
    sb.display(); // Display the scoreboard

    // Submit the score and load the scoreboard if Enter key is pressed
    if (i1.submit && !submitted) {
      username = i1.text; // Store the entered username
      submitted = true; // Set the submitted flag to true
      submitscore(score); // Submit the score to the server
      loadScoreboard(); // Load the updated scoreboard
    }

    // Restart the game if the "Play Again" button is clicked
    if (b1.clicked) {
      restartGame(); // Restart the game
      b1.clicked = false; // Reset the clicked flag
    } else if (b3.clicked) {
      restartGame(); // Restart the game
      b3.clicked = false; // Reset the clicked flag
      status = "MAINMENU"; // Change the game status to "MAINMENU"
    }
  }
}
