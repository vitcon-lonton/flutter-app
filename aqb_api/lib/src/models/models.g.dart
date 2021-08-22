// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterData _$$_RegisterDataFromJson(Map<String, dynamic> json) =>
    _$_RegisterData(
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirm: json['passwordConfirm'] as String?,
      roleId: json['roleId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      merchantFid: json['merchantFid'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      domainFid: json['domainFid'] as String?,
      countryPhone: json['countryPhone'] as String?,
    );

Map<String, dynamic> _$$_RegisterDataToJson(_$_RegisterData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
      'roleId': instance.roleId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'merchantFid': instance.merchantFid,
      'phoneNumber': instance.phoneNumber,
      'domainFid': instance.domainFid,
      'countryPhone': instance.countryPhone,
    };

_$_GoogleAuthData _$$_GoogleAuthDataFromJson(Map<String, dynamic> json) =>
    _$_GoogleAuthData(
      googleId: json['googleId'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      givenName: json['givenName'] as String?,
      familyName: json['familyName'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_GoogleAuthDataToJson(_$_GoogleAuthData instance) =>
    <String, dynamic>{
      'googleId': instance.googleId,
      'email': instance.email,
      'fullName': instance.fullName,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'imageUrl': instance.imageUrl,
    };

_$_AppleAuthData _$$_AppleAuthDataFromJson(Map<String, dynamic> json) =>
    _$_AppleAuthData(
      code: json['code'] as String?,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$$_AppleAuthDataToJson(_$_AppleAuthData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'fullName': instance.fullName,
    };

_$_FBAuthData _$$_FBAuthDataFromJson(Map<String, dynamic> json) =>
    _$_FBAuthData(
      userId: json['userId'] as String?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$$_FBAuthDataToJson(_$_FBAuthData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accessToken': instance.accessToken,
    };

_$_EmailAuthData _$$_EmailAuthDataFromJson(Map<String, dynamic> json) =>
    _$_EmailAuthData(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_EmailAuthDataToJson(_$_EmailAuthData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$_Credential _$$_CredentialFromJson(Map<String, dynamic> json) =>
    _$_Credential(
      accountTypeFid: json['accountTypeFid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      userId: json['userId'] as String?,
      roleId: json['roleId'] as String?,
      expired: json['expired'] as String?,
      userRole: json['userRole'] as String?,
      uniqueId: json['uniqueId'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      language: json['language'],
      imageId: json['imageId'],
      phoneNumber: json['phoneNumber'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenEffectiveDate: json['tokenEffectiveDate'] as String?,
      tokenEffectiveTimeStick: json['tokenEffectiveTimeStick'] as String?,
    );

Map<String, dynamic> _$$_CredentialToJson(_$_Credential instance) =>
    <String, dynamic>{
      'accountTypeFid': instance.accountTypeFid,
      'name': instance.name,
      'email': instance.email,
      'userId': instance.userId,
      'roleId': instance.roleId,
      'expired': instance.expired,
      'userRole': instance.userRole,
      'uniqueId': instance.uniqueId,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'language': instance.language,
      'imageId': instance.imageId,
      'phoneNumber': instance.phoneNumber,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenEffectiveDate': instance.tokenEffectiveDate,
      'tokenEffectiveTimeStick': instance.tokenEffectiveTimeStick,
    };

_$_RegisterResponse _$$_RegisterResponseFromJson(Map<String, dynamic> json) =>
    _$_RegisterResponse(
      userId: json['userId'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      confirmEmailToken: json['confirmEmailToken'] as String?,
    );

Map<String, dynamic> _$$_RegisterResponseToJson(_$_RegisterResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isSuccess': instance.isSuccess,
      'confirmEmailToken': instance.confirmEmailToken,
    };

_$_Help _$$_HelpFromJson(Map<String, dynamic> json) => _$_Help(
      id: json['id'] as int?,
      name: json['name'] as String?,
      contents: (json['helpContentPage'] as List<dynamic>?)
          ?.map((e) => HelpContentPage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HelpToJson(_$_Help instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'helpContentPage': instance.contents,
    };

_$_HelpContentPage _$$_HelpContentPageFromJson(Map<String, dynamic> json) =>
    _$_HelpContentPage(
      title: json['title'] as String?,
      fullDescriptions: json['fullDescriptions'] as String?,
    );

Map<String, dynamic> _$$_HelpContentPageToJson(_$_HelpContentPage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'fullDescriptions': instance.fullDescriptions,
    };

_$_ForgotPasswordResponse _$$_ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ForgotPasswordResponse(
      json['userId'] as String,
      json['token'] as String,
      json['resultCode'] as int,
    );

Map<String, dynamic> _$$_ForgotPasswordResponseToJson(
        _$_ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'resultCode': instance.resultCode,
    };

_$_Reward _$$_RewardFromJson(Map<String, dynamic> json) => _$_Reward(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userId: json['userId'] as String?,
      uniqueId: json['uniqueId'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
      displayName: json['displayName'] as String?,
      availablePoints: (json['availablePoints'] as num?)?.toDouble(),
      membershipTierID: (json['membershipTierID'] as num?)?.toDouble(),
      tierTypeName: json['tierTypeName'] as String?,
      aqDolar: (json['aqDolar'] as num?)?.toDouble(),
      nextTeirPoits: (json['nextTeirPoits'] as num?)?.toDouble(),
      recentActivities: json['recentActivities'] as String?,
      customProperties: json['customProperties'] == null
          ? null
          : RewardCustomProperties.fromJson(
              json['customProperties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RewardToJson(_$_Reward instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'userId': instance.userId,
      'uniqueId': instance.uniqueId,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'displayName': instance.displayName,
      'availablePoints': instance.availablePoints,
      'membershipTierID': instance.membershipTierID,
      'tierTypeName': instance.tierTypeName,
      'aqDolar': instance.aqDolar,
      'nextTeirPoits': instance.nextTeirPoits,
      'recentActivities': instance.recentActivities,
      'customProperties': instance.customProperties,
    };

_$_RewardCustomProperties _$$_RewardCustomPropertiesFromJson(
        Map<String, dynamic> json) =>
    _$_RewardCustomProperties(
      recentActivities: (json['RecentActivities'] as List<dynamic>?)
          ?.map((e) => RecentActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RewardCustomPropertiesToJson(
        _$_RewardCustomProperties instance) =>
    <String, dynamic>{
      'RecentActivities': instance.recentActivities,
    };

_$_RecentActivity _$$_RecentActivityFromJson(Map<String, dynamic> json) =>
    _$_RecentActivity(
      transactionTypeFID: json['TransactionTypeFID'] as int?,
      reservationUniqueID: json['ReservationUniqueID'] as String?,
      reservationFID: json['ReservationFID'] as int?,
      customerFID: json['CustomerFID'] as String?,
      bookName: json['BookName'] as String?,
      bookingDate: json['BookingDate'] == null
          ? null
          : DateTime.parse(json['BookingDate'] as String),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      currencyCode: json['CurrencyCode'] as String?,
      cultureCode: json['CultureCode'] as String?,
      qty: json['Qty'] as int?,
      totalValue: (json['TotalValue'] as num?)?.toDouble(),
      points: (json['Points'] as num?)?.toDouble(),
      fileStreamFID: json['FileStreamFID'] as int?,
    );

Map<String, dynamic> _$$_RecentActivityToJson(_$_RecentActivity instance) =>
    <String, dynamic>{
      'TransactionTypeFID': instance.transactionTypeFID,
      'ReservationUniqueID': instance.reservationUniqueID,
      'ReservationFID': instance.reservationFID,
      'CustomerFID': instance.customerFID,
      'BookName': instance.bookName,
      'BookingDate': instance.bookingDate?.toIso8601String(),
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
      'CurrencyCode': instance.currencyCode,
      'CultureCode': instance.cultureCode,
      'Qty': instance.qty,
      'TotalValue': instance.totalValue,
      'Points': instance.points,
      'FileStreamFID': instance.fileStreamFID,
    };

_$_Currency _$$_CurrencyFromJson(Map<String, dynamic> json) => _$_Currency(
      currencyCode: json['currencyCode'] as String?,
      cultureCode: json['cultureCode'] as String?,
      resourceKey: json['resourceKey'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      text: json['text'] as String?,
      countryCode: json['countryCode'] as int?,
      rates: (json['rates'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as num),
      ),
    );

Map<String, dynamic> _$$_CurrencyToJson(_$_Currency instance) =>
    <String, dynamic>{
      'currencyCode': instance.currencyCode,
      'cultureCode': instance.cultureCode,
      'resourceKey': instance.resourceKey,
      'country': instance.country,
      'city': instance.city,
      'text': instance.text,
      'countryCode': instance.countryCode,
      'rates': instance.rates,
    };

_$_Language _$$_LanguageFromJson(Map<String, dynamic> json) => _$_Language(
      id: json['id'] as int?,
      languageName: json['languageName'] as String?,
      resourceKey: json['resourceKey'] as String?,
      uniqueId: json['uniqueId'] as String?,
      languageCode: json['languageCode'] as String?,
      cssClass: json['cssClass'] as String?,
      remarks: json['remarks'] as String?,
      displayName: json['displayName'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$_LanguageToJson(_$_Language instance) =>
    <String, dynamic>{
      'id': instance.id,
      'languageName': instance.languageName,
      'resourceKey': instance.resourceKey,
      'uniqueId': instance.uniqueId,
      'languageCode': instance.languageCode,
      'cssClass': instance.cssClass,
      'remarks': instance.remarks,
      'displayName': instance.displayName,
      'isActive': instance.isActive,
    };

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      countryCode: json['countryCode'] as int?,
      timeZone: (json['timeZone'] as num?)?.toDouble(),
      countryName: json['countryName'] as String?,
      description: json['description'] as String?,
      alphaCode2: json['alphaCode2'] as String?,
      alphaCode3: json['alphaCode3'] as String?,
      countryPhoneCode: json['countryPhoneCode'] as String?,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'timeZone': instance.timeZone,
      'countryName': instance.countryName,
      'description': instance.description,
      'alphaCode2': instance.alphaCode2,
      'alphaCode3': instance.alphaCode3,
      'countryPhoneCode': instance.countryPhoneCode,
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      cityCode: json['cityCode'] as int?,
      countryCode: json['countryCode'] as int?,
      cityName: json['cityName'] as String?,
      stateLst: json['stateLst'],
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'cityCode': instance.cityCode,
      'countryCode': instance.countryCode,
      'cityName': instance.cityName,
      'stateLst': instance.stateLst,
    };

_$_District _$$_DistrictFromJson(Map<String, dynamic> json) => _$_District(
      id: json['id'] as int?,
      cityCode: json['cityCode'] as int?,
      zoneDistrictName: json['zoneDistrictName'] as String?,
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityCode': instance.cityCode,
      'zoneDistrictName': instance.zoneDistrictName,
    };

_$_Rate _$$_RateFromJson(Map<String, dynamic> json) => _$_Rate(
      rateSell: (json['rateSell'] as num?)?.toDouble(),
      currencyBase: json['currencyBase'] as String?,
      currencyChange: json['currencyChange'] as String?,
    );

Map<String, dynamic> _$$_RateToJson(_$_Rate instance) => <String, dynamic>{
      'rateSell': instance.rateSell,
      'currencyBase': instance.currencyBase,
      'currencyChange': instance.currencyChange,
    };

_$_Resource _$$_ResourceFromJson(Map<String, dynamic> json) => _$_Resource(
      languageFid: json['languageFid'] as int?,
      resourceKey: json['resourceKey'] as String?,
      resourceValue: json['resourceValue'] as String?,
      typeOfResource: json['typeOfResource'] as String?,
    );

Map<String, dynamic> _$$_ResourceToJson(_$_Resource instance) =>
    <String, dynamic>{
      'languageFid': instance.languageFid,
      'resourceKey': instance.resourceKey,
      'resourceValue': instance.resourceValue,
      'typeOfResource': instance.typeOfResource,
    };

_$_PhoneCode _$$_PhoneCodeFromJson(Map<String, dynamic> json) => _$_PhoneCode(
      countryName: json['countryName'] as String?,
      countryPhoneCode: json['countryPhoneCode'] as String?,
    );

Map<String, dynamic> _$$_PhoneCodeToJson(_$_PhoneCode instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'countryPhoneCode': instance.countryPhoneCode,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      id: json['id'] as int?,
      cityName: json['cityName'] as String?,
      countryName: json['countryName'] as String?,
      districtName: json['districtName'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityName': instance.cityName,
      'countryName': instance.countryName,
      'districtName': instance.districtName,
      'type': instance.type,
    };

_$_Airport _$$_AirportFromJson(Map<String, dynamic> json) => _$_Airport(
      id: json['id'] as int?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      iata: json['iata'] as String?,
      icao: json['icao'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      altitude: json['altitude'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$_AirportToJson(_$_Airport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'iata': instance.iata,
      'icao': instance.icao,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'timezone': instance.timezone,
    };

_$_MealPlan _$$_MealPlanFromJson(Map<String, dynamic> json) => _$_MealPlan(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      isActivated: json['isActivated'] as bool?,
    );

Map<String, dynamic> _$$_MealPlanToJson(_$_MealPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'isActivated': instance.isActivated,
    };

_$_AirlineMember _$$_AirlineMemberFromJson(Map<String, dynamic> json) =>
    _$_AirlineMember(
      id: json['id'] as int?,
      allianceFId: json['allianceFId'] as int?,
      membership: json['membership'] as String?,
      airlineCode: json['airlineCode'] as String?,
      allianceName: json['allianceName'] as String?,
      airlineNames: json['airlineNames'] as String?,
      orderBy: json['orderBy'],
    );

Map<String, dynamic> _$$_AirlineMemberToJson(_$_AirlineMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'allianceFId': instance.allianceFId,
      'membership': instance.membership,
      'airlineCode': instance.airlineCode,
      'allianceName': instance.allianceName,
      'airlineNames': instance.airlineNames,
      'orderBy': instance.orderBy,
    };

_$_FlightPart _$$_FlightPartFromJson(Map<String, dynamic> json) =>
    _$_FlightPart(
      id: json['id'] as int?,
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String?,
      cityName: json['cityName'],
      iataCode: json['iataCode'],
      airportName: json['airportName'],
      showOnPrivateJet: json['showOnPrivateJet'] as bool?,
      showOnFlight: json['showOnFlight'] as bool?,
    );

Map<String, dynamic> _$$_FlightPartToJson(_$_FlightPart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'cityName': instance.cityName,
      'iataCode': instance.iataCode,
      'airportName': instance.airportName,
      'showOnPrivateJet': instance.showOnPrivateJet,
      'showOnFlight': instance.showOnFlight,
    };

_$_PayStepObject _$$_PayStepObjectFromJson(Map<String, dynamic> json) =>
    _$_PayStepObject(
      rateType: json['rateType'] as int?,
      rateTypeResKey: json['rateTypeResKey'] as String?,
      rateValue: (json['rateValue'] as num?)?.toDouble(),
      beforeDay: json['beforeDay'] as int?,
      payDate: json['payDate'] == null
          ? null
          : DateTime.parse(json['payDate'] as String),
    );

Map<String, dynamic> _$$_PayStepObjectToJson(_$_PayStepObject instance) =>
    <String, dynamic>{
      'rateType': instance.rateType,
      'rateTypeResKey': instance.rateTypeResKey,
      'rateValue': instance.rateValue,
      'beforeDay': instance.beforeDay,
      'payDate': instance.payDate?.toIso8601String(),
    };

_$_PayStep _$$_PayStepFromJson(Map<String, dynamic> json) => _$_PayStep(
      payDate: json['payDate'] == null
          ? null
          : DateTime.parse(json['payDate'] as String),
      payValue: (json['payValue'] as num?)?.toDouble(),
      payPercent: (json['payPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PayStepToJson(_$_PayStep instance) =>
    <String, dynamic>{
      'payDate': instance.payDate?.toIso8601String(),
      'payValue': instance.payValue,
      'payPercent': instance.payPercent,
    };

_$_FlightAirport _$$_FlightAirportFromJson(Map<String, dynamic> json) =>
    _$_FlightAirport(
      id: json['id'] as int?,
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String?,
      cityName: json['cityName'] as String?,
      iataCode: json['iataCode'] as String?,
      airportName: json['airportName'] as String?,
      showOnPrivateJet: json['showOnPrivateJet'] as bool?,
      showOnFlight: json['showOnFlight'] as bool?,
    );

Map<String, dynamic> _$$_FlightAirportToJson(_$_FlightAirport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'cityName': instance.cityName,
      'iataCode': instance.iataCode,
      'airportName': instance.airportName,
      'showOnPrivateJet': instance.showOnPrivateJet,
      'showOnFlight': instance.showOnFlight,
    };

_$_CardData _$$_CardDataFromJson(Map<String, dynamic> json) => _$_CardData(
      name: json['name'] as String?,
      cardNumber: json['cardNumber'] as String?,
      expMonth: json['exp_Month'] as int?,
      expYear: json['exp_Year'] as int?,
      cvc: json['cvc'] as String?,
    );

Map<String, dynamic> _$$_CardDataToJson(_$_CardData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cardNumber': instance.cardNumber,
      'exp_Month': instance.expMonth,
      'exp_Year': instance.expYear,
      'cvc': instance.cvc,
    };

_$_BookingInfoData _$$_BookingInfoDataFromJson(Map<String, dynamic> json) =>
    _$_BookingInfoData(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      emailOfUser: json['emailOfUser'] as String?,
      contactNo: json['contactNo'] as String?,
      idOfUser: json['idOfUser'] as String?,
      isEmailExist: json['isEmailExist'] as int?,
      customerNote: json['customerNote'] as String?,
      paymentCurrency: json['paymentCurrency'] as String?,
      paymentCultureCode: json['paymentCultureCode'] as String?,
      specialRequests: json['specialRequests'] as String?,
      country: json['country'] as String?,
      countryPhone: json['countryPhone'] as String?,
      listFlightInformation: (json['listFlightInformation'] as List<dynamic>?)
          ?.map((e) => FlightBookingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookingInfoDataToJson(_$_BookingInfoData instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'emailOfUser': instance.emailOfUser,
      'contactNo': instance.contactNo,
      'idOfUser': instance.idOfUser,
      'isEmailExist': instance.isEmailExist,
      'customerNote': instance.customerNote,
      'paymentCurrency': instance.paymentCurrency,
      'paymentCultureCode': instance.paymentCultureCode,
      'specialRequests': instance.specialRequests,
      'country': instance.country,
      'countryPhone': instance.countryPhone,
      'listFlightInformation': instance.listFlightInformation,
    };

_$_CheckoutData _$$_CheckoutDataFromJson(Map<String, dynamic> json) =>
    _$_CheckoutData(
      paymentmethod: json['paymentmethod'] as int?,
      transactionType: json['transactionType'] as int?,
      isPayNow: json['isPayNow'] as bool?,
      payLog: json['payLog'] == null
          ? null
          : PayLog.fromJson(json['payLog'] as Map<String, dynamic>),
      creditCardInfo: json['creditCardInfo'] == null
          ? null
          : CardData.fromJson(json['creditCardInfo'] as Map<String, dynamic>),
      bookingInformation: json['bookingInformation'] == null
          ? null
          : BookingInfoData.fromJson(
              json['bookingInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CheckoutDataToJson(_$_CheckoutData instance) =>
    <String, dynamic>{
      'paymentmethod': instance.paymentmethod,
      'transactionType': instance.transactionType,
      'isPayNow': instance.isPayNow,
      'payLog': instance.payLog,
      'creditCardInfo': instance.creditCardInfo,
      'bookingInformation': instance.bookingInformation,
    };

_$_PayLog _$$_PayLogFromJson(Map<String, dynamic> json) => _$_PayLog(
      itemId: json['itemId'] as String?,
      itemName: json['itemName'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PayLogToJson(_$_PayLog instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'value': instance.value,
    };

_$_PaymentErrorOption _$$_PaymentErrorOptionFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentErrorOption(
      type: json['type'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$_PaymentErrorOptionToJson(
        _$_PaymentErrorOption instance) =>
    <String, dynamic>{
      'type': instance.type,
      'errorMessage': instance.errorMessage,
    };

_$_PaymentResponse _$$_PaymentResponseFromJson(Map<String, dynamic> json) =>
    _$_PaymentResponse(
      orderId: json['orderId'] as int?,
      transactionType: json['transactionType'] as int?,
      transactionTypeRes: json['transactionTypeRes'] as String?,
      errorOptions: (json['errorOptions'] as List<dynamic>?)
          ?.map((e) => PaymentErrorOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PaymentResponseToJson(_$_PaymentResponse instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'transactionType': instance.transactionType,
      'transactionTypeRes': instance.transactionTypeRes,
      'errorOptions': instance.errorOptions,
    };

_$_FlightBookingData _$$_FlightBookingDataFromJson(Map<String, dynamic> json) =>
    _$_FlightBookingData(
      cartFID: json['cartFID'] as int?,
      flightPassengerInformations:
          (json['flightPassengerInformations'] as List<dynamic>?)
              ?.map((e) => PassengerInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_FlightBookingDataToJson(
        _$_FlightBookingData instance) =>
    <String, dynamic>{
      'cartFID': instance.cartFID,
      'flightPassengerInformations': instance.flightPassengerInformations,
    };

_$_PassengerInfo _$$_PassengerInfoFromJson(Map<String, dynamic> json) =>
    _$_PassengerInfo(
      documentSpecified: json['documentSpecified'] as bool?,
      gender: json['gender'] as String?,
      firstName: json['firstName'] as String?,
      surName: json['surName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      passengerType: json['passengerType'] as String?,
      routingType: json['routingType'] as String?,
      travelDocumentType: json['travelDocumentType'] as String?,
      idNumber: json['idNumber'] as String?,
      passportNumber: json['passportNumber'] as String?,
      passportExpiryDate: json['passportExpiryDate'] as String?,
      nationality: json['nationality'] as String?,
      placeOfIssue: json['placeOfIssue'] as String?,
      airlineMembership: json['airlineMembership'] as String?,
      membershipNumber: json['membershipNumber'] as String?,
      specialMealRequest: json['specialMealRequest'] as String?,
      seatNumberRequests: json['seatNumberRequests'] as String?,
    );

Map<String, dynamic> _$$_PassengerInfoToJson(_$_PassengerInfo instance) =>
    <String, dynamic>{
      'documentSpecified': instance.documentSpecified,
      'gender': instance.gender,
      'firstName': instance.firstName,
      'surName': instance.surName,
      'dateOfBirth': instance.dateOfBirth,
      'passengerType': instance.passengerType,
      'routingType': instance.routingType,
      'travelDocumentType': instance.travelDocumentType,
      'idNumber': instance.idNumber,
      'passportNumber': instance.passportNumber,
      'passportExpiryDate': instance.passportExpiryDate,
      'nationality': instance.nationality,
      'placeOfIssue': instance.placeOfIssue,
      'airlineMembership': instance.airlineMembership,
      'membershipNumber': instance.membershipNumber,
      'specialMealRequest': instance.specialMealRequest,
      'seatNumberRequests': instance.seatNumberRequests,
    };

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      statusCode: json['statusCode'] as int?,
      message: json['message'],
      responseData: _$nullableGenericFromJson(json['responseData'], fromJsonT),
      responseHeader: json['responseHeader'] as List<dynamic>?,
      fullResponseString: json['fullResponseString'] as String?,
      fullMsg: json['fullMsg'] as String?,
      isSuccessStatusCode: json['isSuccessStatusCode'] as bool?,
      aqStatusCode: json['aqStatusCode'] as String?,
      resourceKey: json['resourceKey'] as String?,
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
