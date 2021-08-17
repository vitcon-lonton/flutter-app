/* spell-checker: disable */
part of 'services.dart';

const getCountriesUrl = '/Countries';
const getCurrenciesUrl = '/Currencies';
const getLocationUrl = '/location/search';
const getCitiesUrl = '/Cities/CountryCode';
const getResourcesUrl = '/CommonResources';
const getDistrictsUrl = '/ZoneDistricts/CityCode';
const getPhoneCodesUrl = '/GetAllCountryPhoneCode';
const getMealPlansUrl = '/Airline/FlightMealPlanCodes';
const getAirportsUrl = '/Airport/SearchAirportByKeyword';
const getLanguagesUrl = '/CommonLanguagues/GetAllLanguagues';
const getFlightPartsUrl = '/Airport/FlightPartGetAllCountries';
const getCurrencyRateUrl = '/Currencies/GetCurrencyExchangeRate';
const getAirlineMembersUrl = '/Airline/FlightAirlineMemberClubs';
const getFlightAirportsUrl = '/Airport/SearchFlightDestinationByKeyword';

@RestApi(baseUrl: 'https://apidemo.aqbooking.com/api/v1.0/ConfigurationAPI/')
abstract class ConfigService {
  factory ConfigService(Dio dio, {String baseUrl}) = _ConfigService;

  @GET('https://www.aqbooking.com/about-us.html')
  Future<String> getAbout();

  @GET('https://www.aqbooking.com/privacy.html')
  Future<String> getPPolicy();

  @GET(getCountriesUrl)
  Future<BaseResponse<List<Country>>> getCountries();

  @GET(getMealPlansUrl)
  Future<BaseResponse<List<MealPlan>>> getMealPlans();

  @GET(getLanguagesUrl)
  Future<BaseResponse<List<Language>>> getLanguages();

  @GET(getCurrenciesUrl)
  Future<BaseResponse<List<Currency>>> getCurrencies();

  @GET(getPhoneCodesUrl)
  Future<BaseResponse<List<PhoneCode>>> getPhoneCodes();

  @GET(getFlightPartsUrl)
  Future<BaseResponse<List<FlightPart>>> getFlightParts();

  @GET(getAirlineMembersUrl)
  Future<BaseResponse<List<AirlineMember>>> getAirLineMemberClubs();

  @GET(getLocationUrl)
  Future<BaseResponse<List<Location>>> getLocations(
      @Query('keyword') String keyword);

  @GET('$getCitiesUrl/{countryCode}')
  Future<BaseResponse<List<City>>> getCities(@Path() int countryCode);

  @GET('$getDistrictsUrl/{cityCode}')
  Future<BaseResponse<List<District>>> getDistricts(@Path() int cityCode);

  @GET('$getAirportsUrl/{keyword}')
  Future<BaseResponse<List<Airport>>> getAirportsByKW(@Path() String keyword);

  @GET('$getFlightAirportsUrl/{keyword}')
  Future<BaseResponse<List<FlightAirport>>> getFlightAirports(
      @Path() String keyword);

  @POST('$getResourcesUrl/{language}')
  Future<BaseResponse<List<Resource>>> getResources(
      @Path() int language, @Body() List<String> types);

  @GET('$getCurrencyRateUrl/{base}/{exchange}')
  Future<BaseResponse<List<Rate>>> getExchangeRate(
      @Path() String base, @Path() String exchange);
}
