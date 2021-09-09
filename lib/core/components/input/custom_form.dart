import 'package:flutter/material.dart';
import 'package:pan_do/core/components/text/custom_text.dart';
import 'package:pan_do/core/init/theme/light/color_scheme_light.dart';
import 'package:pan_do/core/init/theme/light/padding_insets.dart';

class CustomTextForm extends StatefulWidget {
  final String title;
  final String hintText;
  final bool isPassword;
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
  }) : super(key: key);

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  late String _title;
  late String _hintText;
  late bool _isPassword;
  late TextInputType? _type;
  late TextEditingController? _controller;
  late FormFieldValidator<String> _validator;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _hintText = widget.hintText;
    _isPassword = widget.isPassword;
    _type = widget.type;
    _controller = widget.controller;
    _validator = widget.validator;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
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
            cursorColor: Colors.black,
            keyboardType: _type,
            obscureText: _isPassword ? true : false,
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
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
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
