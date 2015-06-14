  Cell[][] map;
  int rows=13;
  int cols=13;
  
  PImage img;
  
  
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
     background(200);
     for (int i = 0; i < rows; i++){
        for (int j = 0; j < cols; j++){
           map[i][j].display(j*30, i*30);
           /*
           if(map[i][j].getCond()==1){
              int tempx=mouseX/30;
              int tempy=mouseY/30;
              int imgx=tempx*30;
              int imgy=tempy*30;
              image(img,imgx,imgy); 
           }
           */
         }
      }
     //image(img,0,0); 
  }
  
  void placeTower(){
      if(mouseX <400 && mouseY < 400){
        if(map[mouseY/30][(mouseX)/30].getCond()==0){
          map[mouseY/30][(mouseX)/30].setCond(1);
          
        }
        
      }
      Tower T1=new Tower(0,0,0,(mouseX/30)*30,(mouseY/30)*30);
  }
  
  void mouseClicked(){
    placeTower();    
}
  
  
  

 
 
 
 
  

