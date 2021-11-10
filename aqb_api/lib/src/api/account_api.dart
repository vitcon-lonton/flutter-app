/* spell-checker: disable */
part of 'api.dart';

// const credentialKey = 'CREDENTIAL_KEY';
// const accessTokenKey = 'ACCESS_TOKEN_KEY';
// const refreshTokenKey = 'REFRESH_TOKEN_KEY';
const authHeader = {'requires-token': 'true'};

@RestApi(baseUrl: 'https://apidemo.aqbooking.com/api/v1.0/IdentityUserAPI/')
abstract class PaymentApi {
  factory PaymentApi(Dio dio, {String baseUrl}) = _PaymentApi;

  @POST('/CheckOut/ProcessPayment')
  @Headers(authHeader)
  Future<BaseResponse<PaymentResponse>> checkout(@Body() CheckoutData data);
}

@RestApi(baseUrl: 'https://apidemo.aqbooking.com/api/v1.0/IdentityUserAPI/')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/RequestTokenAuth')
  @Headers(authHeader)
  Future<BaseResponse<String>> getAccessToken(String refreshToken);

  @POST('/Auth')
  Future<BaseResponse<Credential>> emailAuth(@Body() EmailAuthData data);

  @POST('/FacebookAuth')
  Future<BaseResponse<Credential>> facebookAuth(@Body() FBAuthData data);

  @POST('/AppleAuthentication/SignIn')
  Future<BaseResponse<Credential>> appleAuth(@Body() AppleAuthData data);

  @POST('/GoogleAuth')
  Future<BaseResponse<Credential>> googleAuth(@Body() GoogleAuthData data);

  @POST('/Accounts/Register')
  Future<BaseResponse<RegisterResponse>> register(@Body() RegisterData data);
}

@RestApi(baseUrl: 'https://apidemo.aqbooking.com/api/v1.0/IdentityUserAPI/')
abstract class AdminApi {
  factory AdminApi(Dio dio, {String baseUrl}) = _AdminApi;

  @GET('/Accounts')
  @Headers(authHeader)
  Future<BaseResponse<Credential>> accounts();

  @GET('/Accounts/{key}')
  @Headers(authHeader)
  Future<BaseResponse<Credential>> account(@Path() String key);

  @DELETE('/Accounts/{key}')
  @Headers(authHeader)
  Future<BaseResponse<Credential>> deleteAccount(@Path() String key);
}

@RestApi(baseUrl: 'https://apidemo.aqbooking.com/api/v1.0/IdentityUserAPI/')
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;

  @GET('/Reward/{userId}')
  @Headers(authHeader)
  Future<BaseResponse<Reward>> getReward(@Path() String userId);

  @GET('/HelpType/GetByLangId/{language}')
  @Headers(authHeader)
  Future<BaseResponse<List<Help>>> getHelpsSupport(@Path() int language);

  // @POST('/RequestTokenAuth')
  // @Headers(authHeader)
  // Future<BaseResponse<String>> getAccessToken(String refreshToken);

  // @POST('/Auth')
  // Future<BaseResponse<Credential>> emailAuth(@Body() EmailAuthData data);

  // @POST('/FacebookAuth')
  // Future<BaseResponse<Credential>> facebookAuth(@Body() FBAuthData data);

  // @POST('/AppleAuthentication/SignIn')
  // Future<BaseResponse<Credential>> appleAuth(@Body() AppleAuthData data);

  // @POST('/GoogleAuth')
  // Future<BaseResponse<Credential>> googleAuth(@Body() GoogleAuthData data);

  // @POST('/Accounts/Register')
  // Future<BaseResponse<RegisterResponse>> register(@Body() RegisterData data);
}
