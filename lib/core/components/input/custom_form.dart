import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/margin_insets.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class CustomTextForm extends StatefulWidget {
  final String title, hintText;
  final bool isPassword, isEnabled;
  final TextInputType? type;
  final TextEditingController? controller;
  final FormFieldValidator<String> validator;

  const CustomTextForm({
    Key? key,
    required this.title,
    required this.hintText,
    this.type,
    this.isPassword = false,
    this.controller,
    required this.validator,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  late String _title, _hintText;
  late bool _isPassword;
  late TextInputType? _type;
  late TextEditingController? _controller;
  late FormFieldValidator<String> _validator;
  late bool _isEnabled;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _hintText = widget.hintText;
    _isPassword = widget.isPassword;
    _type = widget.type;
    _controller = widget.controller;
    _validator = widget.validator;
    _isEnabled = widget.isEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MarginInsets.instance!.formMarginLow,
      padding: PaddingInsets.instance!.formPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            data: _title,
            color: ColorSchemeLight.instance!.darkGrey,
            fontSize: 16,
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _controller,
            cursorColor: ColorSchemeLight.instance!.black,
            keyboardType: _type,
            obscureText: _isPassword ? true : false,
            enabled: _isEnabled,
            validator: _validator,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: PaddingInsets.instance!.formContentPadding,
                fillColor: ColorSchemeLight.instance!.alternativeGrey,
                filled: true,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                hintText: _hintText),
          )
        ],
      ),
    );
  }
}
