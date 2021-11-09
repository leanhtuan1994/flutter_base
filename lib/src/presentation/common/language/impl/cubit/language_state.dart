part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  final String language;

  const LanguageState({required this.language});

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {
  const LanguageInitial(String language) : super(language: language);
}

class LanguageLoading extends LanguageState {
  const LanguageLoading(String language) : super(language: language);
}

class LanguageSuccess extends LanguageState {
  const LanguageSuccess(String language) : super(language: language);
}

class LanguageError extends LanguageState {
  const LanguageError(String language) : super(language: language);
}
