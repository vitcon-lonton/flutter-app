import 'package:aqb_api/aqb_api.dart';

mixin IConfigService {
  Future<List<Country>> getCountries();

  Future<List<PhoneCode>> getPhoneCodes();

  Future<List<City>> getCities(int countryCode);

  Future<List<District>> getDistricts(int cityCode);
}
