import http.requests.*; // Import the HTTP Requests library for making HTTP requests

PShape bomb; // Declare a variable to hold the bomb shape
PShape grape; // Declare a variable to hold the grape shape
PShape watermelon; // Declare a variable to hold the watermelon shape
PImage snake_head; // Declare a variable to hold the snake head image
PShape snake_body; // Declare a variable to hold the snake body shape
PShape snake_tail; // Declare a variable to hold the snake tail shape
PShape background; // Declare a variable to hold the background shape

JSONArray scorelist = new JSONArray(); // Declare a variable to hold the score list as a JSON array

JSONObject place = new JSONObject(); // Declare a variable to hold the place as a JSON object
JSONObject highscore = new JSONObject(); // Declare a variable to hold the highscore as a JSON object

String username = "testclient"; // Set the default username
GAME g1; // Declare a variable to hold an instance of the GAME class
GAMEOVER go1; // Declare a variable to hold an instance of the GAMEOVER class
MAINMENU m1; // Declare a variable to hold an instance of the MAINMENU class
String status; // Declare a variable to hold the game status
int score; // Declare a variable to hold the score
int relativesize = 2; // Set the relative size of the game elements

void setup() {
  fullScreen(); // Set the size of the game window to full screen
  frameRate(60); // Set the frame rate of the game to 60 frames per second
  g1 = new GAME(); // Create an instance of the GAME class
  go1 = new GAMEOVER(); // Create an instance of the GAMEOVER class
  m1 = new MAINMENU(); // Create an instance of the MAINMENU class
  status = "MAINMENU"; // Set the initial game status to "MAINMENU"
  score = 0; // Set the initial score to 0

  // Load the game DATA
  bomb = loadShape("./DATA/pickable_bomb.svg");
  grape = loadShape("./DATA/pickable_grape.svg");
  watermelon = loadShape("./DATA/pickable_watermelon.svg");
  snake_body = loadShape("./DATA/snake_body.svg");
  snake_tail = loadShape("./DATA/snake_tail.svg");
  snake_head = loadImage("./DATA/snake_head.png");
  background = loadShape("./DATA/background_new.svg");
}

void draw() {
  shape(background, 0, 0, width*1.2, height*1.2); // Draw the background shape

  // Update the game state based on the current status
  switch (status) {
    case "GAME":
      g1.update();
      break;
    case "GAMEOVER":
      go1.update();
      break;
    case "MAINMENU":
      m1.update();
  }
}

// Handle key press events
void keyPressed() {
  go1.i1.type(key);
  switch (keyCode) {
    case 40:
      g1.startgame();
      g1.p1.move("DOWN");
      break;
    case 38:
      g1.startgame();
      g1.p1.move("UP");
      break;
    case 37:
      g1.startgame();
      g1.p1.move("LEFT");
      break;
    case 39:
      g1.startgame();
      g1.p1.move("RIGHT");
      break;
  }
}

void restartGame() {
  g1 = new GAME();
  status = "GAME";
  go1 = new GAMEOVER();
}

void loadScoreboard() {
  // Make an HTTP GET request to retrieve the leaderboard data
  GetRequest get = new GetRequest("http://snake.timkausemann.de/leaderboard");
  get.send();
  scorelist = parseJSONArray(get.getContent()); // Parse the response content as a JSON array
}

void submitscore(int score) {
  String url = "http://snake.timkausemann.de/submit/" + username + "/" + score;
  GetRequest get = new GetRequest(url);
  get.send();
  place = parseJSONObject(get.getContent()); // Parse the response content as a JSON object
}

void loadhighscore() {
  String url = "http://snake.timkausemann.de/user/" + username;
  GetRequest get = new GetRequest(url);
  get.send();
  highscore = parseJSONObject(get.getContent()); // Parse the response content as a JSON object
}
