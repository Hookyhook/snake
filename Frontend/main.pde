import http.requests.*;

PShape bomb;
PShape grape;
PShape watermelon;
PShape snake_head;
PShape snake_body;
PShape snake_tail;

JSONArray scorelist = new JSONArray();
JSONObject place = new JSONObject();
JSONObject highscore = new JSONObject();

String username = "testclient";

void setup() {
  size(400, 400);       // Set the size of the game window
  frameRate(45);        // Set the frame rate of the game
  bomb = loadShape("./assets/pickable_bomb.svg");
  grape = loadShape("./assets/pickable_grape.svg");
  watermelon = loadShape("./assets/pickable_watermelon.svg");
  snake_head = loadShape("./assets/snake_head.svg");
  snake_body = loadShape("./assets/snake_body.svg");
  snake_tail = loadShape("./assets/snake_tail.svg");
}

GAME g1 = new GAME();   // Create an instance of the GAME class
GAMEOVER go1 = new GAMEOVER();
MAINMENU m1 = new MAINMENU();
String status = "GAME";
int score = 0;



void draw() {
  background(255);      // Set the background color to white
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
  GetRequest get = new GetRequest("http://snake.timkausemann.de/leaderboard");
  get.send();
  scorelist = parseJSONArray(get.getContent());
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