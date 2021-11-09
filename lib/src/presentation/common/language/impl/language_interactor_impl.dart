import '../language_interactor.dart';
import '../../../../data/datasources/local/data_manager.dart';

class LanguageInteractorImpl extends LanguageInteractor {
  final DataManager dataManager;

  LanguageInteractorImpl({required this.dataManager});

  @override
  Future<void> changeLanguage(String lang) async {
    dataManager.saveLanguage(lang);
  }
}
