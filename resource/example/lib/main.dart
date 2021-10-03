// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'handle.dart';

late Resource resource = Resource();

Future<void> main() async {
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
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await resource.init();
      setState(() {
        initiated = true;
      });
      resource.sync();

      // box.watch().listen((event) {
      //   // ignore: avoid_print
      //   print('\n${event.key.toString()}');
      //   // ignore: avoid_print
      //   print('\n${event.value.toString()}');
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            if (initiated) WText(testKey[8]),
            // WText(testKey[8]),
            // WText(testKey[3]),
          ],
        ),
      ),
    );
  }
}

class WText extends StatelessWidget {
  final String data;

  const WText(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Resource().box;

    return ValueListenableBuilder(
      valueListenable: box.listenable(keys: [data]),
      builder: (_, __, widget) {
        print('build');
        if (!box.isOpen) return Text(data);
        return Text(Resource().manager.getResource(data) ?? data);
      },
    );
  }
}
