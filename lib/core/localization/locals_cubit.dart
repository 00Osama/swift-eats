import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LanguageState { english, arabic }

class LanguageCubit extends Cubit<LanguageState> {
  static const String _languageKey = 'language';

  LanguageCubit() : super(LanguageState.english);

  Future<void> setLanguage(LanguageState languageState) async {
    emit(languageState);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageState.name);
  }

  Future<void> loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final storedLanguage = prefs.getString(_languageKey);

    switch (storedLanguage) {
      case 'arabic':
        emit(LanguageState.arabic);
        break;
      case 'english':
        emit(LanguageState.english);
      default:
        emit(LanguageState.arabic);
    }
  }

  Locale get locale {
    switch (state) {
      case LanguageState.arabic:
        return const Locale('ar');
      case LanguageState.english:
        return const Locale('en');
    }
  }
}
