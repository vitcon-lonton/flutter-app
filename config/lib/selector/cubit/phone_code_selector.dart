import 'package:flutter/material.dart';

import 'package:config/config.dart';
import 'package:config/selector/cubit/phone_code_selector_cubit.dart';

class PhoneCodeSelector extends StatefulWidget {
  const PhoneCodeSelector({Key? key}) : super(key: key);

  @override
  _PhoneCodeSelectorState createState() => _PhoneCodeSelectorState();
}

class _PhoneCodeSelectorState extends State<PhoneCodeSelector> {
  late final PhoneCodeSelectorCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = PhoneCodeSelectorCubit(configService: Config.service);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
