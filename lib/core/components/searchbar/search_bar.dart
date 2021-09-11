import 'package:flutter/material.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MarginInsets.instance!.formMarginLow * 2,
      padding: PaddingInsets.instance!.lowPaddingHorizontal,
      decoration: BoxDecoration(
        color: ColorSchemeLight.instance!.darkPurple,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          style: BorderStyle.none,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Görev Ara',
                hintStyle: TextStyle(
                  color: ColorSchemeLight.instance!.white.withOpacity(0.8),
                ),
              ),
              onChanged: onChanged,
              style: TextStyle(
                color: ColorSchemeLight.instance!.white,
              ),
            ),
          ),
          Icon(
            Icons.search,
            size: 24,
            color: ColorSchemeLight.instance!.white,
          ),
        ],
      ),
    );
  }
}
