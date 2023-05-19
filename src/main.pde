
void setup() {
  size(400, 400);       // Set the size of the game window
  frameRate(60);        // Set the frame rate of the game
}

GAME g1 = new GAME();   // Create an instance of the GAME class
GAMEOVER go1 = new GAMEOVER();
String status = "GAME";

void draw() {
  background(255);      // Set the background color to white
  switch (status){
  case "GAME":
    g1.update();// Update the game state
    break;
  case "GAMEOVER":
    go1.update();
    break;
  }
            
}

// Handle key press events
void keyPressed() {

  switch (keyCode) {
    case 40:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("DOWN"); // Move the player down
      break;
    case 38:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("UP");   // Move the player up
      break;
    case 37:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("LEFT"); // Move the player left
      break;
    case 39:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("RIGHT");// Move the player right
      break;
  }
}
