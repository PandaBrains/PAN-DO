import 'package:flutter/material.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class FormColumn extends StatelessWidget {
  final List<Widget>? children;
  final GlobalKey<FormState>? formKey;

  const FormColumn({Key? key, this.children, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorSchemeLight.instance!.purple,
      child: Container(
        padding: PaddingInsets.instance!.formPaddingVertical,
        decoration: BoxDecoration(
          color: ColorSchemeLight.instance!.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border.all(
            style: BorderStyle.none,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(flex: 1),
            Expanded(
              flex: 18,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children!,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
