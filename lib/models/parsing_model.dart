import 'dart:convert';

import 'package:lesson_socket_repeat/models/heartbeat_model.dart';
import 'package:lesson_socket_repeat/models/level_two.dart';
import 'package:lesson_socket_repeat/models/ticker_model.dart';

class ParsingModel {

  static Map<String, List> data = {
    "ticker": [],
    "l2update": [],
    "heartbeat": [],
    "default": [],
  };

  ParsingModel.fromJson(String jsonString) {
    Map json = jsonDecode(jsonString);
    switch(json["type"]) {
      case "ticker": {
        data["ticker"]?.add(TickerModel.fromJson(json));
      } break;
      case "l2update": {
        data["ticker"]?.add(LevelTwo.fromJson(json));
      } break;
      case "heartbeat": {
        data["ticker"]?.add(Heartbeat.fromJson(json));
      } break;
      default: {
        //
      }
    }
  }
}