import 'package:aqb_api/aqb_api.dart';

import 'iconfig_service.dart';

class ConfigService implements IConfigService {
  ConfigService(this.api);

  late final ConfigApi api;

  @override
  Future<List<City>> getCities(int countryCode) async {
    final response = await api.getCities(countryCode);

    return response.responseData ?? <City>[];
  }

  @override
  Future<List<Country>> getCountries() async {
    final response = await api.getCountries();

    return response.responseData ?? <Country>[];
  }

  @override
  Future<List<District>> getDistricts(int cityCode) async {
    final response = await api.getDistricts(cityCode);

    return response.responseData ?? <District>[];
  }

  @override
  Future<List<PhoneCode>> getPhoneCodes() async {
    final response = await api.getPhoneCodes();

    return response.responseData ?? <PhoneCode>[];
  }
}
