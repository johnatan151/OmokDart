import '../Model/web_client.dart';
import '../Model/move.dart';
import 'dart:io';
import '../Model/player.dart';
import '../Model/board.dart';
import '../Model/move.dart';

 Board gameBoard = new Board(15);

class ConsoleUI {
  void showMessage(var msg) {
    stdout.writeln(msg);
  }

  promptServer([serverUrl = WebClient.defaultServer]) {
    stdout.writeln('Enter the server URL [default: $serverUrl]');
    var userUrl = stdin.readLineSync();
    if (userUrl == null || userUrl.isEmpty == true) {
      return serverUrl;
    }
    return userUrl;
  }

  promptStrategy(List<dynamic> strategies) {
    stdout.writeln('Select strategy type: ');
    for (int i = 0; i < strategies.length; i++) {
      var currentStrategy = strategies[i];
      var currentIndex = i + 1;
      stdout.write("$currentIndex. $currentStrategy ");
    }

    int selectedStrategy = 0;
    while (selectedStrategy < 1 || selectedStrategy > strategies.length) {
      try {
        var line = stdin.readLineSync();
        selectedStrategy = int.parse(line ?? '0');

        if (selectedStrategy < 1 || selectedStrategy > strategies.length) {
          stdout.writeln('Invalid Selection. Try again!');
        }
      } on FormatException catch (_, e) {
        stdout.writeln(
            'Wrong Input! Please input a number between 1 - ${strategies.length}');
      }
    }
    //WebClient.getPID(strategies[selectedStrategy-1]);
    return strategies[selectedStrategy - 1];
  }

  promptMove(size) {
    stdout.writeln('Enter X,Y coordinates from the ranges 1-15 i.e 10,12');
    var lineInput = stdin.readLineSync() ?? "";
    List<String>? tokenize = lineInput.split(',');

    try {
      int xcoord = int.parse(tokenize[0]);
      int ycoord = int.parse(tokenize[1]);

      if (xcoord > 15 || ycoord > 15) {
        stdout.writeln('Invalid coordinate range');
        promptMove(size);
      }
      if(tokenize[1] == null || tokenize[0] == null){
        stdout.writeln('Not enough parameters');
        promptMove(size);
      }
      Move move = Move(xcoord, ycoord);
    } on FormatException catch (_, e) {
      stdout.write('Invalid input!');
      promptMove(size);
    }
    gameBoard.checkSpot(int.parse(tokenize[0]), int.parse(tokenize[1]), 'x');
  }
  promptBoard() {
    var i = 1;
    
    var indexes = List<int>.generate(gameBoard.size,(i)=>(i + 1) % 10).join(' ');
    stdout.writeln('x $indexes');

    for(var row in gameBoard.rows){
      var line =row.map((player) => player).join(' ');
      stdout.writeln('${i % 10}|$line');
      i++;
    }
    
  }
}



