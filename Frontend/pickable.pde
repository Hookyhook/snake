// The PICKABLE class represents the pickable items in the game
class PICKABLE {
  float x;               // X-coordinate of the pickable item's position
  float y;               // Y-coordinate of the pickable item's position
  String type;           // Type of the pickable item
  float size = 75*relativesize;       // Size of the pickable item (diameter of the ellipse)

  // Constructor: Initialize the pickable item with a random position
  PICKABLE() {
    reposition();        // Set a random position for the pickable item
    updatetype();        // Update the type of the pickable item
  }

  // Update the pickable item
  void update() {
    if (type == "bomb") {
      shape(bomb, x-29*relativesize, y-27*relativesize, 70*relativesize, 50*relativesize);  // Display the bomb shape
      int randomNumber = (int) random(1, 400);
      if (randomNumber == 1) {
        reposition();     // Reposition the pickable item to a new random position
        updatetype();     // Update the type of the pickable item
      }
    } else if (type == "grape") {
      shape(grape, x-25*relativesize, y-27*relativesize, 50*relativesize, 50*relativesize);  // Display the grape shape
    } else if (type == "melon") {
      shape(watermelon, x-25*relativesize, y-25*relativesize, 50*relativesize, 50*relativesize);  // Display the watermelon shape
    }
  }

  // Reposition the pickable item to a random position
  void reposition() {
    x = random(width - size) + size / 2;  // Set a random X-coordinate within the screen boundaries
    y = random(height - size) + size / 2;  // Set a random Y-coordinate within the screen boundaries
  }

  // Update the type of the pickable item
  void updatetype() {
    int randomNumber = (int) random(1, 11);  // Generate a random number between 1 and 10

    // Check the value of the random number and assign the type accordingly
    if (randomNumber <= 3) {
      type = "grape";
    } else if (randomNumber <= 7) {
      type = "melon";
    } else {
      type = "bomb";
    }
  }
}
