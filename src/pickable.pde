// The PICKABLE class represents the pickable items in the game

class PICKABLE {
  float x;               // X-coordinate of the pickable item's position
  float y;               // Y-coordinate of the pickable item's position
  String type;           // Type of the pickable item (not used in the current implementation)
  float size = 20;       // Size of the pickable item (diameter of the ellipse)

  // Constructor: Initialize the pickable item with a random position
  PICKABLE() {
    reposition();        // Set a random position for the pickable item
  }

  // Update the pickable item
  void update() {
    ellipse(x, y, size, size);  // Draw the pickable item as an ellipse
  }

  // Reposition the pickable item to a random position
  void reposition() {
    x = random(400 - size) + size / 2;  // Set a random X-coordinate within the screen boundaries
    y = random(400 - size) + size / 2;  // Set a random Y-coordinate within the screen boundaries
  }
}
