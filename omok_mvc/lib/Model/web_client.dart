import 'package:http/http.dart' as http;
import 'response_parser.dart';

class WebClient {
  static const defaultServer = 'https://www.cs.utep.edu/cheon/cs3360/project/omok/info/';
  var server;

  WebClient(this.server);

  getInfo() async {
    try {
      var serverURL = Uri.parse(server);
      var response = await http.get(serverURL);
      var decodedResponse = ResponseParser.parseInfo(response.body);
      return decodedResponse;
    } on FormatException catch(_,e) {
      return null;
    }
  }

  getPID(String selectedStrategy) async {
  var url = 'https://www.cs.utep.edu/cheon/cs3360/project/omok/new/?';
  var strategy = selectedStrategy;
  try {
    var uri = Uri.parse('${url}strategy=$strategy');
    var response = await http.get(uri);
    var jsonResponse = ResponseParser.parseInfo(response.body);
    return jsonResponse;
    }catch (error) {
    return null;
    }
  }

  pcMove(String pidIn, var xyInput) async {
    var url = 'https://www.cs.utep.edu/cheon/cs3360/project/omok/play/?pid=p&move=x,y';
    var pid = pidIn;
    var xy = xyInput;
    try {
      var uri = Uri.parse('${url}pid=$pid&move=$xy');
      var response = await http.get(uri);
      var jsonResponse = ResponseParser.parseInfo(response.body);
      return jsonResponse;
    }catch (error) {
      return null;
    }
  }

}