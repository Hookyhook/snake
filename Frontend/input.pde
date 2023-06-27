class INPUTFIELD {
  float x, y;              // Position of the input field
  float width, height;     // Dimensions of the input field
  String text = "";        // Current text entered in the field
  boolean active = false;  // Whether the field is currently active or not
  String placeholder = ""; // Placeholder text to display when the field is empty
  boolean submit = false;  // Whether the field has been submitted or not
  boolean textlimit = false; // Whether the field has reached the text limit or not

  INPUTFIELD(float x, float y, float width, float height, String placeholder) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.placeholder = placeholder;
  }

  void display() {
    checkstatus(); // Check the status of the input field
    if (text.length() == 9) {
      textlimit = true; // Set the textlimit flag to true if the text length reaches 9 characters
    } else {
      textlimit = false; // Set the textlimit flag to false if the text length is less than 9 characters
    }
    if (active) {
      stroke(255); // Active input field has a white stroke
    } else {
      noStroke(); // Inactive input field has no stroke
    }
    fill(125, 125); // Set the fill color for the input field
    rectMode(CENTER);
    rect(x, y, width, height, 25); // Draw the input field as a rounded rectangle
    textMode(CENTER);
    textAlign(LEFT, CENTER);
    textSize(height * 0.6);
    fill(255, 125); // Set the fill color for the text inside the input field
    if (text.length() == 0 && !active) {
      textSize(height * 0.4);
      text(placeholder, x-width/2+10, y-10); // Display the placeholder text if the input field is empty and not active
    } else {
      if (textWidth(text) > width-20) {
        textSize(height * 0.37); // Decrease the text size if the text width exceeds the input field width
      }
      text(text, x-width/2+10, y-height/6); // Display the entered text inside the input field
    }
  }

  void activate() {
    active = true; // Set the input field as active
  }

  void deactivate() {
    active = false; // Set the input field as inactive
  }

  void type(char key) {
    if (active && key == BACKSPACE && text.length() > 0 && !submit) {
      text = text.substring(0, text.length() - 1); // Remove the last character if backspace is pressed and the field is not submitted
    }
    if (active && text.length() < 9 && key != BACKSPACE && key != CODED && !submit && keyCode != ENTER) {
      text += key; // Add the typed character to the text if the field is active, not submitted, and text length is less than 9 characters
    }
  }

  void checkstatus() {
    if (keyCode == ENTER) {
      submit = true; // Set the submit flag to true if the Enter key is pressed
    }
    if (mousePressed) {
      if (mouseX > x-width/2 && mouseX < x + width/2 && mouseY > y-height/2 && mouseY < y + height/2) {
        activate(); // Activate the input field if the mouse is clicked inside the field
      } else {
        deactivate(); // Deactivate the input field if the mouse is clicked outside the field
      }
    }
  }
}
