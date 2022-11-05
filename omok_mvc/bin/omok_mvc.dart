import 'package:omok_mvc/Controller/controller.dart';
import 'package:omok_mvc/omok_mvc.dart' as omok_mvc;
import 'package:http/http.dart' as http;
import 'package:omok_mvc/Model/board.dart';
import 'package:omok_mvc/Model/info.dart';
import 'package:omok_mvc/Model/response_parser.dart';
import 'package:omok_mvc/Model/web_client.dart';
import 'package:omok_mvc/View/console_ui.dart';
import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  Controller().start();
}



