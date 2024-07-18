import 'package:flutter/material.dart';
import 'package:music_app/configs/theme/app_pallete.dart';

class AppTheme {
  /// Light Theme Config
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppPallete.lightBackground,
    fontFamily: 'Satoshi',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppPallete.lightGrey,
      selectionColor: AppPallete.lightGrey,
      selectionHandleColor: AppPallete.lightGrey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          const TextStyle(color: AppPallete.gradient2),
        ),
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppPallete.gradient2),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(top: 18, bottom: 18, left: 28),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5),
        borderRadius: BorderRadius.circular(36.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5),
        borderRadius: BorderRadius.circular(36.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: AppPallete.gradient2),
        borderRadius: BorderRadius.circular(36.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: AppPallete.red),
        borderRadius: BorderRadius.circular(36.0),
      ),
    ),
  );

  /// Dark Theme Config
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppPallete.darkBackground,
    fontFamily: 'Satoshi',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppPallete.lightGrey,
      selectionColor: AppPallete.lightGrey,
      selectionHandleColor: AppPallete.lightGrey,
    ), 
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          const TextStyle(color: AppPallete.gradient2),
        ),
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppPallete.gradient2),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(top: 18, bottom: 18, left: 28),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: AppPallete.whiteColor),
        borderRadius: BorderRadius.circular(36.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: AppPallete.whiteColor),
        borderRadius: BorderRadius.circular(36.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: AppPallete.gradient2),
        borderRadius: BorderRadius.circular(36.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: AppPallete.gradient2),
        borderRadius: BorderRadius.circular(36.0),
      ),
    ),
  );
}
