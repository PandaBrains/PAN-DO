import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';

class AppUtils {
  void showSnacBar(BuildContext context, content) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CustomText(
          data: content,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        backgroundColor: ColorSchemeLight.instance!.black,
      ));
    } catch (e) {
      print(e);
    }
  }
}
