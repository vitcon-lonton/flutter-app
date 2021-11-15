part of 'resource.dart';

@freezed
class Resource with _$Resource {
  @HiveType(typeId: 0, adapterName: 'ResourceAdapter')
  const factory Resource({
    @HiveField(2) final int? languageFid,
    @HiveField(0) final String? resourceKey,
    @HiveField(1) final String? resourceValue,
    @HiveField(3) final String? typeOfResource,
    @HiveField(4) required final DateTime createTime,
  }) = _Resource;

  factory Resource.now() => Resource(createTime: DateTime.now());

  factory Resource.fromDto(Map<String, dynamic> json) {
    json['createTime'] = DateTime.now().toIso8601String();
    return Resource.fromJson(json);
  }

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}
