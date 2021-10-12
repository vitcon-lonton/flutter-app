import 'package:aqb_api/aqb_api.dart';

mixin ILanguageService {
  Language? get language;
  List<Language>? get languages;
  Stream<List<Language>> watch();
  Stream<Language?> watchSelected();
  Future<void> update(Language language);
}
