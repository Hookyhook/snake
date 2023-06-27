class SCOREBOARD {
  int x;             // X-coordinate of the scoreboard's position
  int y;             // Y-coordinate of the scoreboard's position
  int pages;         // Total number of pages in the scoreboard
  int currentpage;   // Current page being displayed
  BUTTON b1;         // Button for navigating to the previous page
  BUTTON b2;         // Button for navigating to the next page

  // Constructor: Initialize the scoreboard
  SCOREBOARD(int tx, int ty) {
    x = tx;
    y = ty;
    b1 = new BUTTON(x+400, y+15, "BACK", 220, 85);   // Create the "BACK" button
    b2 = new BUTTON(x+400, y+130, "NEXT", 220, 85);  // Create the "NEXT" button
    loadScoreboard();                                // Load the scoreboard data from a source
    pages = ceil(scorelist.size() / 5);              // Calculate the total number of pages based on the number of scores
    currentpage = 0;                                 // Set the current page to the first page
  }

  // Display the scoreboard
  void display() {
    pages = ceil(scorelist.size() / 5);  // Recalculate the total number of pages based on the number of scores
    pushMatrix();
    translate(x, y);
    textAlign(LEFT);
    fill(255, 125);
    textSize(60);
    text("SCOREBOARD", 0, -40);  // Display the scoreboard title
    textSize(40);
    int limit;
    
    if (currentpage == pages) {
      limit = scorelist.size() % 5;  // Calculate the number of scores to display on the last page
    } else {
      limit = 5;  // Display 5 scores on each page
    }

    // Display the scores for the current page
    for (int i = 0 + currentpage * 5; i < limit + currentpage * 5; i++) {
      JSONObject scoreentry = scorelist.getJSONObject(i); // Get the score entry
      String name = scoreentry.getString("username");
      int userscore = scoreentry.getInt("score");
      String text = (i + 1) + "." + " " + name + " " + userscore;
      
      // Adjust the text size if it exceeds the width limit
      if (textWidth(text) > 300) {
        textSize(30);
      }
      
      text(text, 0, (i - currentpage * 5) * 40);  // Display the score text
      textSize(40); // Reset the text size
    }

    // Check if the "BACK" button is clicked and update the current page if applicable
    if (b1.clicked) {
      if (currentpage > 0) {
        currentpage--;
      }
      b1.clicked = false;
    }

    // Check if the "NEXT" button is clicked and update the current page if applicable
    if (b2.clicked) {
      if (currentpage < pages ) {
        currentpage++;
      }
      b2.clicked = false;
    }
    
    popMatrix();
    b1.display();  // Display the "BACK" button
    b2.display();  // Display the "NEXT" button
  }  
}
