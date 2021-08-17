/* spell-checker: disable */
// ignore_for_file: invalid_annotation_target
part of 'models.dart';

@freezed
class RegisterData with _$RegisterData {
  const factory RegisterData({
    String? email,
    String? password,
    String? passwordConfirm,
    String? roleId,
    String? firstName,
    String? lastName,
    int? merchantFid,
    String? phoneNumber,
    String? domainFid,
    String? countryPhone,
  }) = _RegisterData;

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
}

@freezed
class GoogleAuthData with _$GoogleAuthData {
  const factory GoogleAuthData(
      {String? googleId,
      String? email,
      String? fullName,
      String? givenName,
      String? familyName,
      String? imageUrl}) = _GoogleAuthData;

  factory GoogleAuthData.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthDataFromJson(json);
}

@freezed
class AppleAuthData with _$AppleAuthData {
  const factory AppleAuthData({String? code, String? fullName}) =
      _AppleAuthData;

  factory AppleAuthData.fromJson(Map<String, dynamic> json) =>
      _$AppleAuthDataFromJson(json);
}

@freezed
class FBAuthData with _$FBAuthData {
  const factory FBAuthData({String? userId, String? accessToken}) = _FBAuthData;

  factory FBAuthData.fromJson(Map<String, dynamic> json) =>
      _$FBAuthDataFromJson(json);
}

@freezed
class EmailAuthData with _$EmailAuthData {
  const factory EmailAuthData({String? email, String? password}) =
      _EmailAuthData;

  factory EmailAuthData.fromJson(Map<String, dynamic> json) =>
      _$EmailAuthDataFromJson(json);
}

@freezed
class Credential with _$Credential {
  const factory Credential({
    String? accountTypeFid,
    String? name,
    String? email,
    String? userId,
    String? roleId,
    String? expired,
    String? userRole,
    String? uniqueId,
    String? lastName,
    String? firstName,
    dynamic language,
    dynamic imageId,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
    String? tokenEffectiveDate,
    String? tokenEffectiveTimeStick,
  }) = _Credential;

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
}

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    String? userId,
    bool? isSuccess,
    String? confirmEmailToken,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
class Help with _$Help {
  const factory Help({
    int? id,
    String? name,
    @JsonKey(name: 'helpContentPage') List<HelpContentPage>? contents,
  }) = _Help;

  factory Help.fromJson(Map<String, dynamic> json) => _$HelpFromJson(json);
}

@freezed
class HelpContentPage with _$HelpContentPage {
  const factory HelpContentPage({String? title, String? fullDescriptions}) =
      _HelpContentPage;

  factory HelpContentPage.fromJson(Map<String, dynamic> json) =>
      _$HelpContentPageFromJson(json);
}

@freezed
class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse(
      String userId, String token, int resultCode) = _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}

@freezed
class Reward with _$Reward {
  const factory Reward({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? userId,
    String? uniqueId,
    String? street,
    String? city,
    String? state,
    String? country,
    String? zipCode,
    String? displayName,
    double? availablePoints,
    double? membershipTierID,
    String? tierTypeName,
    double? aqDolar,
    double? nextTeirPoits,
    String? recentActivities,
    RewardCustomProperties? customProperties,
  }) = _Reward;

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);
}

@freezed
class RewardCustomProperties with _$RewardCustomProperties {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory RewardCustomProperties(
      {List<RecentActivity>? recentActivities}) = _RewardCustomProperties;

  factory RewardCustomProperties.fromJson(Map<String, dynamic> json) =>
      _$RewardCustomPropertiesFromJson(json);
}

@freezed
class RecentActivity with _$RecentActivity {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory RecentActivity({
    int? transactionTypeFID,
    String? reservationUniqueID,
    int? reservationFID,
    String? customerFID,
    String? bookName,
    DateTime? bookingDate,
    DateTime? startDate,
    DateTime? endDate,
    String? currencyCode,
    String? cultureCode,
    int? qty,
    double? totalValue,
    double? points,
    int? fileStreamFID,
  }) = _RecentActivity;

  factory RecentActivity.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityFromJson(json);
}

// factory GoogleAuthData.fromDomain(
//     String googleId, String email, String fullName,
//     {String givenName, String familyName, String imageUrl}) {
//   return GoogleAuthData(
//       googleId: googleId,
//       email: email,
//       fullName: fullName,
//       givenName: givenName,
//       familyName: familyName,
//       imageUrl: imageUrl);
// }

// factory FBAuthData.fromDomain(String userId, String accessToken) {
//   return FBAuthData(userId: userId, accessToken: accessToken);
// }

// factory EmailAuthData.fromDomain(LoginEmailParams domain) {
//   return EmailAuthData(
//     email: domain.email.value,
//     password: domain.password.value,
//   );
// }

// Account toAccount() {
//   return Account(
//     name: name,
//     email: Email(email),
//     id: userId,
//     expired: expired,
//     userRole: userRole,
//     uniqueId: uniqueId,
//     accessToken: accessToken,
//     refreshToken: refreshToken,
//     tokenEffectiveDate: tokenEffectiveDate,
//     tokenEffectiveTimeStick: tokenEffectiveTimeStick,
//     firstName: Name(firstName),
//     lastName: Name(lastName),
//     language: language,
//     imageId: imageId,
//     phone: Phone(phoneNumber),
//   );
// }

// Credential toDomain() {
//   return Credential(
//     accountTypeFid: accountTypeFid,
//     name: name,
//     email: email,
//     userId: userId,
//     roleId: roleId,
//     expired: expired,
//     userRole: userRole,
//     uniqueId: uniqueId,
//     accessToken: accessToken,
//     refreshToken: refreshToken,
//     tokenEffectiveDate: tokenEffectiveDate,
//     tokenEffectiveTimeStick: tokenEffectiveTimeStick,
//     firstName: firstName,
//     lastName: lastName,
//     language: language,
//     imageId: imageId,
//     phoneNumber: phoneNumber,
//     // service: model.service,
//   );
// }