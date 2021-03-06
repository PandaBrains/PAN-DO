import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color? backgroudColor;

  const CustomButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    this.backgroudColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      padding: PaddingInsets.instance!.formPadding,
      margin: MarginInsets.instance!.formMarginLow,
      child: ElevatedButton(
        onPressed: onPressed,
        child: CustomText(
          data: buttonName,
          fontSize: 24,
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            backgroudColor ?? ColorSchemeLight.instance!.orange,
          ),
        ),
      ),
    );
  }
}
