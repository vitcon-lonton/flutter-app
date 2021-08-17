/* spell-checker: disable */
part of 'services.dart';

// const credentialKey = 'CREDENTIAL_KEY';
// const accessTokenKey = 'ACCESS_TOKEN_KEY';
// const refreshTokenKey = 'REFRESH_TOKEN_KEY';
const authHeader = {'requires-token': 'true'};

@RestApi(baseUrl: 'https://apidemo.aqbooking.com/api/v1.0/IdentityUserAPI/')
abstract class PaymentService {
  factory PaymentService(Dio dio, {String baseUrl}) = _PaymentService;

  @POST('/CheckOut/ProcessPayment')
  @Headers(authHeader)
  Future<BaseResponse<PaymentResponse>> checkout(@Body() CheckoutData data);
}

@RestApi(baseUrl: 'https://apidemo.aqbooking.com/api/v1.0/IdentityUserAPI/')
abstract class AccountService {
  factory AccountService(Dio dio, {String baseUrl}) = _AccountService;

  @GET('/Reward/{userId}')
  @Headers(authHeader)
  Future<BaseResponse<Reward>> getReward(String userId);

  @GET('/HelpType/GetByLangId/{language}')
  @Headers(authHeader)
  Future<BaseResponse<List<Help>>> getHelpsSupport(@Path() int language);

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
