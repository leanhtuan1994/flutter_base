part of '../data_manager.dart';

abstract class AppPreferences {
  Future<void> clear();

  void saveLanguage(String languageCode);
  String getLanguage();

  void saveFirstOpenApp();
  bool isFirstOpenApp();

  static const String keyLanguage = 'language';
  static const String firstOpen = 'firstOpen';
}
