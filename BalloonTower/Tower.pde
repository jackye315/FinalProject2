import java.util.*;

class Tower{
  int range; //Distance Tower can fire ito
  int fdamage; //fire damage
  int frate;  //Fire rate
  int xcor;
  int ycor; 
  int money=50;
  ArrayList<Monster> Range=new ArrayList<Monster>();  //ArrayList of all monsters in Tower's range
  Monster M=new Monster(0,0,0,0,0);;
  
  Tower(int r, int fd, int fr, int x, int y){
    range=r;
    fdamage=fd;
    frate=fr;
    xcor=x;
    ycor=y;
  }
  
  Monster findtarget(){
     int x=0;
     //if(Range.size()>0){
         Monster target=Range.get(0);
         while(x<Range.size()){
           if(Distance(target)<Distance(Range.get(0))){
            target=Range.get(0); 
           }
           x=x+1;
         }
         return target; 
      //}
   //return M;
  }
  
  int Distance(Monster M){
   return (int) Math.sqrt(Math.abs(M.xcor-this.xcor)*Math.abs(M.xcor-this.xcor)+Math.abs(M.ycor-this.ycor)*Math.abs(M.ycor-this.ycor)); 
  }
  
  boolean inRange(Monster M){
      return (Distance(M)<range);
  }
  
  ArrayList AllinRange(){
      //Range=new ArrayList();
        if (inRange(M)){
           Range.add(M);
        }
        return Range;
  }
  
  double turnangle(){
    int x=findtarget().xcor-this.xcor;
    int y=findtarget().ycor-this.ycor;
    return Math.atan((double)x/y);
  }
  
  void Shoot(){
    if(Range.size()>0){
     findtarget().health=findtarget().health-fdamage; 
    }
  }
  
  
  
  
  
  
  
}
