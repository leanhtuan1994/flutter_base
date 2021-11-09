part of '../data_manager.dart';

abstract class AppPreferences {
  Future<void> clear();

  void saveLanguage(String languageCode);
  String getLanguage();

  static const String keyLanguage = 'language';
}
