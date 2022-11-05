import 'dart:math';

class Board {
  int size = 15;
  var rows = List.generate(15, (index) => List<String>.filled(15, '.'));
  var _gameBoard;

  get gameBoard => _gameBoard;

  int get getSize {
    return this.size;
  }

  set gameBoard(gameBoard) {
    _gameBoard = gameBoard;
  }

  Board(this.size);

  static Board generateBoard(size) {
    var board = List.generate(
        size, (i) => List.filled(size, '.', growable: false),
        growable: false);
    return Board(size);
  }

  int checkSpot(int x, int y, String player) {
    int northCap;
    int eastCap;
    int southCap;
    int westCap;
    if (x < 5) {
      northCap = x - 1;
    } else {
      northCap = 4;
    }
    if (y < 5) {
      westCap = y - 1;
    } else {
      westCap = 4;
    }
    if (x + 4 > 15) {
      southCap = 15 - x;
    } else {
      southCap = 4;
    }
    if (x + 4 > 15) {
      eastCap = 15 - y;
    } else {
      eastCap = 4;
    }

    if (rows[x - 1][y - 1] != '.') {
      return 0;
    } else {
      rows[x - 1][y - 1] = player;
      
      print(checkDirectionUpTo(x - 1, y - 1, min(eastCap, northCap), 'NE'));
      print(checkDirectionUpTo(x - 1, y - 1, min(westCap, southCap), 'SW'));
      print(min(westCap, southCap));

      if (checkDirectionUpTo(x - 1, y - 1, northCap, 'N') +
              checkDirectionUpTo(x - 1, y - 1, southCap, 'S') ==
          4) {
        return 2;
      }
      if (checkDirectionUpTo(x - 1, y - 1, eastCap, 'E') +
              checkDirectionUpTo(x - 1, y - 1, westCap, 'W') ==
          4) {
        return 2;
      }
      if (checkDirectionUpTo(x - 1, y - 1, min(eastCap, northCap), 'NE') +
              checkDirectionUpTo(x - 1, y - 1, min(westCap, southCap), 'SW') ==
          4) {
        return 2;
      }
      if (checkDirectionUpTo(x - 1, y - 1, min(westCap, northCap), 'NW') +
              checkDirectionUpTo(x - 1, y - 1, min(eastCap, southCap), 'SE') ==
          4) {
        return 2;
      }
    }
    return 1;
  }

  int checkDirectionUpTo(int x, int y, int n, String dir) {
    int count = 0;
    if (dir == 'SE') {
      for (int i = 1; i <= n; i++) {
        if (rows[x + i][y + i] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }

    if (dir == 'S') {
      for (int i = 1; i <= n; i++) {
        if (rows[x + i][y] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }

    if (dir == 'SW') {
      for (int i = 1; i <= n; i++) {
        if (rows[x + i][y - i] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }

    if (dir == 'W') {
      for (int i = 1; i <= n; i++) {
        if (rows[x][y - i] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }

    if (dir == 'NW') {
      for (int i = 1; i <= n; i++) {
        if (rows[x - i][y - i] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }

    if (dir == 'N') {
      for (int i = 1; i <= n; i++) {
        if (rows[x - i][y] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }

    if (dir == 'NE') {
      for (int i = 1; i <= n; i++) {
        if (rows[x - i][y + i] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }

    if (dir == 'E') {
      for (int i = 1; i <= n; i++) {
        if (rows[x][y + i] == rows[x][y]) {
          count += 1;
        } else {
          return count;
        }
      }
    }
    return count;
  }
}
