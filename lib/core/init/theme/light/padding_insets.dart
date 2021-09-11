import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaddingInsets {
  static PaddingInsets? _instace;
  static PaddingInsets? get instance {
    if (_instace == null) _instace = PaddingInsets._init();
    return _instace;
  }

  PaddingInsets._init();

  final lowPaddingAll = EdgeInsets.all(8);
  final lowPaddingHorizontal = EdgeInsets.symmetric(horizontal: 8, vertical: 0);
  final lowPaddingVertical = EdgeInsets.symmetric(horizontal: 0, vertical: 8);
  final formPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 0);
  final formPaddingVertical = EdgeInsets.symmetric(horizontal: 0, vertical: 24);
}
