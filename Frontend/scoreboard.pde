class SCOREBOARD{
    int x;
    int y;

    SCOREBOARD(int tx,int ty){
        x=tx;
        y=ty;
        loadScoreboard();
    }

    void display(){
        pushMatrix();
        translate(x,y);

        popMatrix();
    }
}