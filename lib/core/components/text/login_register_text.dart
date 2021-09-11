import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class LoginRegisterText extends StatelessWidget {
  final String? firstText, secondText;
  final GestureRecognizer gestureRecognizer;

  const LoginRegisterText(
      {Key? key,
      required this.gestureRecognizer,
      this.firstText,
      this.secondText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingInsets.instance!.formPadding,
      margin: MarginInsets.instance!.formMarginLow,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: TextStyle(color: ColorSchemeLight.instance!.darkGrey),
          children: [
            TextSpan(
              text: secondText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: ColorSchemeLight.instance!.purple,
              ),
              recognizer: gestureRecognizer,
            ),
          ],
        ),
      ),
    );
  }
}
