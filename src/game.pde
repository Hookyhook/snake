class GAME {
  Player p1 = new Player();
  float numberofpickables = 5;
  int score = 0;
  ArrayList <pickable> pickables = new ArrayList<pickable>();
  GAME(){
  for(int i = 0; i<numberofpickables; i++){
    pickables.add(new pickable());
  }
  score = 0;
  }
  void update(){
    
    PlayerPicksUp();
    p1.update();
    for(int i = 0; i<numberofpickables; i++){
    pickables.get(i).update();
    fill(0);
    textSize(14);
    textAlign(CENTER);
    text("Score: " + score, 30,15);
    fill(255);
    
  }
  }
  void PlayerPicksUp(){
    for(int i = 0; i<numberofpickables; i++){
    if(dist(pickables.get(i).x,pickables.get(i).y,p1.x,p1.y)< p1.size/2+pickables.get(i).size/2+10){
    pickables.get(i).reposition();
    score++;
  }
  }
  
}
}
