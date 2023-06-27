class BUTTON {
  int x; // X-coordinate of the button
  int y; // Y-coordinate of the button
  int l = 150*relativesize; // Length of the button
  int h = 55*relativesize; // Height of the button
  String buttontext; // Text displayed on the button
  boolean clicked = false; // Flag indicating if the button is clicked
  int cooldown = 5; // Cooldown period for the button

  BUTTON(int z1, int z2, String z3, int l, int h) {
    x = z1;
    y = z2;
    buttontext = z3;
    this.l = l;
    this.h = h;
  }
  
  void display() {
    if (cooldown > 0) {
      cooldown--;
    }
    
    fill(200, 200, 200, 100); // Set the fill color for the button
    onClick(); // Check for button click event
    noStroke(); // Disable stroke for the button
    rectMode(CENTER); // Set the rectangle mode to CENTER
    rect(x, y, l, h, 12.5*relativesize); // Draw the button shape with rounded corners
    
    fill(0); // Set the text color to black
    stroke(0); // Set the stroke color to black
    textAlign(CENTER, CENTER); // Set the text alignment to CENTER
    textSize(75); // Set the text size
    text(buttontext, x, y-4*relativesize); // Display the button text at the center of the button
    
    fill(255); // Set the fill color back to white
  }
  
  void onClick() {
    if (mouseX > x - l/2 && mouseX < x + l/2) {
      if (mouseY > y - h/2 && mouseY < y + h/2) {
        if (mousePressed && mouseButton == 37 && cooldown == 0) {
          clicked = true; // Set the clicked flag to true if the left mouse button is pressed on the button
          fill(200, 200, 200, 200); // Set the fill color to indicate the button is clicked
          cooldown = 45; // Set the cooldown period for the button
        } else {
          fill(200, 200, 200, 150); // Set the fill color to indicate the button is hovered
        }
      }
    }
  }
}
