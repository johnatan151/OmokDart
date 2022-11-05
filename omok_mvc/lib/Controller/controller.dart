import 'package:omok_mvc/Model/info.dart';
import '../Model/web_client.dart';
import '../View/console_ui.dart';
import '../Model/board.dart';


class Controller {
  void start() async {
    var ui = ConsoleUI();
    ui.showMessage('Welcome to Omok Game!');

    var server = ui.promptServer();
    ui.showMessage('Connecting to the server: [$server]');

    var net = WebClient(server);

    var decodedResponse = await net.getInfo();
    if (decodedResponse == null) {
      ui.showMessage('Unable to connect\nExiting...');
      return;
    }


    Info info = Info(decodedResponse['size'], decodedResponse['strategies']);
    var promptStrategy = ui.promptStrategy(info.strategies);

    ui.showMessage('Creating new game with $promptStrategy as selected strategy...\n');
    var pid = await net.getPID(promptStrategy);
    
    
    var userI = true;
    while(userI){
      ui.promptBoard();
      ui.promptMove(info.size);
    }

  }
}
