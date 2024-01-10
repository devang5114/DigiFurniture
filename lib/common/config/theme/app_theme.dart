import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      switchTheme: SwitchThemeData(
          trackOutlineColor: MaterialStateProperty.resolveWith(
              (states) => Colors.transparent)),
      popupMenuTheme: const PopupMenuThemeData(
          color: Colors.white,
          position: PopupMenuPosition.under,
          enableFeedback: true),
      chipTheme: ChipThemeData(side: BorderSide(color: Colors.grey.shade400)),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFFbe672f),
          onPrimary: Colors.white,
          secondary: const Color(0xFFf9eee7),
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.grey.shade300,
          onSurface: Colors.black));
  static ThemeData darkTheme = ThemeData.dark();
}
