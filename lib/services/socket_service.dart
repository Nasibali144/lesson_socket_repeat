import 'dart:convert';
import 'package:lesson_socket_repeat/models/ticker_model.dart';
import 'package:web_socket_channel/io.dart';

class SocketService {
  // Base Url
  static const SERVER = "wss://ws-feed.exchange.coinbase.com";

  // Connect
  static final channel = IOWebSocketChannel.connect(Uri.parse(SERVER));

  // Method
  static void connect(Map<String, dynamic> request) {
    channel.sink.add(jsonEncode(request));
  }

  static Future<void> close() async {
    await channel.sink.close();
  }

  // Query
  static Map<String, dynamic> request() => {
    "type": "subscribe",
    "product_ids": [
      "ETH-USD"
      // "ETH-EUR"
    ],
    "channels": [
      "ticker"
    ]
  };

  static Map<String, dynamic> requestTwo() => {
    "type": "subscribe",
    "product_ids": [
      "ETH-USD",
      "ETH-EUR"
    ],
    "channels": [
      // "level2",
      "heartbeat",
      // {
      //   "name": "ticker",
      //   "product_ids": [
      //     "ETH-BTC",
      //     "ETH-USD"
      //   ]
      // }
    ]
  };

  static TickerModel parseRequest(String json) {
    return TickerModel.fromJson(jsonDecode(json));
  }
}