class Monster{
  int speed;
  int xcor;
  int ycor;
  int damage;
  int health;
  LinkedPoint current;

  Monster( int s,int d, int h, LinkedPoint l){
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
  
  void mDisplay(){
      for (int i = 0; i < speed; i++){
          current = current.getNext();
          xcor = current.getx();
          ycor = current.gety();
      }
  }
  
}
