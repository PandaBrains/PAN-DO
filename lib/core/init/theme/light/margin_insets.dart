class MarginInsets {
  static MarginInsets? _instace;
  static MarginInsets? get instance {
    if (_instace == null) _instace = MarginInsets._init();
    return _instace;
  }

  MarginInsets._init();
}
