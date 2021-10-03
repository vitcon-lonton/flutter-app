// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'resource/resource.dart';

Future<void> main() async {
  await Resource().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool initiated = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            // for (var item in testKey) WText(item),
            WText(testKey[1]),
            WText(testKey[2]),
            WText(testKey[8]),
            WText(testKey[4]),
            WText(testKey[0]),
            WText(testKey[7]),
            WText(testKey[3]),
            ElevatedButton(
              child: const Text('data'),
              onPressed: () {
                setState(() => initiated = true);
              },
            ),
            if (initiated) WText(testKey[3]),
          ],
        ),
      ),
    );
  }
}
