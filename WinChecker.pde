public class WinChecker {
  private GomokuBoard board;

  public WinChecker(GomokuBoard board) {
    this.board = board;
  }

  public boolean hasWon(Player a) {
    return checkRows(a) || checkColumns(a) || checkDiagonals(a);
  }

  private boolean checkRows(Player a) {
    for (int i = 0; i < board.getSize(); i++) {
      int count = 0;
      for (int j = 0; j < board.getSize(); j++) {
        if (board.getStone(i, j) == a.stone) {
          count++;
          if (count == 5)
            return true;
        } else {
          count = 0;
        }
      }
    }
    return false;
  }

  private boolean checkColumns(Player a) {
    for (int j = 0; j < board.getSize(); j++) {
      int count = 0;
      for (int i = 0; i < board.getSize(); i++) {
        if (board.getStone(i, j) == a.stone) {
          count++;
          if (count == 5)
            return true;
        } else {
          count = 0;
        }
      }
    }
    return false;
  }

  private boolean checkDiagonals(Player a) {
    return checkMajorDiagonal(a) || checkMinorDiagonal(a);
  }

  private boolean checkMajorDiagonal(Player a) {
    for (int i = 0; i <= board.getSize() - 5; i++) {
      for (int j = 0; j <= board.getSize() - 5; j++) {
        if (checkDiagonalFrom(i, j, a, 1)) {
          return true;
        }
      }
    }
    return false;
  }

  private boolean checkMinorDiagonal(Player a) {
    for (int i = 0; i <= board.getSize() - 5; i++) {
      for (int j = 4; j < board.getSize(); j++) {
        if (checkDiagonalFrom(i, j, a, -1)) {
          return true;
        }
      }
    }
    return false;
  }

  private boolean checkDiagonalFrom(int row, int col, Player a, int direction) {
    int count = 0;
    for (int i = 0; i < 5; i++) {
      if (board.getStone(row + i, col + i * direction) == a.stone) {
        count++;
        if (count == 5)
          return true;
      } else {
        break;
      }
    }
    return false;
  }
}


//    private boolean checkDiagonals(char player) {
//        return checkMajorDiagonal(player) || checkMinorDiagonal(player);
//    }

//    private boolean checkMajorDiagonal(char player) {
//        for (int i = 0; i <= board.getSize() - 5; i++) {
//            for (int j = 0; j <= board.getSize() - 5; j++) {
//                if (checkDiagonalFrom(i, j, player, 1)) {
//                    return true;
//                }
//            }
//        }
//        return false;
//    }

//    private boolean checkMinorDiagonal(char player) {
//        for (int i = 0; i <= board.getSize() - 5; i++) {
//            for (int j = 4; j < board.getSize(); j++) {
//                if (checkDiagonalFrom(i, j, player, -1)) {
//                    return true;
//                }
//            }
//        }
//        return false;
//    }

//    private boolean checkDiagonalFrom(int row, int col, char player, int direction) {
//        int count = 0;
//        for (int i = 0; i < 5; i++) {
//            if (board.getStone(row + i, col + i * direction) == player) {
//                count++;
//                if (count == 5) return true;
//            } else {
//                break;
//            }
//        }
//        return false;
//    }
//}
