class LinkedPoint{
   int xcor;
   int ycor;
   LinkedPoint next;
   
   LinkedPoint(int x, int y){
       xcor = x;
       ycor = y;
   }
  int getx(){
      return xcor;
  }
  int gety(){
      return ycor;
  }
   
  void setNext(LinkedPoint n){
      next = n;
  }
  LinkedPoint getNext(){
      return next;
  }
  
  
}
