import http.requests.*;

PShape bomb;
PShape grape;
PShape watermelon;
PImage snake_head;
PShape snake_body;
PShape snake_tail;
PShape background;

JSONArray scorelist = new JSONArray();
JSONObject place = new JSONObject();
JSONObject highscore = new JSONObject();

String username = "testclient";
GAME g1;   // Create an instance of the GAME class
GAMEOVER go1;
MAINMENU m1;
String status;
int score;
int relativesize = 2;

void setup() {
  fullScreen();      // Set the size of the game window
  frameRate(60);        // Set the frame rate of the game
  g1 = new GAME();   // Create an instance of the GAME class
  go1 = new GAMEOVER();  // Create an instance of the GAMEOVER class
  m1 = new MAINMENU(); // Create an instance of the MAINMENU class
  status = "MAINMENU";
  score = 0;
  bomb = loadShape("./assets/pickable_bomb.svg");
  grape = loadShape("./assets/pickable_grape.svg");
  watermelon = loadShape("./assets/pickable_watermelon.svg");
  snake_body = loadShape("./assets/snake_body.svg");
  snake_tail = loadShape("./assets/snake_tail.svg");
  snake_head = loadImage("./assets/snake_head.png");
  background = loadShape("./assets/background_new.svg");
}





void draw() {
  shape(background,0,0,width*1.2,height*1.2); // Set the background color to white
  switch (status){
  case "GAME":
    g1.update();// Update the game state
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

  switch (keyCode) {
    case 40:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("DOWN"); // Move the player down
      break;
    case 38:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("UP");   // Move the player up
      break;
    case 37:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("LEFT"); // Move the player left
      break;
    case 39:
      g1.startgame();     // Start the game if not already started
      g1.p1.move("RIGHT");// Move the player right
      break;
  }
}

void restartGame (){
  g1 = new GAME();
  status = "GAME";
}

void loadScoreboard(){
  print("loading scoreboard");
  GetRequest get = new GetRequest("http://snake.timkausemann.de/leaderboard");
  get.send();
  scorelist = parseJSONArray(get.getContent());
  print(scorelist);
}

void submitscore(int score){
  String url = "http://snake.timkausemann.de/submit/"+username+"/"+score;
  GetRequest get = new GetRequest(url);
  get.send();
  place = parseJSONObject(get.getContent());
}

void loadhighscore(){
  String url = "http://snake.timkausemann.de/user/"+username;
  GetRequest get = new GetRequest(url);
  get.send();
  highscore = parseJSONObject(get.getContent());
  print(highscore);
}
