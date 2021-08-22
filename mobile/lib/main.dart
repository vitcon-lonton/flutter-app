import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'infra/language_repo.dart';

final dio = Dio()
  ..options = BaseOptions(
      connectTimeout: 10000, sendTimeout: 10000, receiveTimeout: 10000);
final client = ConfigService(dio);
final storage = FlutterSecureStorage();
final service = ConfigService(dio);
final repo = LanguageRepo(service, storage);

Future<void> main() async {
  // dio.interceptors.add(InterceptorsWrapper(onResponse: (res, handle) {
  //   // print(
  //   //     '<-- ${res.statusCode} ${(res.request != null ? (res.request.baseUrl + res.request.path) : 'URL')}');
  //   // print('Headers:');
  //   log('--> ${res.realUri.path}');
  //   // res.headers?.forEach((k, v) => print('$k: $v'));
  //   // ignore: avoid_print
  //   print('Response: ${jsonEncode(res.data)}');
  //   log('Response: ${jsonEncode(res.data)}');
  //   // print('<-- END HTTP');
  // }));

  // repo.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await repo.init();
      // final value = await _fromLocal();
      // print(value);
    });

    // repo.init();

    // client.getAbout().then((value) {
    //   print(value);
    //   return null;
    // });
    // client.getCountries().then((value) {
    //   print(value.responseData!.length);
    //   return null;
    // });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
