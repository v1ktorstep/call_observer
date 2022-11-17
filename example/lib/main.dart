import 'package:flutter/material.dart';
import 'package:call_observer/call_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _stream = CallObserver.callStateStream;

  @override
  void initState() {
    super.initState();

    _stream.listen((event) {
      print(event);
    }, onError: (e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _stream,
            builder: (context, snapshot) {
              final data = snapshot.data;

              if (data != null) {
                return Text(data.toString());
              } else {
                return const Text('no data');
              }
            },
          ),
        ),
      ),
    );
  }
}
