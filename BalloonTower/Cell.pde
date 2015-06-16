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
   green = 0
   canbuild = false;
   }
   
   boolean partof(){
   if (y == 15 && x >= 15 && x <=165){
    return true;
    }
  else if (x = 165 && y >= 15 && y <=135){
   return true;
   }
   else if (y == 135 && x >=45 && x <=165){
   return true;
   }
  else if (x == 45 && y >= 135 && y <= 225){
   return true;
   }
   else if (y == 225 && x <= 375 && x>= 45){
    return true;
    }
    else if (x == 375 && y <= 465 && y >= 225){
    return true;
    }
  else  if (y == 465 && x <= 315 && x >=75){
    return true;
    }
  else  if (x == 315 && y<=555 && y >= 465){
    return true;
    }
 
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

