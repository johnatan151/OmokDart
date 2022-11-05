import 'dart:convert';

class ResponseParser {
  static parseInfo(String data) {
    return jsonDecode(data);
  }
}
