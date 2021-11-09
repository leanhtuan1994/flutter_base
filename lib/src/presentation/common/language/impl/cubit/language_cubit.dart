import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../language_interactor.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final LanguageInteractor interactor;
  final String defaultLanguage;

  LanguageCubit({required this.interactor, required this.defaultLanguage})
      : super(LanguageInitial(defaultLanguage));

  Future<void> updateLanguage(String language) async {
    try {
      await interactor.changeLanguage(language);
      emit(LanguageSuccess(language));
    } catch (error) {
      emit(LanguageError(defaultLanguage));
    }
  }
}
