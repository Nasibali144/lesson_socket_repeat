import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lesson_socket_repeat/models/level_two.dart';
import 'package:lesson_socket_repeat/services/socket_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    SocketService.connect(SocketService.requestTwo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket"),
      ),
      body: StreamBuilder(
        stream: SocketService.channel.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            print(snapshot.data);
            // var model = ParsingModel.fromJson(snapshot.data as String);
            var model = LevelTwo.fromJson(jsonDecode(snapshot.data as String));
            return Center(
              child: Text(
                "ETH-USD: ${model.changes}",
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return const Center(
            child: Text("No Data"),
          );
        },
      ),
    );
  }
}
