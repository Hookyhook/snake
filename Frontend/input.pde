class INPUTFIELD {
  float x, y;              // Position of the input field
  float width, height;     // Dimensions of the input field
  String text = "";        // Current text entered in the field
  boolean active = false;  // Whether the field is currently active or not
  String placeholder = ""; // Placeholder text to display when the field is empty
  boolean submit = false; // Whether the field has been submitted or not

  INPUTFIELD(float x, float y, float width, float height, String placeholder) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.placeholder = placeholder;
  }

  void display() {
    checkstatus();
    if (active) {
      stroke(255);           // Active input field is white
    } else {
      noStroke();        // Inactive input field is gray
    }
    fill(125, 125);
    rectMode(CENTER);
    rect(x, y, width, height, 25);
    textMode(CENTER);
    textAlign(LEFT, CENTER);
    textSize(height * 0.6);
    fill(255, 125);
    if(text.length() == 0&& !active) {
      textSize(height * 0.4);
      text(placeholder, x-width/2+10, y-10);
    } else {
      text(text, x-width/2+10, y-height/6);
    }
  }

  void activate() {
    active = true;
  }

  void deactivate() {
    active = false;
  }

  void type(char key) {
    if (active && key == BACKSPACE && text.length() > 0 && !submit) {
        text = text.substring(0, text.length() - 1);
      }
    if (active && text.length() < 10 &&key != BACKSPACE && key != CODED && !submit && keyCode != ENTER) {
        text += key;
      
    }
  }
  void checkstatus() { 
    if(keyCode == ENTER) {
      submit = true;
    }
    if(mousePressed){
      if (mouseX > x-width/2 && mouseX < x + width/2 &&
        mouseY > y-height/2 && mouseY < y + height/2) {
        activate();
      } else {
        deactivate();
      }
    }
  }
}
