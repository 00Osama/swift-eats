import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFEF3029);
  static const Color primaryDark = Color(0xFFCE2A28);
  static const Color secondary = Color(0xFF6E7C94);
  static const Color muted = Color(0xFF8F8E8E);
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6E7C94);
  static const Color background = Color(0xFFE5E7EB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceAlt = Color(0xFFF3F4F6);
  static const Color surfaceSubtle = Color(0xFFF5F5F5);
  static const Color border = Color(0xFFD1D5DB);
  static const Color shadow = Color(0x33000000);
  static const Color overlayBorder = Color(0x808F8E8E);
  static const Color skeletonBase = Color(0xFFE0E0E0);
  static const Color skeletonHighlight = Color(0xFFF5F5F5);
  static const Color skeletonDark = Color(0xFFBDBDBD);
  static const Color neutralButton = Color(0xFF616161);
  static const Color neutralButtonText = Color(0xFFEEEEEE);
  static const Color dropdownBackground = Color(0xFFBDBDBD);
  static const Color dropdownIcon = Color(0xFF2196F3);
  static const Color dropdownFocus = Color(0x8A000000);
  static const Color success = Color(0xFF4CAF50);
  static const Color danger = Color(0xFFF44336);
  static const Color dangerSoft = Color(0xFFFF8A80);
  static const Color editAction = Color(0xFFAC9F2E);
  static const Color deleteAction = Color(0xFFDF4E44);
  static const Color cropToolbar = Color(0xFFFF5722);
  static const Color chooseImageButton = Color(0xFF525C41);
  static const Color confirmButton = Color(0xFF4F8160);
  static const Color paymentOrange = Color(0xFFD35A01);
  static const Color paymentPink = Color(0xFFC62777);
  static const Color authAccent = Color(0xFF7271FD);

  static const Color darkBackground = Color(0xFF212121);
  static const Color darkSurface = Color(0xFF161618);
  static const Color darkSurfaceAlt = Color(0xFF242426);
  static const Color darkTextPrimary = Color(0xFFF3F4F6);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color darkBorder = Color(0xFF2C2C2E);
  static const Color darkMuted = Color(0xFF9E9E9E);
  static const Color darkNeutralButton = Color(0xFF424242);
}

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final base = ThemeData.light();
    final colorScheme = const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      error: AppColors.primary,
      onError: AppColors.white,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      cardColor: AppColors.surface,
      canvasColor: AppColors.background,
      dialogBackgroundColor: AppColors.surface,
      dividerColor: AppColors.border,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        shadowColor: AppColors.transparent,
        iconTheme: IconThemeData(color: AppColors.textSecondary),
        titleTextStyle: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
      textTheme: base.textTheme.copyWith(
        titleLarge: const TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyLarge: const TextStyle(
          fontFamily: 'Ubuntu',
          color: AppColors.textPrimary,
        ),
        bodyMedium: const TextStyle(
          fontFamily: 'Ubuntu',
          color: AppColors.textSecondary,
        ),
        labelLarge: const TextStyle(
          fontFamily: 'Ubuntu',
          color: AppColors.textSecondary,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.textSecondary,
        textColor: AppColors.textPrimary,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final base = ThemeData.dark();
    final colorScheme = const ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      error: AppColors.primary,
      onError: AppColors.white,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.primary,
      cardColor: AppColors.darkSurface,
      canvasColor: AppColors.darkBackground,
      dialogBackgroundColor: AppColors.darkSurface,
      dividerColor: AppColors.darkBorder,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        shadowColor: AppColors.transparent,
        iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
        titleTextStyle: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextPrimary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        hintStyle: const TextStyle(color: AppColors.darkTextSecondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
      textTheme: base.textTheme.copyWith(
        titleLarge: const TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: const TextStyle(
          fontFamily: 'Ubuntu',
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: const TextStyle(
          fontFamily: 'Ubuntu',
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: const TextStyle(
          fontFamily: 'Ubuntu',
          color: AppColors.darkTextPrimary,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.darkTextSecondary,
        textColor: AppColors.darkTextPrimary,
      ),
    );
  }
}
