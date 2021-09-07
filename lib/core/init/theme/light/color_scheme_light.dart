import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    if (_instace == null) _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color lightGrey = Color(0xFFDDDDDD);
  final Color grey = Color(0xFFE5E5E5);
  final Color darkGrey = Color(0xFFCCCCCC);
  final Color purple = Color(0xFF4263EC);
  final Color darkPurple = Color(0xFF2B49C3);
  final Color orange = Color(0xFFFB9F33);
  final Color white = Color(0xFFFFFFFF);
  final Color black = Color(0xFF000000);

}