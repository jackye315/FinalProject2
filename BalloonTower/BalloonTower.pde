//import java.util.concurrent;
 
  Cell[][] map;
  int rows=20;
  int cols=20;
  
  PImage img1;
  PImage img2;
  PImage img3;
  boolean start=false;
  boolean rest;
  int phealth=100;
  int round=1;
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
 boolean reachedend=false;
 int timer=0;

  Thread foo = new Thread(this);
  //foo.start();
  
  
  int value1=0;
  int value2=0;
  int value3=0;
    ArrayList<Tower> ingametowers;
  Tower[] tower;
  
  void setup(){
     size(830,650);
     money = 300;
    // Monster setup + path 
     attacking = new ArrayList<Monster>();
     oldwave = new ArrayList<Monster>();
     setpath();
     populate();

     
     
     
     // Map set up
     map=new Cell[rows][cols];
     for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
            map[i][j] = new Cell(i*30,j*30,30,30,0);
        }
     }
     settiles();
    
     ingametowers=new ArrayList<Tower>();
     tower=new Tower[5];
     int x=0;
     while(x<tower.length){
        tower[x]=new Tower(0,0,0,0,0);
        x=x+1; 
     }
   img1=loadImage("Tower1.png");
   img2=loadImage("Tower2.png");
   img3=loadImage("Tower3.png");
   rest=false;
   MONSTERSLEFT=attacking.size();
   reachedend=false;
  }
 
  void settiles(){
   for (int i =0; i <20; i++){
    for (int d = 0; d<20; d++){
      if (map[i][d].partof()){
      map[i][d].ispath();
      }
      }
      }
      }

 
  void draw(){
    if(!start){
     fill(255);
     textSize(40);
     text("Balloons Tower Defense",30,540);
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

      
   int x=0;
   while(x<ingametowers.size()){
     ingametowers.get(x).Range.clear();
     int y=0;
     while(y<attacking.size()){
        if(ingametowers.get(x).inRange(attacking.get(y))){
           ingametowers.get(x).Range.add(attacking.get(y));
        }
       y=y+1; 
     }
     ingametowers.get(x).Shoot();
     if(ingametowers.get(x).Range.size()>0){
     float bulletX=ingametowers.get(x).xcor;
     float bulletY=ingametowers.get(x).ycor;
     fill(255);
     //rotate((float)ingametowers.get(x).turnangle());
     int q=0;
     while(q<50){// ingametowers.get(x).findtarget().xcor != bulletX || ingametowers.get(x).findtarget().ycor != bulletY){
       
       ellipse(bulletX,bulletY,2,15);
     if(Math.abs(ingametowers.get(x).findtarget().xcor-bulletX)>0){
         if(ingametowers.get(x).findtarget().xcor>bulletX){
            bulletX=bulletX+15;
         }
         if(ingametowers.get(x).findtarget().xcor<bulletX){
            bulletX=bulletX-15;
         }
     }
     if(Math.abs(ingametowers.get(x).findtarget().ycor-bulletY)>0){
         if(ingametowers.get(x).findtarget().ycor>bulletY){
            bulletY=bulletY+15;
         }
         if(ingametowers.get(x).findtarget().ycor<bulletY){
            bulletY=bulletY-15;
         }
     }
     q=q+1;
     }
     }
     //ellipse(bulletX,bulletY,5,20);
     MONSTERSLEFT=attacking.size();
     x=x+1;
   }
   
   //MONSTERSLEFT=attacking.size();
   // monster
   timer=timer+1;

  if (attacking.size() != 0){
    if(timer>1){
        for (int i =0; i < attacking.size(); i++){
            //TimeUnit.SECONDS.sleep(10);
/*
try {
            foo.sleep(10);
       }
     catch (InterruptedException e) {
       e.printStackTrace();
       }

            int z=0;
       while(z<attacking.size()){
         x=x+50;
       }     
             */
            int  d = attacking.size();
            attacking.get(i).display();
            if (attacking.size() < d){
              
              i-=1;
               
              counter += 1;
            }

         }

    }

  }
   if (attacking.size() == 0){
     if(rest==true){
     fill(255,0,0);
     textSize(20);
     text("Continue to next wave? Click Enter to Continue", 600,180);
     text("Click Enter to Continue", 600,205);
     }
     else{
    nextwave();
    round=round+1;
    oldwave.clear();
     }
        
   }
   if(phealth<=0){
      fill(255);
      rect(0,0,890,650);
      fill(0);
      textSize(30);
      text("You Lost!",330,300);
      //text("Press 'Y'to play again",300,330); 
        //if(key=='Y'){
         //start=false; 
        //}
   }
   //Monsterdamage();
  //System.out.println(attacking.get(1).health);
//System.out.println(attacking.get(0).health);
//System.out.println(ingametowers.size()); 
//System.out.println(attacking.size());    
System.out.println(oldwave.size());
System.out.println(start);
if(phealth<=0){
 start=false; 
}
  }
  }
  
  void placeTower(){

      if(money>=50){
        if(mouseX <600 && mouseY < 600){
          if(map[mouseY/30][(mouseX)/30].getCond()==0 && map[mouseY/30][mouseX/30].canbuild==true){
            if(key=='1'){
              map[mouseY/30][(mouseX)/30].setCond(1);
                  if(ingametowers.size()==0){
                    ingametowers.add(new Tower(90,300,1000,(mouseX/30)*30,(mouseY/30)*30));
                    money=money-50;
                   }
                    else{
          int x=0;
          while(x<ingametowers.size()){
            if(ingametowers.get(x).xcor != (mouseX/30)*30 || ingametowers.get(x).ycor != (mouseY/30)*30){
                ingametowers.add(new Tower(90,300,1000,(mouseX/30)*30,(mouseY/30)*30));
                money=money-50;
                x=x+ingametowers.size();
            }
            x=x+1;
          }
          }
            }
            if(key=='2'){
              map[mouseY/30][(mouseX)/30].setCond(2);
                  if(ingametowers.size()==0){
                      ingametowers.add(new Tower(60,700,1000,(mouseX/30)*30,(mouseY/30)*30));
                      money=money-50;
                  }
                   else{
          int x=0;
          while(x<ingametowers.size()){
            if(ingametowers.get(x).xcor != (mouseX/30)*30 || ingametowers.get(x).ycor != (mouseY/30)*30){
                ingametowers.add(new Tower(60,700,1000,(mouseX/30)*30,(mouseY/30)*30));
                money=money-50;
                x=x+ingametowers.size();
            }
            x=x+1;
          }
          }
            }
            if(key=='3'){
              map[mouseY/30][(mouseX)/30].setCond(4);
                  if(ingametowers.size()==0){
                      ingametowers.add(new Tower(120,200,1000,(mouseX/30)*30,(mouseY/30)*30));
                      money=money-50;
                    }
                     else{
          int x=0;
          while(x<ingametowers.size()){
            if(ingametowers.get(x).xcor != (mouseX/30)*30 || ingametowers.get(x).ycor != (mouseY/30)*30){
                ingametowers.add(new Tower(120,200,1000,(mouseX/30)*30,(mouseY/30)*30));
                money=money-50;
                x=x+ingametowers.size();
            }
            x=x+1;
          }
          }
            }
          
        
  
          
         
        }
        }
    }

  
  
  
  }
  
  
  void info(){
     fill(255);
     //rect(700,550,100,50);
     fill(0,102,153);
     textSize(20);
     text("Stats", 630,50);
     text("Health: "+phealth,630,80);
     text("Money: "+money,630,100);
     text("Monsters Left: "+attacking.size(),630,120);
     text("Round: "+round,630,140);
  }
  
  void towertypes(){    
   fill(0);               
   rect(620,300,200,200);
   fill(0,102,153);
   text("Press '1','2', or '3'",630,520);
   //text("To Choose Between Towers",600,540);
   
   fill(255);
   text("Tower 1", 670,350);
   fill(value1);
   rect(635,330,30,30);
   
   fill(255);   
   text("Tower 2", 670,400);
   fill(value2);
   rect(635,380,30,30);  
   
   fill(255);   
   text("Tower 3", 670,450);
   fill(value3);
   rect(635,430,30,30);        
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
      rest=!rest;
   }
   if(key=='1'){
     value1=255;
     value2=0;
     value3=0;
   }
if(key=='2'){
     value2=255;
     value1=0;
     value3=0;
   }
 if(key=='3'){
     value3=255;
     value1=0;
     value2=0;
   }
   if(key=='y' || key=='Y'){
     start=false;
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
while (y <= 555){
  y +=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance +=1;

}
while (x<=600){
  x+=1;
  current.setNext(new LinkedPoint(x,y));
  current = current.getNext();
  totaldistance +=1;

}
}

void Monsterdamage(){
  int x=0;
  while(x<attacking.size()){
      if(attacking.get(x).xcor>599 && attacking.get(x).ycor>550){
         reachedend=true;
         phealth=phealth-1;
      } 
      x=x+1;
  }

}

void nextwave(){
  rest=true;
    setfitness();
    findtotfit();
      ArrayList<Monster> population = new ArrayList<Monster>();

    for (int e =0; e < popsize; e++){
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
    for (int i =0; i<17; i++){
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
    
    newp.add(new Monster(rn.nextInt(2)+1,10000, rn.nextInt(255),rn.nextInt(255),rn.nextInt(255)));

  }
  attacking = newp;
  //oldwave=attacking;
}
 
  

