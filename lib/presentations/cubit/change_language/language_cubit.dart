import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pet/data/models/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences,
      super(const LanguageState(Locale('en'))) {
    _getDefaultLanguage();
  }

  final SharedPreferences _sharedPreferences;

  Future<void> changeLanguage(String languageCode) async {
    final language = Language.supportedLanguages.firstWhere(
      (language) => language.code == languageCode,
    );

    emit(LanguageState(language.locale));
    _sharedPreferences.setString('__LANGUAGE_KEY__', languageCode);
  }

  void _getDefaultLanguage() {
    final savedLanguage = _sharedPreferences.getString('__LANGUAGE_KEY__');

    if (savedLanguage != null) {
      changeLanguage(savedLanguage);
    }
  }
}
