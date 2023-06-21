// The PICKABLE class represents the pickable items in the game

class PICKABLE {
  float x;               // X-coordinate of the pickable item's position
  float y;               // Y-coordinate of the pickable item's position
  String type;           // Type of the pickable item (not used in the current implementation)
  float size = 20;       // Size of the pickable item (diameter of the ellipse

  // Constructor: Initialize the pickable item with a random position
  PICKABLE() {
    reposition();        // Set a random position for the pickable item
    updatetype();
  }

  // Update the pickable item
  void update() {
    if(type == "bomb"){
      shape(bomb, x, y, 50, 50);
      int randomNumber = (int) random(1, 400);
      if(randomNumber==20){
      reposition();
      updatetype();
      }
    }
    if(type == "grape"){
      shape(grape, x, y, 50, 50);
    }
    ellipse(x, y, size, size);  // Draw the pickable item as an ellipse
    shape(watermelon, x, y, 50, 50);
  }

  // Reposition the pickable item to a random position
  void reposition() {
    x = random(400 - size) + size / 2;  // Set a random X-coordinate within the screen boundaries
    y = random(400 - size) + size / 2;  // Set a random Y-coordinate within the screen boundaries
  }
  
  void updatetype(){
    int randomNumber = (int) random(1, 11);

  // Check the value of the random number and output the cases accordingly
  if (randomNumber <= 3) {
      type =  "grape";
  } else if (randomNumber <= 7) {
     type =  "melon";
  } else {
    type =  "bomb";
  }
  }
}
