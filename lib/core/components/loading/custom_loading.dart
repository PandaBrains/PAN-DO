import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: ColorSchemeLight.instance!.darkPurple,
            color: ColorSchemeLight.instance!.white,
          ),
          Container(
            margin: MarginInsets.instance!.listTileMargin,
            child: CustomText(
              data: 'Loading',
              color: ColorSchemeLight.instance!.darkPurple,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
