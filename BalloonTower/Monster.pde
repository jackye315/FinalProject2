class Monster{
  int speed;
  int xcor;
  int ycor;
  int damage;
  int health;
  LinkedPoint current;

  Monster( int s, int d, int h, LinkedPoint l){
      speed = s;
      damage = d;
      health = h;
      current = l;
      xcor = current.getx();
      ycor = current.gety();
  }
  
  void takedamage(int i){
  health -=i;
  }
  
  void display(){
    if (health <= 0){
      population.remove(this);
    }
    else{
             for (int i = 0; i < speed; i++){
               if (current.getNext() == null){
        }
        
        else{
          current = current.getNext();
          xcor = current.getx();
          ycor = current.gety();
          ellipse(xcor, ycor, 20, 20);
        
      }
      }
  
  }
  }
  
  
}
