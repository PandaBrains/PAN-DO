import 'package:flutter/material.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class CustomTitleContainer extends StatelessWidget {
  final Widget widget;
  final double? topLeftRadius,
      topRightRadius,
      bottomLeftRadius,
      bottomRightRadius,
      height;

  const CustomTitleContainer({
    Key? key,
    required this.widget,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeftRadius ?? 0),
          topRight: Radius.circular(topRightRadius ?? 0),
          bottomLeft: Radius.circular(bottomLeftRadius ?? 0),
          bottomRight: Radius.circular(bottomRightRadius ?? 0),
        ),
        color: ColorSchemeLight.instance!.purple,
      ),
      width: double.infinity,
      height: height,
      alignment: Alignment.centerLeft,
      padding: PaddingInsets.instance!.formPadding,
      child: widget,
    );
  }
}
