// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AsyncStatusTearOff {
  const _$AsyncStatusTearOff();

  _Busy busy() {
    return const _Busy();
  }

  _Complete complete() {
    return const _Complete();
  }

  _Failed failed() {
    return const _Failed();
  }

  _Idle idle() {
    return const _Idle();
  }
}

/// @nodoc
const $AsyncStatus = _$AsyncStatusTearOff();

/// @nodoc
mixin _$AsyncStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() busy,
    required TResult Function() complete,
    required TResult Function() failed,
    required TResult Function() idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Busy value) busy,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncStatusCopyWith<$Res> {
  factory $AsyncStatusCopyWith(
          AsyncStatus value, $Res Function(AsyncStatus) then) =
      _$AsyncStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$AsyncStatusCopyWithImpl<$Res> implements $AsyncStatusCopyWith<$Res> {
  _$AsyncStatusCopyWithImpl(this._value, this._then);

  final AsyncStatus _value;
  // ignore: unused_field
  final $Res Function(AsyncStatus) _then;
}

/// @nodoc
abstract class _$BusyCopyWith<$Res> {
  factory _$BusyCopyWith(_Busy value, $Res Function(_Busy) then) =
      __$BusyCopyWithImpl<$Res>;
}

/// @nodoc
class __$BusyCopyWithImpl<$Res> extends _$AsyncStatusCopyWithImpl<$Res>
    implements _$BusyCopyWith<$Res> {
  __$BusyCopyWithImpl(_Busy _value, $Res Function(_Busy) _then)
      : super(_value, (v) => _then(v as _Busy));

  @override
  _Busy get _value => super._value as _Busy;
}

/// @nodoc

class _$_Busy implements _Busy {
  const _$_Busy();

  @override
  String toString() {
    return 'AsyncStatus.busy()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Busy);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() busy,
    required TResult Function() complete,
    required TResult Function() failed,
    required TResult Function() idle,
  }) {
    return busy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
  }) {
    return busy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (busy != null) {
      return busy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Busy value) busy,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Idle value) idle,
  }) {
    return busy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
  }) {
    return busy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) {
    if (busy != null) {
      return busy(this);
    }
    return orElse();
  }
}

abstract class _Busy implements AsyncStatus {
  const factory _Busy() = _$_Busy;
}

/// @nodoc
abstract class _$CompleteCopyWith<$Res> {
  factory _$CompleteCopyWith(_Complete value, $Res Function(_Complete) then) =
      __$CompleteCopyWithImpl<$Res>;
}

/// @nodoc
class __$CompleteCopyWithImpl<$Res> extends _$AsyncStatusCopyWithImpl<$Res>
    implements _$CompleteCopyWith<$Res> {
  __$CompleteCopyWithImpl(_Complete _value, $Res Function(_Complete) _then)
      : super(_value, (v) => _then(v as _Complete));

  @override
  _Complete get _value => super._value as _Complete;
}

/// @nodoc

class _$_Complete implements _Complete {
  const _$_Complete();

  @override
  String toString() {
    return 'AsyncStatus.complete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Complete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() busy,
    required TResult Function() complete,
    required TResult Function() failed,
    required TResult Function() idle,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Busy value) busy,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Idle value) idle,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _Complete implements AsyncStatus {
  const factory _Complete() = _$_Complete;
}

/// @nodoc
abstract class _$FailedCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) then) =
      __$FailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> extends _$AsyncStatusCopyWithImpl<$Res>
    implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(_Failed _value, $Res Function(_Failed) _then)
      : super(_value, (v) => _then(v as _Failed));

  @override
  _Failed get _value => super._value as _Failed;
}

/// @nodoc

class _$_Failed implements _Failed {
  const _$_Failed();

  @override
  String toString() {
    return 'AsyncStatus.failed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Failed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() busy,
    required TResult Function() complete,
    required TResult Function() failed,
    required TResult Function() idle,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Busy value) busy,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Idle value) idle,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AsyncStatus {
  const factory _Failed() = _$_Failed;
}

/// @nodoc
abstract class _$IdleCopyWith<$Res> {
  factory _$IdleCopyWith(_Idle value, $Res Function(_Idle) then) =
      __$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$IdleCopyWithImpl<$Res> extends _$AsyncStatusCopyWithImpl<$Res>
    implements _$IdleCopyWith<$Res> {
  __$IdleCopyWithImpl(_Idle _value, $Res Function(_Idle) _then)
      : super(_value, (v) => _then(v as _Idle));

  @override
  _Idle get _value => super._value as _Idle;
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle();

  @override
  String toString() {
    return 'AsyncStatus.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() busy,
    required TResult Function() complete,
    required TResult Function() failed,
    required TResult Function() idle,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? busy,
    TResult Function()? complete,
    TResult Function()? failed,
    TResult Function()? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Busy value) busy,
    required TResult Function(_Complete value) complete,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Busy value)? busy,
    TResult Function(_Complete value)? complete,
    TResult Function(_Failed value)? failed,
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements AsyncStatus {
  const factory _Idle() = _$_Idle;
}
