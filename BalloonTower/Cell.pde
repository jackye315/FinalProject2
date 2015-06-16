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
   blue = 102;
   green = 153;
   canbuild = false;
   }
   
   boolean partof(){
   if (x < 15 && y >= 15 && y <=165){
    return true;
    }
  else if (y>130 && y < 167 && x >= 15 && x <=135){
   return true;
   }
   else if (x>105 && x < 135 && y >=15 && y <=165){
   return true;
   }
  else if (y>15 && y < 45 && x >= 135 && x <= 225){
   return true;
   }
   else if (x>195 && x < 225 && y <= 375 && y>= 45){
    return true;
    }
    else if (y>345 && y < 375 && x <= 465 && x >= 225){
    return true;
    }
  else  if (x> 435 && x < 465 && y <= 345 && y >=45){
    return true;
    }
  else  if (y>45 && y < 75 && x<=555 && x >= 465){
    return true;
    }
  else if( x< 555 && x > 525 && y >= 75 && y<=600){
  return true;
  }
  return false;
 
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

