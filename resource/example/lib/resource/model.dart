part of 'resource.dart';

@freezed
class ResourceEntity with _$ResourceEntity {
  @HiveType(typeId: 0, adapterName: 'ResourceEntityAdapter')
  const factory ResourceEntity({
    @HiveField(2) final int? languageFid,
    @HiveField(0) final String? resourceKey,
    @HiveField(1) final String? resourceValue,
    @HiveField(3) final String? typeOfResource,
  }) = _ResourceEntity;

  factory ResourceEntity.fromJson(Map<String, dynamic> json) =>
      _$ResourceEntityFromJson(json);
}
