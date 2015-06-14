  Cell[][] map;
  int rows=13;
  int cols=13;
  
  PImage img;
  boolean start=true;
  int phealth;
  int round;
  int money;
  int MONSTERSLEFT;
  
  void setup(){
     size(830,650);
     map=new Cell[rows][cols];
     for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
            map[i][j] = new Cell(i*30,j*30,30,30,0);
        }
     }
   img=loadImage("Tower1.png");
  }
  
  void draw(){
    if(start){
     fill(255);
     text("Balloons Tower Defense",30,580);
     text("Press Enter to Play",30,600); 
    }
     background(200);
     for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
           map[i][j].display(j*30, i*30);
          
         }
      }
      info();

  }
  
  void placeTower(){
      if(mouseX <400 && mouseY < 400){
        if(map[mouseY/30][(mouseX)/30].getCond()==0){
          map[mouseY/30][(mouseX)/30].setCond(1);
          
        }
        
      }
      Tower T1=new Tower(0,0,0,(mouseX/30)*30,(mouseY/30)*30);
  }
  
  
  void info(){
     fill(255);
     rect(700,550,100,50);
     text("Stats", 730,550);
     text("Health"+phealth,730,580);
     text("Money"+money,730,600);
     text("Monsters Left"+MONSTERSLEFT,730,620);
     text("Round"+round,730,640);
  }
  
  void mouseClicked(){
    placeTower();    
}
  
  void keyPressed(){
   if(key==ENTER){
      start=false;
   } 
  }
  

 
 
 
 
  

