import 'package:aqb_api/aqb_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'model.freezed.dart';
part 'model.g.dart';

extension HiveLanguageExt on HiveLanguage {
  Language toData() => Language.fromJson(toJson());
}

@freezed
class HiveLanguage with _$HiveLanguage {
  @HiveType(typeId: 1, adapterName: 'HiveLanguageAdapter')
  const factory HiveLanguage({
    @HiveField(0) int? id,
    @HiveField(1) String? languageName,
    @HiveField(2) String? resourceKey,
    @HiveField(3) String? uniqueId,
    @HiveField(4) String? languageCode,
    @HiveField(6) String? remarks,
    @HiveField(7) String? displayName,
    @HiveField(8) bool? isActive,
  }) = _HiveLanguage;

  factory HiveLanguage.fromJson(Map<String, dynamic> json) =>
      _$HiveLanguageFromJson(json);
}
