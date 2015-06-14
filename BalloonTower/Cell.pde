class Cell{
    
  float x, y;
  float w, h;
  int cond;


  Cell(float tempX, float tempY, float tempW, float tempH, int c){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    cond = c;
  }
  
  void display(int x, int y){
    fill(100, 100, 100);
    if(this.cond == 1){
      fill(0, 0, 0, 0);
      image(img,x,y,30,30);
      
    }
    if(this.cond == 3){
      fill(0, 102, 153, 100);
    }
    stroke(225);
    rect(x,y,30,30);
  }
  

  
  
  void setCond(int c){
    cond = c;
  }
  
  int getCond(){
    return cond;
  }
  
}

