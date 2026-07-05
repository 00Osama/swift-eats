import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeState { system, light, dark }

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeKey = 'themeMode';
  ThemeCubit() : super(ThemeState.system);

  Future<void> setThemeMode(ThemeState themeState) async {
    emit(themeState);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeState.name);
  }

  Future<void> loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTheme = prefs.getString(_themeKey);

    switch (storedTheme) {
      case 'dark':
        emit(ThemeState.dark);
        break;
      case 'light':
        emit(ThemeState.light);
        break;
      case 'system':
      default:
        emit(ThemeState.system);
    }
  }

  ThemeMode get themeMode {
    switch (state) {
      case ThemeState.light:
        return ThemeMode.light;
      case ThemeState.dark:
        return ThemeMode.dark;
      case ThemeState.system:
        return ThemeMode.system;
    }
  }
}
