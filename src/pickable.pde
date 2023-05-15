class pickable {
  float x;
  float y;
  String type;
  float size = 20;
  
  
  pickable(){
    reposition();
  }

  void update(){
    ellipse(x,y,size,size);
  }
  
  void reposition(){
    x = random(width-size)+size/2;
    y = random(height-size)+size/2;
  }
      

}
