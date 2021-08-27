import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info/package_info.dart';

import 'env_config.dart';
import 'infra/language_repo.dart';

final dio = Dio()
  ..options = BaseOptions(
      connectTimeout: 10000, sendTimeout: 10000, receiveTimeout: 10000);
final client = ConfigService(dio, baseUrl: EnvConfig.DOMAIN);
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
  WidgetsFlutterBinding.ensureInitialized();
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

    WidgetsBinding.instance!.addPostFrameCallback((_) async {});
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
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EnvInfo(),
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
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

class EnvInfo extends StatelessWidget {
  const EnvInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'DOMAIN: ${EnvConfig.DOMAIN}',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'APP_MODE: ${EnvConfig.APP_MODE}',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'APP_NAME: ${EnvConfig.APP_NAME}',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'APP_SUFFIX: ${EnvConfig.APP_SUFFIX}',
          style: Theme.of(context).textTheme.headline5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Package Name',
                style: Theme.of(context).textTheme.headline5,
              ),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, value) {
                  if (!value.hasData) return Container();

                  return Text(
                    value.data!.packageName,
                    style: Theme.of(context).textTheme.headline6,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
