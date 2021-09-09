import 'package:flutter/material.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText(
      {Key? key,
      required this.data,
      this.color,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      style: TextStyle(
        color: color == null ? ColorSchemeLight.instance!.white : color,
        fontSize: fontSize == null ? 32 : fontSize,
        fontFamily: ApplicationConstants.FONT_FAMILY,
        fontWeight: fontWeight == null ? FontWeight.w500 : fontWeight,
      ),
    );
  }
}
