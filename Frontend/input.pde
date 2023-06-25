class INPUTFIELD {
  float x, y;              // Position of the input field
  float width, height;     // Dimensions of the input field
  String text = "";        // Current text entered in the field
  boolean active = false;  // Whether the field is currently active or not

  INPUTFIELD(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  void display() {
    if (active) {
      stroke(255);           // Active input field is white
    } else {
      stroke(200);           // Inactive input field is gray
    }
    fill(255);
    rect(x, y, width, height);

    textAlign(LEFT, CENTER);
    textSize(height * 0.6);
    fill(0);
    text(text, x + 5, y + height/2);
  }

  void activate() {
    active = true;
  }

  void deactivate() {
    active = false;
  }

  void type(char key) {
    if (active) {
      if (key == BACKSPACE && text.length() > 0) {
        text = text.substring(0, text.length() - 1);
      } else if (key != BACKSPACE) {
        text += key;
      }
    }
  }
  void checkstatus() { 
    if(mousePressed){
      if (mouseX > x && mouseX < x + width &&
        mouseY > y && mouseY < y + height) {
        activate();
      } else {
        deactivate();
      }
    }
    if(keyPressed){
      type(key);
    }
  }
}
