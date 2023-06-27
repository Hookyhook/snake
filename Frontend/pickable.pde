// The PICKABLE class represents the pickable items in the game

class PICKABLE {
  float x;               // X-coordinate of the pickable item's position
  float y;               // Y-coordinate of the pickable item's position
  String type;
  float size = 75*relativesize;       // Size of the pickable item (diameter of the ellipse)

  // Constructor: Initialize the pickable item with a random position
  PICKABLE() {
    reposition();        // Set a random position for the pickable item
    updatetype();
  }

  // Update the pickable item
  void update() {
    if (type == "bomb") {
      shape(bomb, x-29*relativesize, y-27*relativesize, 70*relativesize, 50*relativesize);
      int randomNumber = (int) random(1, 400);
      if (randomNumber == 1) {
        reposition();
        updatetype();
      }
    } else if (type == "grape") {
      shape(grape, x-25*relativesize, y-27*relativesize, 50*relativesize, 50*relativesize);
    } else if (type == "melon") {
      shape(watermelon, x-25*relativesize, y-25*relativesize, 50*relativesize, 50*relativesize);
    }
  }

  // Reposition the pickable item to a random position
  void reposition() {
    x = random(width - size) + size / 2;  // Set a random X-coordinate within the screen boundaries
    y = random(height - size) + size / 2;  // Set a random Y-coordinate within the screen boundaries
  }

  void updatetype() {
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
