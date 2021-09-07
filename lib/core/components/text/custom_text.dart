import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const CustomText({Key? key, required this.data, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      style: this.style,
    );
  }
}
