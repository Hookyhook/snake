// The GAME class represents the game state and logic

class GAME {
  PLAYER p1 = new PLAYER();  // Create an instance of the PLAYER class for the game
  float numberofpickables = 5;  // Number of pickable items in the game
  int score = 0;          // Current score of the game
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
      fill(0);
      textSize(14);
      textAlign(CENTER);
      text("Score: " + score, 30, 15);  // Display the current score
      fill(255);
  }

  // Check if the player picks up any pickable items
  void PlayerPicksUp() {
    for (int i = 0; i < numberofpickables; i++) {
      // Calculate the distance between the player and the pickable item
      if (dist(pickables.get(i).x, pickables.get(i).y, p1.x, p1.y) < p1.size / 2 + pickables.get(i).size / 2 + 2 && gamestarted) {
        pickables.get(i).reposition();  // Reposition the picked-up item to a new random position
        score++;            // Increase the score
        p1.tailLength++;
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
    p1.maxv = 1.5 + floor(score / 5) * 0.3;  // Increase the player's maximum velocity based on the score
  }
}