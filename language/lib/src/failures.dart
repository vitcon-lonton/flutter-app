import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class LanguageFailure with _$LanguageFailure {
  const factory LanguageFailure.notFound() = LanguageFailureNotFound;
}
