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
  double fitness;
  double distance;

  Monster(int s, int h, int r, int b, int g){
      speed = s;
      health = h;
      current = startloc;
      xcor = current.getx();
      ycor = current.gety();
      redcolor = r;
      bluecolor = b;
      greencolor = g;
      distance = 0;
  }
  
  Monster mate (Monster other){
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
      
       
    Monster m = new Monster( s,h,r,g,b);
  return m;
  }
  void setFit(){
      double fit = 100.0;
      fit -= (totaldistance -distance) + (0/totaldistance*100);
      fitness = fit;
  }
  
  void clearfit(){
    fitness =0;
  }
    
 double getfit(){
     return fitness;
 }
  
  void display(){
    if (health <= 0){
      oldwave.add(this);
      this.current = startloc;
      attacking.remove(this);
      
    }
    else{
             for (int i = 0; i < speed; i++){
               if (current.getNext() == null){
                 ellipse(xcor,ycor,20,20);
                 this.current = startloc;
                oldwave.add(this);
                attacking.remove(this);
                
               }
        
        else{
          current = current.getNext();
          distance +=1;
          xcor = current.getx();
          ycor = current.gety();
          ellipse(xcor, ycor, 20, 20);
          fill(redcolor, greencolor, bluecolor);
        
      }
      }
  
  }
  }
  
  
}
