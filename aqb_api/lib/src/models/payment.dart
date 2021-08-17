/* spell-checker: disable */
// ignore_for_file: invalid_annotation_target
part of 'models.dart';

@freezed
class CardData with _$CardData {
  const factory CardData({
    String? name,
    String? cardNumber,
    @JsonKey(name: 'exp_Month') int? expMonth,
    @JsonKey(name: 'exp_Year') int? expYear,
    String? cvc,
  }) = _CardData;

  factory CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);
}

@freezed
class BookingInfoData with _$BookingInfoData {
  const factory BookingInfoData({
    String? firstName,
    String? lastName,
    String? emailOfUser,
    String? contactNo,
    String? idOfUser,
    int? isEmailExist,
    String? customerNote,
    String? paymentCurrency,
    String? paymentCultureCode,
    String? specialRequests,
    String? country,
    String? countryPhone,
    List<FlightBookingData>? listFlightInformation,
  }) = _BookingInfoData;

  factory BookingInfoData.fromJson(Map<String, dynamic> json) =>
      _$BookingInfoDataFromJson(json);
}

@freezed
class CheckoutData with _$CheckoutData {
  const factory CheckoutData({
    int? paymentmethod,
    int? transactionType,
    bool? isPayNow,
    PayLog? payLog,
    CardData? creditCardInfo,
    BookingInfoData? bookingInformation,
  }) = _CheckoutData;

  factory CheckoutData.fromJson(Map<String, dynamic> json) =>
      _$CheckoutDataFromJson(json);
}

@freezed
class PayLog with _$PayLog {
  const factory PayLog({
    String? itemId,
    String? itemName,
    double? value,
  }) = _PayLog;

  factory PayLog.fromJson(Map<String, dynamic> json) => _$PayLogFromJson(json);
}

@freezed
class PaymentErrorOption with _$PaymentErrorOption {
  const factory PaymentErrorOption({
    String? type,
    String? errorMessage,
  }) = _PaymentErrorOption;

  factory PaymentErrorOption.fromJson(Map<String, dynamic> json) =>
      _$PaymentErrorOptionFromJson(json);
}

@freezed
class PaymentResponse with _$PaymentResponse {
  const factory PaymentResponse({
    int? orderId,
    int? transactionType,
    String? transactionTypeRes,
    List<PaymentErrorOption>? errorOptions,
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
}

@freezed
class FlightBookingData with _$FlightBookingData {
  const factory FlightBookingData({
    int? cartFID,
    List<PassengerInfo>? flightPassengerInformations,
  }) = _FlightBookingData;

  factory FlightBookingData.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingDataFromJson(json);
}

@freezed
class PassengerInfo with _$PassengerInfo {
  const factory PassengerInfo({
    bool? documentSpecified,
    String? gender,
    String? firstName,
    String? surName,
    String? dateOfBirth,
    String? passengerType,
    String? routingType,
    String? travelDocumentType,
    String? idNumber,
    String? passportNumber,
    String? passportExpiryDate,
    String? nationality,
    String? placeOfIssue,
    String? airlineMembership,
    String? membershipNumber,
    String? specialMealRequest,
    String? seatNumberRequests,
  }) = _PassengerInfo;

  factory PassengerInfo.fromJson(Map<String, dynamic> json) =>
      _$PassengerInfoFromJson(json);
}
