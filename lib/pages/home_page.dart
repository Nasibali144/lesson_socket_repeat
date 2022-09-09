import 'package:flutter/material.dart';
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
    SocketService.connect(SocketService.request());
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
            var model = SocketService.parseRequest(snapshot.data as String);
            return Center(
              child: Column(
                children: [
                  Text("ETH-EUR: ${model.price}"),
                ],
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
