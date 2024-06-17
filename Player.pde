public class Player {
  private String name;
  private double time;
  private int stone;
  private int  penitence  ;

  public Player(String name, int num) {
    this.name = name;
    this.time = 0;
    this.stone = num;
  }

  public String getName() {
    return this.name;
  }

  public int getStone() {
    return this.stone;
  }

  public void addPenitence(){
    this.penitence++;
  }
  
  public int getPenitence(){
    return this.penitence;
  }

}
