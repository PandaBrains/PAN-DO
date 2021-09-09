import 'package:flutter/material.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';

class FormColumn extends StatelessWidget {
  final List<Widget>? children;

  const FormColumn({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: ColorSchemeLight.instance!.darkPurple,
      child: Container(
        decoration: BoxDecoration(
          color: ColorSchemeLight.instance!.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          border: Border.all(
            style: BorderStyle.none,
          ),
        ),
        child: Row(
          children: <Widget>[
            Spacer(flex: 1),
            Expanded(
              flex: 8,
              child: Column(
                children: children!,
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
