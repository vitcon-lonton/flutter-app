// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LanguageFailureTearOff {
  const _$LanguageFailureTearOff();

  LanguageFailureNotFound notFound() {
    return const LanguageFailureNotFound();
  }
}

/// @nodoc
const $LanguageFailure = _$LanguageFailureTearOff();

/// @nodoc
mixin _$LanguageFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LanguageFailureNotFound value) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LanguageFailureNotFound value)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LanguageFailureNotFound value)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageFailureCopyWith<$Res> {
  factory $LanguageFailureCopyWith(
          LanguageFailure value, $Res Function(LanguageFailure) then) =
      _$LanguageFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$LanguageFailureCopyWithImpl<$Res>
    implements $LanguageFailureCopyWith<$Res> {
  _$LanguageFailureCopyWithImpl(this._value, this._then);

  final LanguageFailure _value;
  // ignore: unused_field
  final $Res Function(LanguageFailure) _then;
}

/// @nodoc
abstract class $LanguageFailureNotFoundCopyWith<$Res> {
  factory $LanguageFailureNotFoundCopyWith(LanguageFailureNotFound value,
          $Res Function(LanguageFailureNotFound) then) =
      _$LanguageFailureNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$LanguageFailureNotFoundCopyWithImpl<$Res>
    extends _$LanguageFailureCopyWithImpl<$Res>
    implements $LanguageFailureNotFoundCopyWith<$Res> {
  _$LanguageFailureNotFoundCopyWithImpl(LanguageFailureNotFound _value,
      $Res Function(LanguageFailureNotFound) _then)
      : super(_value, (v) => _then(v as LanguageFailureNotFound));

  @override
  LanguageFailureNotFound get _value => super._value as LanguageFailureNotFound;
}

/// @nodoc

class _$LanguageFailureNotFound implements LanguageFailureNotFound {
  const _$LanguageFailureNotFound();

  @override
  String toString() {
    return 'LanguageFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LanguageFailureNotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? notFound,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LanguageFailureNotFound value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LanguageFailureNotFound value)? notFound,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LanguageFailureNotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class LanguageFailureNotFound implements LanguageFailure {
  const factory LanguageFailureNotFound() = _$LanguageFailureNotFound;
}
