void setup(){
    size(400,400);
    frameRate(60);
}
Player p1 = new Player();
void draw(){
  background(255);
  p1.update();
}

void keyPressed(){

   switch (keyCode){
    case 40:
      p1.move("DOWN");  
      break;
    case 38:
      p1.move("UP");      
      break;
    case 37:
      p1.move("LEFT");      
      break;
    case 39:
      p1.move("RIGHT"); 
      break;      
      
    }
}
