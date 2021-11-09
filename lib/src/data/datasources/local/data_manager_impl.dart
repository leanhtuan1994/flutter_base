part of 'data_manager.dart';

class DataManagerImpl extends DataManager {
  final AppPreferences appPreferences;

  DataManagerImpl({required this.appPreferences});

  @override
  Future<void> clear() async {
    appPreferences.clear();
  }

  @override
  String getLanguage() {
    return appPreferences.getLanguage();
  }

  @override
  void saveLanguage(String languageCode) {
    appPreferences.saveLanguage(languageCode);
  }
}
