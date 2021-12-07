import 'package:aqb_api/aqb_api.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:config/service/iconfig_service.dart';
import 'package:rxdart/rxdart.dart';

part 'phone_code_selector_cubit.freezed.dart';

@freezed
class PhoneCodeSelectorState with _$PhoneCodeSelectorState {
  const factory PhoneCodeSelectorState({
    String? error,
    String? keyword,
    List<PhoneCode>? codes,
    PhoneCode? selectedCode,
    @Default(false) bool isLoading,
  }) = _PhoneCodeSelectorState;

  factory PhoneCodeSelectorState.initial() => const PhoneCodeSelectorState();

  PhoneCodeSelectorState busy() => copyWith(isLoading: true);

  PhoneCodeSelectorState idle() => copyWith(isLoading: false);

  PhoneCodeSelectorState failure(String? error) => copyWith(error: error);
}

class PhoneCodeSelectorCubit extends Cubit<PhoneCodeSelectorState> {
  late final Duration _debounceTime;
  late final IConfigService configService;
  late final BehaviorSubject<String> _keywordController;

  PhoneCodeSelectorCubit({
    Duration? debounceTime,
    required this.configService,
  }) : super(PhoneCodeSelectorState.initial()) {
    _keywordController = BehaviorSubject<String>();
    _debounceTime = debounceTime ?? const Duration(milliseconds: 700);
    _keywordController.debounceTime(_debounceTime).where((key) {
      return key.length > 2;
    }).listen((key) => filter());

    fetchData();
  }

  fetchData() async {
    try {
      emit(state.busy());

      final codes = await configService.getPhoneCodes();

      emit(state.copyWith(codes: codes).copyWith(selectedCode: codes.first));
    } catch (e) {
      emit(state.failure('Unable get codes'));
    } finally {
      emit(state.idle());
    }
  }

  void filter() {}

  void errorChanged(String value) {
    emit(state.copyWith(error: value));
  }

  void keywordChanged(String value) {
    emit(state.copyWith(error: value));
  }

  void codesChanged(List<PhoneCode> value) {
    emit(state.copyWith(codes: value));
  }

  void selectedCodeChanged(PhoneCode value) {
    emit(state.copyWith(selectedCode: value));
  }

  void isLoadingChanged(bool value) {
    emit(state.copyWith(isLoading: value));
  }
}
