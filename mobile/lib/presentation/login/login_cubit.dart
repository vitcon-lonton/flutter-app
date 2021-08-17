import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/core/entities.dart';

// import 'package:mobile/domain/core/failures.dart';
import 'package:mobile/domain/core/value_objects.dart';

part 'login_cubit.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  LoginState._();
  factory LoginState({
    Email? email,
    Password? password,
    @Default(AsyncStatus.idle()) AsyncStatus status,
  }) = _LoginState;

  // ValueFailure<String>? get emailError => email?.;

  // ValueFailure<String>? get passwordError => password?.error;

  bool get valid {
    return true;
    // return (emailError != null && passwordError != null);
  }

  factory LoginState.init() {
    return LoginState().idle();

    // .copyWith(email: const Email.pure())
    // .copyWith(password: const Password.pure());
  }

  LoginState busy() => copyWith(status: AsyncStatus.busy());
  LoginState idle() => copyWith(status: AsyncStatus.idle());
  LoginState failed() => copyWith(status: AsyncStatus.failed());
  LoginState complete() => copyWith(status: AsyncStatus.complete());
}

class LoginCubit extends Cubit<LoginState> {
  // final _loginApple = sl<LoginApple>();
  // final _loginEmail = sl<LoginEmail>();
  // final _loginGoogle = sl<LoginGoogle>();
  // final _loginFacebook = sl<LoginFacebook>();

  LoginCubit() : super(LoginState.init());

  // get _emailParams {
  //   return LoginEmailParams(email: state.email, password: state.password);
  // }

  emailChanged(String value) => emit(state.copyWith(email: Email(value)));

  pwChanged(String value) => emit(state.copyWith(password: Password(value)));

  emailSubmitted() async {
    if (state.valid) {
      emit(state.busy());
      Future.delayed(Duration(seconds: 1));
      emit(state.complete());

      // emit((await _loginEmail(_emailParams)).fold((credential) {
      //   return state.complete();
      // }, (f) => state.failed()));
    }
  }

  // facebookSubmitted() async {
  //   emit(state.busy());
  //   emit((await _loginFacebook(NoParams())).fold((credential) {
  //     return state.complete();
  //   }, (f) => state.failed()));
  // }

  // googleSubmitted() async {
  //   emit(state.busy());
  //   emit((await _loginGoogle(NoParams())).fold((credential) {
  //     return state.complete();
  //   }, (f) => state.failed()));
  // }

  // appleSubmitted() async {
  //   emit(state.busy());
  //   emit((await _loginApple(NoParams())).fold((credential) {
  //     return state.complete();
  //   }, (f) => state.failed()));
  // }
}
