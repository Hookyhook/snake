class Player {
  float x = width/2;
  float y = height/2;
  float vx;
  float vy;
  float maxv = 3;
  
  void update(){
    checkforWall();
    rectMode(CENTER);
    x += vx;
    y += vy;
    rect(x,y,50,50);
  }
  
  void checkforWall(){
    if(x-25 <= 0 || x+25 >= width || y-25 <= 0 || y+25 >= height){
        vx = -vx; 
        vy = -vy;
    }
  }
  
  void move(String direction){
    switch (direction){
    case "DOWN":
      vy = maxv;
      vx = 0;
      break;
    case "UP":
      vy = -maxv;
      p1.vx = 0;    
      break;
    case "LEFT":
      vx = -maxv;
      vy = 0;     
      break;
    case "RIGHT":
      vx = maxv;
      vy = 0; 
      break;      
      
    }
  }
}
