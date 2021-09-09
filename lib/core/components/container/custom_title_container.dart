import 'package:flutter/material.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class CustomTitleContainer extends StatelessWidget {
  final Widget widget;

  const CustomTitleContainer({Key? key, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      color: ColorSchemeLight.instance!.darkPurple,
      alignment: Alignment.centerLeft,
      padding: PaddingInsets.instance!.formPadding,
      child: widget,
    );
  }
}
