  Cell[][] map;
  int rows=13;
  int cols=13;
  
  PImage img;
  boolean start=false;
  int phealth;
  int round;
  int money;
  int MONSTERSLEFT;
  ArrayList<Monster> attacking;
  ArrayList<Monster> oldwave;
  double totalfitness;
  double totaldistance;
  int counter;
  LinkedPoint startloc;
 int popsize = 17;
 int wavenumber;

  
  
  
  
  
  Tower[] tower;
  
  void setup(){
     size(830,650);
    money = 300;
    // Monster setup + path 
       attacking = new ArrayList<Monster>();
    oldwave = new ArrayList<Monster>();
    setpath();
     populate();
    settiles();
    
     
     
     
     // Map set up
     map=new Cell[rows][cols];
     for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
            map[i][j] = new Cell(i*30,j*30,30,30,0);
        }
     }
     tower=new Tower[5];
     int x=0;
     while(x<tower.length){
        tower[x]=new Tower(0,0,0,0,0);
        x=x+1; 
     }
   img=loadImage("Tower1.png");
  }
  
  settiles(){
   for (int i =0; i <Cell.lenght; i++){
    for (int d = 0; d<Cell[0].length; d++){
      if (Cell[i][d].partof()){
      Cell[i][d].ispath();
      }
      }
      }
      }

  
  void draw(){
    if(!start){
     fill(255);
     text("Balloons Tower Defense",30,580);
     text("Press Enter to Play",30,600); 
    }
    if (start){
     background(200);
     for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
           map[i][j].display(j*30, i*30);
          
         }
      }
      info();
      towertypes();

   // monster
  if (attacking.size() != 0){
        for (int i =0; i < attacking.size(); i++){
          int  d = attacking.size();
          attacking.get(i).display();
          if (attacking.size() < d){
            
            i-=1;
             
            counter += 1;
          }
         }
   }
   if (attacking.size() == 0){
    nextwave();
 
        
   }
  
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
  
  void towertypes(){
   fill(255);
   rect(600,450,100,50);
   text("Tower 1", 630,460);
   rect(650,460,10,10);   
  }
  
  Tower chooseTower(){
     if(mouseX>650 && mouseX<660 && mouseY>460 && mouseY<470){
      return tower[0];
     }
    return tower[0]; 
  }
  
  void mouseClicked(){
    placeTower(); 
    chooseTower();   
}
  
  void keyPressed(){
   if(key==ENTER){
      start=true;
   } 
  }
   // Monster methods
   void setpath(){
  int x =10;
  int y =10;
 startloc = new LinkedPoint(5,5);
 LinkedPoint current = startloc;
 while (x<= 165){
   x+= 1;
   current.setNext(new LinkedPoint(x,y));
   current = current.getNext();
   totaldistance +=1;
 }
 while (y <= 135){
     y +=1;
     current.setNext(new LinkedPoint(x,y));
    current = current.getNext();
    totaldistance +=1;
}
while (x>=45){
  x-=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance +=1;
}
while (y <= 225){
   y+=1;
   current.setNext(new LinkedPoint(x,y));
   current = current.getNext();
   totaldistance+=1;
}
while (x <=375){
  x+=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance+=1;
}
while (y<=465){
  y+=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance += 1;
}
while (x>= 75){
  x-=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance +=1;
}
while (y <= 465){
  y +=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance +=1;
}
while (x<=315){
  x+=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance +=1;
}
while (y<= 555){
  y+=1;
  current.setNext(new LinkedPoint (x,y));
  current = current.getNext();
  totaldistance +=1;
}
}

void nextwave(){
    setfitness();
    findtotfit();
      ArrayList<Monster> population = new ArrayList<Monster>();

    for (int e =0; e < oldwave.size(); e++){
        population.add(select().mate(select()))  ;
    }
    
    for (int i =0; i<oldwave.size(); i++){
      oldwave.remove(i);
    }
    
  for  (int l = 0; l< population.size() ; l++){
    population.get(l).clearfit();
  }
  attacking = population;
  }
  
  
  void setfitness(){
    for (int i =0; i< oldwave.size(); i++){
       oldwave.get(i).setFit();
    }
    
  }
  void findtotfit(){
    totalfitness =  0;
    for (int i =0; i <oldwave.size(); i++){
      totalfitness += oldwave.get(i).fitness;
    }
  }
  Monster select(){
    Random rn = new Random();
    double goal = totalfitness *rn.nextDouble();
    double current = 0;
    for (int i =0; i<36; i++){
        current += oldwave.get(i).getfit();
        if (current >= goal){
            return  oldwave.get(i);
        }
    }
    return oldwave.get(rn.nextInt(15));
  }
     
  
   

void populate(){
  ArrayList<Monster> newp = new ArrayList<Monster>();
    Random rn = new Random();
  for (int i = 0; i < popsize; i++){
    
    newp.add(new Monster(1,1, rn.nextInt(255),rn.nextInt(255),rn.nextInt(255)));

  }
  attacking = newp;
}


  
  

 
 
 
 
  

