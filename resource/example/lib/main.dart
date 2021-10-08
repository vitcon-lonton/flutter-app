// ignore_for_file: avoid_print

import 'package:aqb_api/aqb_api.dart' as api;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:resource_example/language/language.dart';
import 'resource/resource.dart';

late final ILanguageService languageService;

init() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveLanguageAdapter());
  final configApi = api.ConfigService(Dio());
  final languageBox = await Hive.openBox<HiveLanguage>('languageBox');
  final selectedLanguageBox = await Hive.openBox<int>('selectedLanguageBox');

  final realService = LanguageService(selectedLanguageBox, languageBox);
  languageService = LanguageServiceProxy(configApi, realService, languageBox);
  languageService.languages;
}

Future<void> main() async {
  await init();
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
            // const LanguageOptions(),
            const SizedBox(height: 36),

            StreamBuilder(
              stream: languageService.watchSelected(),
              builder: (_, AsyncSnapshot<api.Language?> snapshot) {
                final selectedId = snapshot.data?.id;

                return StreamBuilder(
                  stream: languageService.watchAll(),
                  builder: (_, AsyncSnapshot<List<api.Language>> snapshot) {
                    if (snapshot.hasError) return const SizedBox();
                    if (!snapshot.hasData) return const SizedBox();

                    return Column(
                      children: snapshot.data!.map((i) {
                        return ListTile(
                          selected: selectedId == i.id,
                          title: Text(i.languageName ?? ''),
                          onTap: () => languageService.update(i),
                        );
                      }).toList(),
                    );
                  },
                );
              },
            ),

            // StreamBuilder(
            //   stream: languageService.watchSelected(),
            //   builder: (_, AsyncSnapshot<api.Language?> snapshot) {
            //     final selectedId = snapshot.data?.id;

            //     return StreamBuilder(
            //       stream: languageService.watchAll(),
            //       builder: (_, AsyncSnapshot<List<api.Language>> snapshot) {
            //         if (snapshot.hasError) return const SizedBox();
            //         if (!snapshot.hasData) return const SizedBox();

            //         return Column(
            //           children: snapshot.data!.map((i) {
            //             return ListTile(
            //               selected: selectedId == i.id,
            //               title: Text(i.languageName ?? ''),
            //               onTap: () => languageService.update(i),
            //             );
            //           }).toList(),
            //         );
            //       },
            //     );
            //   },
            // ),
            // for (var item in testKey) WText(item),
            // WText(testKey[1]),
            // WText(testKey[2]),
            // WText(testKey[8]),
            // WText(testKey[4]),
            // WText(testKey[0]),
            // WText(testKey[7]),
            // WText(testKey[3]),
            ElevatedButton(
              child: const Text('data'),
              onPressed: () => setState(() => initiated = true),
            ),
            if (initiated) WText(testKey[3]),
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
    return ValueListenableBuilder(
      valueListenable: languageService.languageListenable(),
      builder: (_, __, widget) {
        final _selectedId = languageService.language?.id;

        return ValueListenableBuilder(
          valueListenable: languageService.listenable(),
          builder: (_, Box<HiveLanguage> box, widget) {
            return Column(
              children: box.values.map((i) {
                return ListTile(
                  selected: _selectedId == i.id,
                  title: Text(i.languageName ?? ''),
                  onTap: () => languageService.update(i.toData()),
                );
              }).toList(),
            );
          },
        );
      },
    );

    // ignore: dead_code
    return Builder(builder: (context) {
      return ValueListenableBuilder(
        valueListenable: languageService.listenable(),
        builder: (_, Box<HiveLanguage> box, widget) {
          return Column(
            children: box.values.map((i) {
              return ListTile(
                title: Text(i.languageName ?? ''),
                onTap: () => languageService.update(i.toData()),
              );
            }).toList(),
          );
        },
      );
    });
  }
}

//   final languageBox =
//     await Hive.openBox<HiveLanguage>('languageBox', bytes: Uint8List(0));
// final selectedLanguageBox =
//     await Hive.openBox<int>('selectedLanguageBox', bytes: Uint8List(0));
