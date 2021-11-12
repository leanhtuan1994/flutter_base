part of '../data_manager.dart';

class AppPreferencesImpl extends AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferencesImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> clear() async {
    await sharedPreferences.clear();
  }

  @override
  String getLanguage() {
    return sharedPreferences.getString(AppPreferences.keyLanguage) ?? 'vi';
  }

  @override
  void saveLanguage(String languageCode) {
    sharedPreferences.setString(AppPreferences.keyLanguage, languageCode);
  }

  @override
  bool isFirstOpenApp() {
    return sharedPreferences.getBool(AppPreferences.firstOpen) ?? true;
  }

  @override
  void saveFirstOpenApp() {
    sharedPreferences.setBool(AppPreferences.firstOpen, false);
  }
}
