import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/constants/app/app_constants.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';

class NotFoundNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemeLight.instance!.darkPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: MarginInsets.instance!.formMarginLow,
              decoration: BoxDecoration(
                color: ColorSchemeLight.instance!.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(style: BorderStyle.none),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 128,
                height: 128,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            CustomText(
              data: 'Not Found',
            ),
          ],
        ),
      ),
    );
  }
}
