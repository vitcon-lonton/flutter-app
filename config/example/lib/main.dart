import 'dart:async';

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';

Future<void> main() async {
  await Config.initialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const FeaturesModalFilter(),
            const SizedBox(height: 32),
            Row(
              children: const [
                Expanded(child: FeaturesModalFilter()),
                SizedBox(width: 24),
                Expanded(child: FeaturesModalFilter()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturesModalFilter extends StatefulWidget {
  final void Function(PhoneCode?)? onChanged;

  const FeaturesModalFilter({Key? key, this.onChanged}) : super(key: key);

  @override
  _FeaturesModalFilterState createState() => _FeaturesModalFilterState();
}

class _FeaturesModalFilterState extends State<FeaturesModalFilter> {
  bool? _isError;
  bool? _isLoading;
  PhoneCode? _code;
  List<PhoneCode>? _codes;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _getData());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            SizedBox(width: 4.0),
            Text('Country code', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 8.0),
        SmartSelect<PhoneCode?>.single(
          // title: '',
          modalFilter: true,
          choiceGrouped: true,
          selectedValue: _code,
          modalTitle: 'Country Code',
          title: _code?.countryName ?? 'Choose one',
          modalType: S2ModalType.bottomSheet,
          // placeholder: _code?.countryName ?? 'Choose one',
          onChange: (selected) {
            setState(() => _code = selected.value);
            if (widget.onChanged == null) return;
            widget.onChanged!(selected.value);
          },
          tileBuilder: (_, state) => Ink(
            // height: 45,
            decoration: BoxDecoration(
              // color: const Color(0xffE4E8EF),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: const Color(0xffD8DADD), width: 0.5),
            ),
            child: S2Tile.fromState(
              state,
              dense: true,
              isError: _isError,
              isLoading: _isLoading,
              value: const SizedBox.shrink(),
              title: Container(
                color: Colors.amber,
                child: Text(
                  _code?.countryName ?? 'Choose one',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
              ).copyWith(top: 0, bottom: 0),
            ),
          ),
          choiceItems: S2Choice.listFrom<PhoneCode, PhoneCode>(
            source: _codes ?? [],
            value: (index, item) => item,
            group: (index, item) => item.countryName?.substring(0, 1) ?? '',
            title: (index, item) {
              final country = item.countryName;
              final codeStr = item.countryPhoneCode;

              if (codeStr?.isEmpty ?? true) return '$country';

              return '$country (+$codeStr)';
            },
          ),
        ),
      ],
    );
  }

  _getData() async {
    setState(() {
      _isError = false;
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    _codes = await Config.service.getPhoneCodes();

    setState(() {
      _isLoading = false;
    });
  }
}
