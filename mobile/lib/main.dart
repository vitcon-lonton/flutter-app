import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/injector.dart' as di;

import 'app.dart';
import 'env_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.initializeDependencies(mode: EnvConfig.mode);
  runApp(MyApp());
}
