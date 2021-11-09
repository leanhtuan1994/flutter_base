part of '../injection.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    getIt.registerSingleton<LanguageCubit>(LanguageCubit(
        interactor: LanguageInteractorImpl(dataManager: getIt<DataManager>()),
        defaultLanguage: getIt<DataManager>().getLanguage()));
  }
}
