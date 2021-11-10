part of 'models.dart';

@freezed
class Currency with _$Currency {
  Currency._();
  factory Currency({
    String? currencyCode,
    String? cultureCode,
    String? resourceKey,
    String? country,
    String? city,
    String? text,
    int? countryCode,
    Map<String, num>? rates,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}

@freezed
class Language with _$Language {
  Language._();
  factory Language({
    int? id,
    String? languageName,
    String? resourceKey,
    String? uniqueId,
    String? languageCode,
    String? cssClass,
    String? remarks,
    String? displayName,
    bool? isActive,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}

@freezed
class Country with _$Country {
  factory Country({
    int? countryCode,
    double? timeZone,
    String? countryName,
    String? description,
    String? alphaCode2,
    String? alphaCode3,
    String? countryPhoneCode,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class City with _$City {
  factory City({
    int? cityCode,
    int? countryCode,
    String? cityName,
    dynamic stateLst,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class District with _$District {
  factory District({
    int? id,
    int? cityCode,
    String? zoneDistrictName,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class Rate with _$Rate {
  factory Rate({
    double? rateSell,
    String? currencyBase,
    String? currencyChange,
  }) = _Rate;

  factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
}

@freezed
class ResourceDto with _$ResourceDto {
  factory ResourceDto({
    int? languageFid,
    String? resourceKey,
    String? resourceValue,
    String? typeOfResource,
  }) = _ResourceDto;

  factory ResourceDto.fromJson(Map<String, dynamic> json) =>
      _$ResourceDtoFromJson(json);
}

@freezed
class PhoneCode with _$PhoneCode {
  factory PhoneCode({
    String? countryName,
    String? countryPhoneCode,
  }) = _PhoneCode;

  factory PhoneCode.fromJson(Map<String, dynamic> json) =>
      _$PhoneCodeFromJson(json);
}

@freezed
class Location with _$Location {
  Location._();
  factory Location({
    int? id,
    String? cityName,
    String? countryName,
    String? districtName,
    String? type,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  String get text {
    final city = cityName ?? '';
    final country = countryName ?? '';
    final district = districtName ?? '';
    return '$city$country$district';
  }
}

@freezed
class Airport with _$Airport {
  const factory Airport({
    int? id,
    String? name,
    String? city,
    String? country,
    String? iata,
    String? icao,
    double? latitude,
    double? longitude,
    String? altitude,
    String? timezone,
  }) = _Airport;

  factory Airport.fromJson(Map<String, dynamic> json) =>
      _$AirportFromJson(json);
}

@freezed
class MealPlan with _$MealPlan {
  const factory MealPlan({
    int? id,
    String? code,
    String? name,
    bool? isActivated,
  }) = _MealPlan;

  factory MealPlan.fromJson(Map<String, dynamic> json) =>
      _$MealPlanFromJson(json);
}

@freezed
class AirlineMember with _$AirlineMember {
  const factory AirlineMember({
    int? id,
    int? allianceFId,
    String? membership,
    String? airlineCode,
    String? allianceName,
    String? airlineNames,
    dynamic orderBy,
  }) = _AirlineMember;

  factory AirlineMember.fromJson(Map<String, dynamic> json) =>
      _$AirlineMemberFromJson(json);
}

@freezed
class FlightPart with _$FlightPart {
  const factory FlightPart({
    int? id,
    String? countryName,
    String? countryCode,
    dynamic cityName,
    dynamic iataCode,
    dynamic airportName,
    bool? showOnPrivateJet,
    bool? showOnFlight,
  }) = _FlightPart;

  factory FlightPart.fromJson(Map<String, dynamic> json) =>
      _$FlightPartFromJson(json);
}

@freezed
class PayStepObject with _$PayStepObject {
  PayStepObject._();
  factory PayStepObject({
    int? rateType,
    String? rateTypeResKey,
    double? rateValue,
    int? beforeDay,
    DateTime? payDate,
  }) = _PayStepObject;

  factory PayStepObject.fromJson(Map<String, dynamic> json) =>
      _$PayStepObjectFromJson(json);
}

@freezed
class PayStep with _$PayStep {
  PayStep._();
  factory PayStep({
    DateTime? payDate,
    double? payValue,
    double? payPercent,
  }) = _PayStep;

  factory PayStep.fromJson(Map<String, dynamic> json) =>
      _$PayStepFromJson(json);
}

@freezed
class FlightAirport with _$FlightAirport {
  const factory FlightAirport({
    int? id,
    String? countryName,
    String? countryCode,
    String? cityName,
    String? iataCode,
    String? airportName,
    bool? showOnPrivateJet,
    bool? showOnFlight,
  }) = _FlightAirport;

  factory FlightAirport.fromJson(Map<String, dynamic> json) =>
      _$FlightAirportFromJson(json);
}
