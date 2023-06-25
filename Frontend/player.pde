// The PLAYER class represents the player in the game

class PLAYER {
  float x = 200;        // X-coordinate of the player's position
  float y = 200;        // Y-coordinate of the player's position
  float vx;             // Velocity along the X-axis
  float vy;             // Velocity along the Y-axis
  float startv = 3*relativesize;   // Initial velocity magnitude
  float maxv = 1.5;     // Maximum velocity magnitude
  float size = 15*relativesize;      // Size of the player (diameter of the ellipse)
  ArrayList<PVector> tail = new ArrayList<PVector>();  // List to store the tail segments
  int tailLength = 1;                                 // Initial length of the tail
  int cooldown = 0;
  PLAYER(){
    tail.add(new PVector(x,y));
  }
  // Update the player's position
  void update() {
    checkforTailCollision();
    checkforWall();     // Check if the player hits a wall and update velocity if necessary
    x += vx;            // Update the X-coordinate based on the velocity
    y += vy;            // Update the Y-coordinate based on the velocity
      // Draw the player as anAC ellipse
    if(tailLength == 1){
      tail.set(0, new PVector(x,y));
    }
    if(dist(tail.get(tail.size()-1).x, tail.get(tail.size()-1).y, x, y)>= size*relativesize){
    tail.add(new PVector(x, y));
    }

    // Remove the oldest tail segment if the tail exceeds its length
    if (tail.size() > tailLength) {
      tail.remove(0);
    }

    // Draw the tail
    if(tail.size()>1){
    for(int i = 1; i < tail.size(); i++){
      if(i==1){
      shape(snake_tail, tail.get(i).x-35*relativesize, tail.get(i).y-30*relativesize, size*2.7*relativesize, size*2*relativesize);
      }else{
      shape(snake_body, tail.get(i).x-35*relativesize, tail.get(i).y-30*relativesize, size*2.7*relativesize, size*2*relativesize);
      }
    }
    }
  
    image(snake_head, x-40*relativesize, y-24*relativesize, size*2.7*relativesize, size*2*relativesize);
  }

  // Check if the player hits a wall and update the velocity accordingly
  void checkforWall() {
    
    // If the player's position is at or outside the boundaries of the screen
    if (x - size / 2 <= 0 || x + size / 2 >= width || y - size / 2 <= 0 || y + size / 2 >= height) {
      status = "GAMEOVER";
    }
  }
  void checkforTailCollision (){
    for(int i = 0; i < tail.size()-1; i++){
      if(dist(tail.get(i).x, tail.get(i).y, x, y)< size){
        status = "GAMEOVER";
      }
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
