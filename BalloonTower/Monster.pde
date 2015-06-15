import java.util.*;
class Monster{
  int speed;
  int xcor;
  int ycor;
  int health;
  int redcolor;
  int bluecolor;
  int greencolor;
  LinkedPoint current;
  int fitness;

  Monster( int s, int h, LinkedPoint l, int r, int b, int g){
      speed = s;
      health = h;
      current = l;
      xcor = current.getx();
      ycor = current.gety();
      redcolor = r;
      bluecolor = b;
      greencolor = g;
  }
  
  Monster mate (Monster other, LinkedPoint l){
    Random rn = new Random();
    int s;
    int h;
    int r;
    int g;
    int b;
      if (rn.nextInt(2) == 0){
          s = other.speed;
      }
      else {
        s = speed;
      }
      if (rn.nextInt(2) == 0){
          h = other.health;
      }
      else {
          h = health;
      }
      if (rn.nextInt(2) == 0){
          r = other.redcolor;
      }
      else {
        r = redcolor;
      }
      if (rn.nextInt(2) == 0){
          g = other.greencolor;
      }
      else {
          g = greencolor;
      }
      if (rn.nextInt(2) == 0){
          b = other.bluecolor;
      }
      else{
          b = bluecolor;
        }
       
    Monster m = new Monster( s,h,l,r,g,b);
  return m;
  }
  void setFit(Monster best){
      double fit = 100.0;
      fit -= abs(best.speed - this.speed/10) * 50;
      fit -= abs(best.health - this.health/30)*50;
  }
    
  
  void takedamage(int i){
  health -=i;
  }
  
  void display(){
    if (health <= 0){
      attacking.remove(this);
    }
    else{
             for (int i = 0; i < speed; i++){
               if (current.getNext() == null){
                   attacking.remove(this);
                  hp -= 10; 
               }
        
        else{
          current = current.getNext();
          xcor = current.getx();
          ycor = current.gety();
          ellipse(xcor, ycor, 20, 20);
          fill(redcolor, greencolor, bluecolor);
        
      }
      }
  
  }
  }
  
  
}
