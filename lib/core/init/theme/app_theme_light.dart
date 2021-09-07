import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        scaffoldBackgroundColor: colorSchemeLight!.grey,
      );

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight!.purple,
        primaryVariant: Colors.white,
        secondary: Colors.green,
        secondaryVariant: colorSchemeLight!.darkPurple,
        surface: Colors.blue,
        background: Color(0xfff6f9fc),
        error: Colors.red[900]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black,
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Color(0xFFF9B916),
        brightness: Brightness.light);
  }
}
