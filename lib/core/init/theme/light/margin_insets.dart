import 'package:flutter/material.dart';

class MarginInsets {
  static MarginInsets? _instace;
  static MarginInsets? get instance {
    if (_instace == null) _instace = MarginInsets._init();
    return _instace;
  }

  MarginInsets._init();

  final formMarginLow = EdgeInsets.symmetric(vertical: 8);
}
