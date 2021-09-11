import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';

class CustomListTile extends StatelessWidget {
  final String title, subtitle;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MarginInsets.instance!.listTileMargin,
      decoration: BoxDecoration(
        color: ColorSchemeLight.instance!.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/circle.png',
            height: 16,
          ),
        ),
        title: CustomText(
          data: title,
          fontSize: 16,
          color: ColorSchemeLight.instance!.black,
        ),
        subtitle: CustomText(
          data: subtitle,
          fontSize: 14,
          color: ColorSchemeLight.instance!.darkGrey,
        ),
      ),
    );
  }
}
