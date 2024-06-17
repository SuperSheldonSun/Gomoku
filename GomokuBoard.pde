public class GomokuBoard {
    int size;
    int[][] board;
    int[][] everyStep = new int[255][];
    int step = 0 ;

  public GomokuBoard(int size) {
    this.size = size;
    this.board = new int[size][size];
    initializeBoard();
  }

  private void initializeBoard() {
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        board[i][j] = 0;
      }
    }
  }

  public void printBoard(int width, int height) {
    for (int x=0; x<=width;x+=width/(size-1)){
       line(20, 20+x, width+20, x+20);
       line(20+x,20,20+x,20+height);
    }
  }
  public void printButton(float x , float y ,float w ,float h,String text){
    fill(200);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x + w/2, y + h/2);
    textAlign(LEFT, TOP);
  }  
  public void saveStone(int row, int col, int black) {
 
    int[] arr = new int[2];
    arr[0] = row;
    arr[1] = col;
    everyStep[step]= arr;
    step++;
    if (black==1)
    board[row][col] = 1;
    else
    board[row][col]=2;
  }

  public boolean regret(Player player) {
      if(player.getPenitence()<3 && step-1 >= 0 ){
        int[] arr = everyStep[step-1];
        board[arr[0]][arr[1]] = 0 ;
        step--;
        player.addPenitence();
        return true;
      }
    return false;
    
  }

  public int getSize() {
    return this.size;
  }

  public int getStone(int row, int col) {
    if (row < 0 || col < 0 || row >= size || col >= size) {
      throw new IllegalArgumentException("Invalid board position");
    }
    return board[row][col];
  }

}
