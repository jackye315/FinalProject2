class Monster{
  int speed;
  int xcor;
  int ycor;
  int damage;
  int health;
  LinkedPoint current;

  Monster( int s, int x, int y, int d, int h, LinkedPoint l){
      speed = s;
      xcor = x;
      ycor = y;
      damage = d;
      health = h;
      current = l;
  }
  
  void takedamage(int i){
  health -=i;
  }
  
  void move(){
      for (int i = 0; i < speed; i++){
          current = current.getNext();
          xcor = current.getx();
          ycor = current.gety();
      }
  }
  
}
