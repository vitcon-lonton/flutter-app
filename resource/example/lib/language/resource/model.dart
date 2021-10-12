part of 'resource.dart';

@freezed
class ResourceHive with _$ResourceHive {
  @HiveType(typeId: 0, adapterName: 'ResourceHiveAdapter')
  const factory ResourceHive({
    @HiveField(2) final int? languageFid,
    @HiveField(0) final String? resourceKey,
    @HiveField(1) final String? resourceValue,
    @HiveField(3) final String? typeOfResource,
  }) = _ResourceHive;

  factory ResourceHive.fromJson(Map<String, dynamic> json) =>
      _$ResourceHiveFromJson(json);
}
