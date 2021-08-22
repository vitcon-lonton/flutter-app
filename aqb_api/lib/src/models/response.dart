part of 'models.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse({
    this.statusCode,
    this.message,
    this.responseData,
    this.responseHeader,
    this.fullResponseString,
    this.fullMsg,
    this.isSuccessStatusCode,
    this.aqStatusCode,
    this.resourceKey,
  });

  final int? statusCode;
  final dynamic message;
  final T? responseData;
  final List? responseHeader;
  final String? fullResponseString;
  final String? fullMsg;
  final bool? isSuccessStatusCode;
  final String? aqStatusCode;
  final String? resourceKey;

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  bool get valid => ((isSuccessStatusCode ?? false) && responseData != null);
}

// @JsonSerializable(createToJson: false)
// class BaseResponse<T> {
//   BaseResponse({
//     this.statusCode,
//     this.message,
//     this.responseData,
//     this.responseHeader,
//     this.fullResponseString,
//     this.fullMsg,
//     this.isSuccessStatusCode,
//     this.aqStatusCode,
//     this.resourceKey,
//   });

//   final int? statusCode;
//   final dynamic message;
//   @JsonKey(fromJson: _dataFromJson)
//   final T? responseData;
//   final List? responseHeader;
//   final String? fullResponseString;
//   final String? fullMsg;
//   final bool? isSuccessStatusCode;
//   final String? aqStatusCode;
//   final String? resourceKey;

//   factory BaseResponse.fromJson(Map<String, dynamic> json) =>
//       _$BaseResponseFromJson(json);

//   bool get valid => ((isSuccessStatusCode ?? false) && responseData != null);

//   /// Decodes [json] by "inspecting" its contents.
//   static T? _dataFromJson<T>(Object? json) {
//     if (json == null) return null;
//     if (json is String) {
//       return json as T;
//     } else if (json is Map<String, dynamic>) {
//       if (T == Null) return null;
//       if (T == Credential) return Credential.fromJson(json) as T;
//     } else if (json is List) {
//       // var type = T.runtimeType;
//       // var type2 = <Currency>[].runtimeType.runtimeType;
//       // print(type == type2);
//       if (<Language>[] is T) {
//         return json.map((e) => Language.fromJson(e)).toList() as T;
//       } else if (<Currency>[] is T) {
//         return json.map((e) => Currency.fromJson(e)).toList() as T;
//       } else if (<Country>[] is T) {
//         return json.map((e) => Country.fromJson(e)).toList() as T;
//       } else if (<City>[] is T) {
//         return json.map((e) => City.fromJson(e)).toList() as T;
//       } else if (<District>[] is T) {
//         return json.map((e) => District.fromJson(e)).toList() as T;
//       } else if (<Rate>[] is T) {
//         return json.map((e) => Rate.fromJson(e)).toList() as T;
//       } else if (<Resource>[] is T) {
//         return json.map((e) => Resource.fromJson(e)).toList() as T;
//       } else if (<Location>[] is T) {
//         return json.map((e) => Location.fromJson(e)).toList() as T;
//       } else if (<PhoneCode>[] is T) {
//         return json.map((e) => PhoneCode.fromJson(e)).toList() as T;
//       } else if (<Airport>[] is T) {
//         return json.map((e) => Airport.fromJson(e)).toList() as T;
//       } else if (<MealPlan>[] is T) {
//         return json.map((e) => MealPlan.fromJson(e)).toList() as T;
//       } else if (<AirlineMember>[] is T) {
//         return json.map((e) => AirlineMember.fromJson(e)).toList() as T;
//       } else if (<FlightPart>[] is T) {
//         return json.map((e) => FlightPart.fromJson(e)).toList() as T;
//       }
//       return json as T;
//     } else {
//       return json as T;
//     }

//     throw ArgumentError.value(
//         json, 'json', 'Cannot convert the provided data.');
//   }
// }
