// ignore_for_file: avoid_print

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resource_example/language/language.dart';

import 'language/ilanguage_service.dart';
import 'language_plugin.dart';
import 'resource/resource.dart';

late final ILanguageService languageService;

init() async {
  await Hive.initFlutter();
  await LanguagePlugin.initialized();
  languageService = LanguagePlugin.languageService;
}

Future<void> main() async {
  await init();
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
        body: ListView(
          children: [
            const LanguageOptions(),
            const SizedBox(height: 36),

            // for (var item in testKey) WText(item),
            WText(testKey[1]),
            WText(testKey[2]),
            WText(testKey[8]),
            WText(testKey[4]),
            WText(testKey[0]),
            WText(testKey[7]),
            // WText(testKey[3]),
            ElevatedButton(
              child: const Text('data'),
              onPressed: () => setState(() => initiated = true),
            ),
            // if (initiated) WText(testKey[3]),
            // if (initiated) const LanguageOptions(),

            if (initiated) const LanguageOptions(),
          ],
        ),
      ),
    );
  }
}

class LanguageOptions extends StatelessWidget {
  const LanguageOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Language?>(
      valueListenable: languageService.selectedLanguageListenable(),
      builder: (_, selected, child) {
        if (selected != null) {
          LanguagePlugin.resourceService.languageChange(selected.id!);
        }

        return ValueListenableBuilder<List<Language>?>(
          valueListenable: languageService.languagesListenable(),
          builder: (_, languages, child) {
            if (languages?.isEmpty ?? true) return const SizedBox();

            return Column(
              children: languages!.map((item) {
                return ListTile(
                  selected: selected?.id == item.id,
                  title: Text(item.languageName ?? ''),
                  onTap: () => languageService.update(item),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}

class WText extends StatelessWidget {
  final String data;

  const WText(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(
      LanguagePlugin.ready != false,
      'LanguagePlugin must call initialized.',
    );

    return ValueListenableBuilder<List<String?>?>(
      valueListenable: LanguagePlugin.resourceService.listenable(keys: [data]),
      builder: (_, values, widget) {
        print('object: $values');
        if (values?.isEmpty ?? true) return Text(data);

        return Text(values?.first ?? data);
      },
    );
  }
}


//   final languageBox =
//     await Hive.openBox<HiveLanguage>('languageBox', bytes: Uint8List(0));
// final selectedLanguageBox =
//     await Hive.openBox<int>('selectedLanguageBox', bytes: Uint8List(0));
