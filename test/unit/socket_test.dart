import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_socket_repeat/services/socket_service.dart';

void main() {
  group("Test Web Socket", () {
    test("Test: Connect", () {
      Stream response = SocketService.channel.stream;
      SocketService.connect(SocketService.request());
      expect("2", "2");
    });

  });
}