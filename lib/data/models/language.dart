import 'package:flutter/material.dart';

class Language {
  Language({required this.code, required this.locale, required this.name});

  final String code;
  final Locale locale;
  final String name;

  static List<Language> get supportedLanguages {
    return [
      Language(code: 'en', locale: const Locale('en'), name: 'English'),
      Language(code: 'sr', locale: const Locale('sr'), name: 'Srpski'),
    ];
  }

  static List<Map<String, String>> get availableLanguages {
    return supportedLanguages
        .map((language) => {'code': language.code, 'name': language.name})
        .toList();
  }
}
