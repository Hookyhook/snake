// The GAME class represents the game state and logic

class GAME {
  PLAYER p1 = new PLAYER();  // Create an instance of the PLAYER class for the game
  float startnumberofpickables = 5;
  float numberofpickables = startnumberofpickables;  // Number of pickable items in the game        
  
  boolean gamestarted = false;  // Flag to track if the game has started
  ArrayList<PICKABLE> pickables = new ArrayList<PICKABLE>();  // List of pickable items

  // Constructor: Initialize the game state
  GAME() {
    // Create the specified number of pickable items and add them to the list
    for (int i = 0; i < numberofpickables; i++) {
      pickables.add(new PICKABLE());
    }
    score = 0;  // Reset the score to zero
  }

  // Update the game state
  void update() {
    UpdatePlayerSpeed();  // Update the player's speed based on the score
    PlayerPicksUp();      // Check if the player picks up any pickable items
    p1.update();          // Update the player's position
    for (int i = 0; i < numberofpickables; i++) {
      pickables.get(i).update();  // Update and draw each pickable item
    }
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Score: " + score, 50*relativesize,50);  // Display the current score
    fill(255);
  }

  // Check if the player picks up any pickable items
  void PlayerPicksUp() {
    for (int i = 0; i < numberofpickables; i++) {
      // Calculate the distance between the player and the pickable item
      if (dist(pickables.get(i).x, pickables.get(i).y, p1.x, p1.y) < p1.size / 2 + pickables.get(i).size / 2 + 2 && gamestarted) {
        if (pickables.get(i).type == "bomb") {
          status = "GAMEOVER";
          return;
        } else {
          pickables.get(i).reposition();  // Reposition the picked-up item to a new random position
          pickables.get(i).updatetype();
          score++;            // Increase the score
          p1.tailLength++;
        }
      }
    }
  }

  // Start the game
  void startgame() {
    if (!gamestarted) {
      gamestarted = true;  // Set the gamestarted flag to true if it was not already started
    }
  }

  // Update the player's speed based on the score
  void UpdatePlayerSpeed() {
    p1.maxv = p1.startv + floor(score / 5) * 0.3;  // Increase the player's maximum velocity based on the score
    numberofpickables = startnumberofpickables + floor(score / 10);  // Increase the number of pickable items based on the score
    if (numberofpickables > 10) {
      numberofpickables = 20;  // Limit the number of pickable items to 20
    }
    if(numberofpickables > pickables.size()){
      pickables.add(new PICKABLE());
    }
  }
}
