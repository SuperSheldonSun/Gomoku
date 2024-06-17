public class AiMove {

    int INFINITY = 999999999;
    
    String[][] SCORE = new String[30][];

    public AiMove(){
        SCORE[0]  = new String[]{"11111","2147483647"};
        SCORE[1]  = new String[]{"011110","1000000"};
        SCORE[2]  = new String[]{"001110","10000"};
        SCORE[3]  = new String[]{"011100","10000"};
        SCORE[4]  = new String[]{"010110","10000"};
        SCORE[5]  = new String[]{"011010","10000"};
        SCORE[6]  = new String[]{"11110","8000"};
        SCORE[7]  = new String[]{"01111","8000"};
        SCORE[8]  = new String[]{"10111","8000"};
        SCORE[9]  = new String[]{"11011","8000"};
        SCORE[10]  = new String[]{"11101","8000"};
        SCORE[11]  = new String[]{"001112","1000"};
        SCORE[12]  = new String[]{"010112","1000"};
        SCORE[13]  = new String[]{"011012","1000"};
        SCORE[14]  = new String[]{"211100","1000"};
        SCORE[15]  = new String[]{"211010","1000"};
        SCORE[16]  = new String[]{"001100","800"};
        SCORE[17]  = new String[]{"011000","800"};
        SCORE[18]  = new String[]{"000110","800"};
        SCORE[19]  = new String[]{"011200","50"};
        SCORE[20]  = new String[]{"001120","50"};
        SCORE[21]  = new String[]{"002110","50"};
        SCORE[22]  = new String[]{"021100","50"};
        SCORE[23]  = new String[]{"001010","50"};
        SCORE[24]  = new String[]{"010100","50"};
        SCORE[25]  = new String[]{"001200","10"};
        SCORE[26]  = new String[]{"002100","10"};
        SCORE[27]  = new String[]{"020100","10"};
        SCORE[28]  = new String[]{"000210","10"};
        SCORE[29]  = new String[]{"000120","10"};
    }
    
    


    public Point getMoveLocation(int[][] map , int type ,int opponentType) {
        Point best = null;

        int score = -INFINITY;
  
        for (int i = 0; i < map.length; i++) {
            for (int j = 0; j < map[i].length; j++) {
                if (map[i][j] != 0) {
                    continue;
                }

                Point p = new Point(i, j, type);

                int val = evaluate(p,map) + evaluate(new Point(i, j, opponentType),map);

                if (val > score) {                
                    score = val;
                    best = p;
                }
            }
        }

        return best;
    }

    public int evaluate(Point point,int[][] map) {

        int score = 0;

        for (int i = 1; i < 5; i++) {
           
            String situation = getSituation(point, i,map);
       
            score += getScore(situation);
        }

        return score;
    }


      
     
        private int getScore(String situation) {
            for (String[] arr : SCORE) {
                if(situation.contains(arr[0])){
                    return Integer.valueOf(arr[1]);
                }
            }
            return 0;
        }


    public String getSituation(Point point, int direction,int[][] map) {
       
        direction = direction * 2 - 1;
       
        StringBuilder sb = new StringBuilder();
        appendChess(sb, point, direction, 4,map);
        appendChess(sb, point, direction, 3,map);
        appendChess(sb, point, direction, 2,map);
        appendChess(sb, point, direction, 1,map);
        sb.append(1); 
        appendChess(sb, point, direction + 1, 1,map);
        appendChess(sb, point, direction + 1, 2,map);
        appendChess(sb, point, direction + 1, 3,map);
        appendChess(sb, point, direction + 1, 4,map);
        return sb.toString();
    }


    public void appendChess(StringBuilder sb, Point point, int direction, int offset,int[][] map) {
        int chess = relativePoint(point, direction, offset,map);
        if (chess > -1) {
            if (point.getType() == 2) {
                if (chess > 0) {
                    chess = 3 - chess;
                }
            }
            sb.append(chess);
        }
    }


    public int relativePoint(Point point, int direction, int offset,int[][] map) {
        int x = point.getX(), y = point.getY();
        switch (direction) {
            case 1:
                x -= offset;
                break;
            case 2:
                x += offset;
                break;
            case 3:
                y -= offset;
                break;
            case 4:
                y += offset;
                break;
            case 5:
                x += offset;
                y -= offset;
                break;
            case 6:
                x -= offset;
                y += offset;
                break;
            case 7:
                x -= offset;
                y -= offset;
                break;
            case 8:
                x += offset;
                y += offset;
                break;
        }

        if (x < 0 || y < 0 || x >= map.length || y >= map[0].length) {

            return -1;
        }

        return map[x][y];
    }
}
