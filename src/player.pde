// The PLAYER class represents the player in the game

class PLAYER {
  float x = 200;        // X-coordinate of the player's position
  float y = 200;        // Y-coordinate of the player's position
  float vx;             // Velocity along the X-axis
  float vy;             // Velocity along the Y-axis
  float startv = 1.5;   // Initial velocity magnitude
  float maxv = 1.5;     // Maximum velocity magnitude
  float size = 30;      // Size of the player (diameter of the ellipse)
  ArrayList<PVector> tail = new ArrayList<PVector>();  // List to store the tail segments
  int tailLength = 0;                                 // Initial length of the tail
  int cooldown = 0;

  // Update the player's position
  void update() {
    cooldown++;
    checkforWall();     // Check if the player hits a wall and update velocity if necessary
    x += vx;            // Update the X-coordinate based on the velocity
    y += vy;            // Update the Y-coordinate based on the velocity
    ellipse(x, y, size, size);  // Draw the player as an ellipse
    if(cooldown >= 10){
    tail.add(new PVector(x, y));
    cooldown = 0;
    }

    // Remove the oldest tail segment if the tail exceeds its length
    if (tail.size() > tailLength) {
      tail.remove(0);
    }

    // Draw the tail
    for (PVector segment : tail) {
      ellipse(segment.x, segment.y, size, size);
    }
  }

  // Check if the player hits a wall and update the velocity accordingly
  void checkforWall() {
    // If the player's position is at or outside the boundaries of the screen
    if (x - size / 2 <= 0 || x + size / 2 >= width || y - size / 2 <= 0 || y + size / 2 >= height) {
      vx = -vx;         // Reverse the X-velocity to bounce off the wall
      vy = -vy;         // Reverse the Y-velocity to bounce off the wall
    }
  }

  // Move the player in a specified direction
  void move(String direction) {
    switch (direction) {
      case "DOWN":
        vy = maxv;       // Set the Y-velocity to move downwards
        vx = 0;          // Set the X-velocity to zero (no horizontal movement)
        break;
      case "UP":
        vy = -maxv;      // Set the Y-velocity to move upwards
        vx = 0;          // Set the X-velocity to zero (no horizontal movement)
        break;
      case "LEFT":
        vx = -maxv;      // Set the X-velocity to move to the left
        vy = 0;          // Set the Y-velocity to zero (no vertical movement)
        break;
      case "RIGHT":
        vx = maxv;       // Set the X-velocity to move to the right
        vy = 0;          // Set the Y-velocity to zero (no vertical movement)
        break;
    }
  }
}
