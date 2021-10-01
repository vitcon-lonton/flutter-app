import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'env_config.dart';

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
