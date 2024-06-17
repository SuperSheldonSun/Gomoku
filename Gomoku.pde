GomokuBoard board;
int width=490;
int height=490;
int x=0;
int y=0;
int size=15;
int black=1;
boolean isStartGame = false ;
Player a;
Player b;
WinChecker check;
boolean gameended=false;
PImage backgroundImage;
boolean isAI = false;
AiMove aiMove = new AiMove();


void setup()
  {
    backgroundImage = loadImage("background.jpg");
    tint(255,160);
    //background(255,255,255);
    size(800,550);
    textSize(20);
    fill(0,0,0);
    textSize(20);
    board= new GomokuBoard(size);
    a=new Player("player1", 1);
    b=new Player("player2", 2);
    check=new WinChecker(board);
    
  }
  
  public void draw(){
     background(255);  
     
     if(!isStartGame){
       board.printButton(300,150,200,50,"Player To Player");
       board.printButton(300,350,200,50,"Player To Machine");
       return;
     }
     if (backgroundImage != null) {
       image(backgroundImage, 0, 0, 550,550);
     }
     stroke(0);
     board.printBoard(width, height);
     fill(0);
     text("Gomoku \nPlayer1 plays black chess \nPlayer2 plays white chess\nCurrent Turn:"+(black==1? "Black":"White"), 570, 50);
     if(!isAI){
       board.printButton(570,300,150,50,"regret");
     }
     for (int i=0; i<size; i++){
       for (int c=0; c<size; c++){
         if (board.board[i][c]==1){
            int xP=i*35+20;
            int yP=c*35+20;
           
            fill(0);
            ellipse(xP,yP,20,20);}
            
          
          if (board.board[i][c]==2){
             int xP=i*35+20;
             int yP=c*35+20;
             fill(255,255,255);
             ellipse(xP,yP,20,20);
             
           }
       }
     }
     
     if(check.hasWon(a)){
         textSize(50);
         fill(255,0,0);
         text("THE GAME IS OVER. \nPLAYER 1 WINS THE GAME! \nCLICK TO RESTART!", 200, 100);
         noLoop();
         gameended=true;
         textSize(20);
         fill(0);
     }
     
     if(check.hasWon(b)){
         textSize(50);
         fill(255,0,0);
         text("THE GAME IS OVER. \nPLAYER 2 WINS THE GAME! \nCLICK TO RESTART.", 200, 100);
         noLoop();
         gameended=true;
         textSize(20);
         fill(0);
     }
  }
  
  void mousePressed(){
     x=mouseX;
     y=mouseY;
     if(!isStartGame){
       //       board.printButton(300,150,200,50,"Player To Player");
       //board.printButton(300,350,200,50,"Player To Machine");
       if(mouseX >300 && mouseX < 500 && mouseY > 150 && mouseY < 200){
         isStartGame = true;
       }
       
       if(mouseX >300 && mouseX < 500 && mouseY > 350 && mouseY < 400){
         isStartGame = true;
         isAI = true;
       }
     }else{
       if (x>=20 && x<=20+width && y>=20 && y<=20+height){
        if ((x-20)%(width/(size-1))>17){
          x=(x-20)/35+1;}
        else{
          x=(x-20)/35;}
        
        if ((y-20)%(width/(size-1))>17){
          y=(y-20)/35+1;}
        else{
          y=(y-20)/35;}
          
        if (board.board[x][y]==0){
          board.saveStone(x,y,black);
          black*=-1;
        }
        if(isAI){
          Point point = aiMove.getMoveLocation(board.board,2,1);
          board.saveStone(point.getX(),point.getY(),black);
          black*=-1;
        }
     }
    if(mouseX >570 && mouseX < 720 && mouseY > 300 && mouseY < 350){
        if(board.regret(black==1 ? a:b)){
          black*=-1;
        }  
        
    }
      
      if(gameended==true){
        gameended=false;
        board.initializeBoard();
      }
     }
     loop();
   }

     
     
     
     
     
     
