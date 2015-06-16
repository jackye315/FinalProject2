class Cell{
    
  float x, y;
  float w, h;
  int cond;
  boolean canbuild;
  int red;
  int blue;
  int green;


  Cell(float tempX, float tempY, float tempW, float tempH, int c){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    red = 100;
    blue = 100;
    green = 100;
    cond = c;
    canbuild = true;
  }
  void ispath(){
   red= 0;
   blue = 0;
   green = 0;
   canbuild = false;
   }
   
  
  void display(int x, int y){
    fill(red, blue, green);
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

